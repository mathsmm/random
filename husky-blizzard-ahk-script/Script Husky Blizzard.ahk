; Habilita debug de teclas digitadas
; #InstallKeybdHook

; ABNT2 - Remapeia arrows com AppsKey (Botão entre o RWin e o RCtrl)
;
; Segure o AppsKey do teclado e as seguinte teclas:
; Cedilha          - Cima
; Ponto e vírgula  - Baixo
; Ponto            - Esquerda
; Barra            - Direita
; L                - Home
; Til              - End
; K                - Page up
; Vírgula          - Page down
;
; https://kbdlayout.info/kbdbr/scancodes
;
AppsKey::return
AppsKey & SC027:: Send {Blind}{Up}
AppsKey & SC035:: Send {Blind}{Down}
AppsKey & SC034:: Send {Blind}{Left}
AppsKey & SC073:: Send {Blind}{Right}
AppsKey & SC026:: Send {Blind}{Home}
AppsKey & SC028:: Send {Blind}{End}
AppsKey & SC025:: Send {Blind}{PgUp}
AppsKey & SC033:: Send {Blind}{PgDn}
; AppsKey::return
; AppsKey & SC027:: Send {Blind}{AppsKey up}{Up}
; AppsKey & SC035:: Send {Blind}{AppsKey up}{Down}
; AppsKey & SC034:: Send {Blind}{AppsKey up}{Left}
; AppsKey & SC073:: Send {Blind}{AppsKey up}{Right}
; AppsKey & SC026:: Send {Blind}{AppsKey up}{Home}
; AppsKey & SC028:: Send {Blind}{AppsKey up}{End}
; AppsKey & SC025:: Send {Blind}{AppsKey up}{PgUp}
; AppsKey & SC033:: Send {Blind}{AppsKey up}{PgDn}

; ABNT2 - Remapeia arrows com shift direito
;
; Segure o shift direito do teclado e as seguinte teclas:
; Acento agudo    - Cima
; Circunflexo     - Baixo
; Cedilha         - Esquerda
; Fecha colchetes - Direita
; P               - Home
; Abre colchetes  - End
; O               - Page up
; L               - Page down
;
; https://kbdlayout.info/kbdbr/scancodes
;
; RShift & SC01A:: Send {Blind}{RShift up}{Up}
; RShift & SC028:: Send {Blind}{RShift up}{Down}
; RShift & SC027:: Send {Blind}{RShift up}{Left}
; RShift & SC02B:: Send {Blind}{RShift up}{Right}
; RShift & SC019:: Send {Blind}{RShift up}{Home}
; RShift & SC01B:: Send {Blind}{RShift up}{End}
; RShift & SC018:: Send {Blind}{RShift up}{PgUp}
; RShift & SC026:: Send {Blind}{RShift up}{PgDn}

; ANSI - Remapeia HHKB arrows com shift direito
; RShift & [:: Send {Blind}{RShift up}{Up}
; RShift & `;:: Send {Blind}{RShift up}{Left}
; RShift & ':: Send {Blind}{RShift up}{Right}
; RShift & ?:: Send {Blind}{RShift up}{Down}
; RShift & p:: Send {Blind}{RShift up}{End}
; RShift & o:: Send {Blind}{RShift up}{Home}
; RShift & l:: Send {Blind}{RShift up}{PgUp}
; RShift & .:: Send {Blind}{RShift up}{PgDn}