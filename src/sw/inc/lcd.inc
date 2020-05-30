#define LCD_PORT PORTB
#define LCD_TRIS TRISB
#define LCD_RS 0
#define LCD_E 1

#define FSM_TIMER 50

#define FSM_TOGGLE_LCD_STATE_0 0;start
#define FSM_TOGGLE_LCD_STATE_1 1;chaîne affiché
#define FSM_TOGGLE_LCD_STATE_2 2;chaine non affiché
#define FSM_TOGGLE_LCD_STATE_3 3;contenu de la chaine modifié
#define FSM_TOGGLE_LCD_STATE_4 4;fini
