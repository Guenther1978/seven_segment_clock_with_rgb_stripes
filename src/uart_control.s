    ;;
    ; @file
    ;;

    ;;
    ; @fn init_UART
    ; @brief Initializes the UART module
    ;;
init_UART:
    push    r16
    sbi     UCSRB, 4
    sbi     UCSRB, 3
    ldi     r16, F_CPU/(BAUC * 16) - 1
    out     UBRRL, r16
    pop     r16
    ret

    ;;
    ; @fn putChar
    ; @brief Sends a character
    ;;
putChar:
    sbis    UCSRA, 5
    rjmp    putChar
    out     UDR, r16
    ret

    ;;
    ; @fn sendBCD
    : @brief BCDs
    ;;
sendBCD:
	push	r16
	lsr	r16
	lsr	r16
	lsr	r16
	lsr	r16
	ori	r16, 0x30
	rcall	putChar
	pop	r16
	push	r16
	andi	r16, 0x0f
	ori	r16, 0x30
	rcall	putChar
	pop	r16
	ret
