	include "p18f1320.inc" ;include the defaults for the chip

    udata
v_i2c_device_addr res 1
v_i2c_p_send_data res 2
v_i2c_received_data res 1
v_i2c_data_size res 1
v_i2c_adress_byte res 1
v_i2c_data_byte res 1
_v_i2c_data_type res 1

  extern v_i2c_data_byte_to_send
  extern v_i2c_data_byte_received
  extern v_i2c_status
	extern f_i2c_init
	extern f_i2c_start
	extern f_i2c_stop
	extern f_i2c_send_byte
	extern f_i2c_check_slave_ack


  code

_f_i2c_send
  btfsc _v_i2c_data_type,0 ;0 pour un octet d'adresse / 1 pour un octet de donnée
  goto _f_i2c_send_3
_f_i2c_send_2 ; octet d'adresse
  movf v_i2c_adress_byte,W
  movwf v_i2c_data_byte_to_send
  call f_i2c_start
  goto _f_i2c_send_4
_f_i2c_send_3 ;octet de donnée
  movf v_i2c_data_byte,W
  movwf v_i2c_data_byte_to_send
_f_i2c_send_4
  call f_i2c_send_byte
  call f_i2c_check_slave_ack

  return

_f_i2c_send_stop
  call f_i2c_stop
  return

;-----------------------------------------
;Fonction : Ecriture de données sur un device
;Nom : f_i2c_write_in_device
;Entrée :
;    -v_i2c_device_addr : adresse du device concerné
;    -v_i2c_data_size : taille des données (en octets)
;    -v_i2c_p_send_data : pointeur sur les données
;Sortie :
;Traitement :
; 1. Faire une trame write (adresse + données)
; 1.1 récupérer l'adresse du device dans W
; 1.2 Mettre le bit R/W à 0
; 1.3 recopier w dans v_i2c_adress_byte
; 1.4 envoyer l'octet d'adresse
; 2. Préparer le (ou les) octets de données à envoyer
; 2.1 Récuperer le pointeur (12 bits) dans FSR0
; 2.2 récupérer 1 octet pointés par FSR0 dans v_i2c_data_byte
; 2.3 envoyer l'octet de données
; 2.4 s'il reste des octets à envoyer, recommencer en 2.2
f_i2c_write_in_device
  rlcf v_i2c_device_addr,W
  andlw 0xFE    ;R/W = 0
  movwf v_i2c_adress_byte
  clrf _v_i2c_data_type
  call _f_i2c_send
_f_i2c_write_in_device_2
  movf v_i2c_p_send_data,W
  movwf FSR0H
  movf v_i2c_p_send_data+1,W
  movwf FSR0L
_f_i2c_write_in_device_2_2
  bsf _v_i2c_data_type,0
  movf POSTINC0,W
  movwf v_i2c_data_byte
  call _f_i2c_send
  decfsz v_i2c_data_size,f
  goto _f_i2c_write_in_device_2_2
  call _f_i2c_send_stop
  return

;-----------------------------------------
;Fonction : Lecture de données sur un device
;Nom : f_i2c_read_in_device
;Entrée :
;Sortie :
;Traitement :
;	1.faire une trame write complète (adresse +donnée)
; 2.envoyer cette trame
; 3. faire une trame read incomplète (seule avec la partie adresse
; 4.lire la trame reçue)

f_i2c_read_in_device

  return

  global v_i2c_device_addr
  global v_i2c_p_send_data
  global v_i2c_received_data
  global v_i2c_data_size
  global v_i2c_adress_byte
  global v_i2c_data_byte

  global f_i2c_write_in_device
  global f_i2c_read_in_device

  end
