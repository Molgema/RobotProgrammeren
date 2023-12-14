MODULE MainModule
    !Socket variabelen
    VAR socketdev my_socket; 
    VAR string RedOn:="11";
    VAR string RedOff:="10";
    PERS bool startsync;
    VAR num adding := 0; 
    
    !Interrupt variabelen
    VAR intnum timeint; 
    PERS num counter; 
    
    PROC main()
        !Multitasking en trap handling met timer 
        CONNECT timeint WITH addInt;
        ITimer 1, timeint;
        !IDelete timeint; 
         
        WHILE TRUE DO
            WaitTime 10;
        ENDWHILE
        
        !Knipperen van lamp tijdens beweging
        !WaitUntil startsync;
        !SetLamp RedOn, RedOff;
    ENDPROC
    
    TRAP addInt
        adding := adding+1;
        
        IF adding = 5 THEN 
            counter:=counter+1;
            adding:=0; 
        ENDIF
    
    ENDTRAP
      
    PROC SetLamp(VAR string LampOn,VAR string LampOff)
        ConnectToLamp;
        WaitTime 0.125;
        SocketSend my_socket,\Str:=LampOn;
        WaitTime 0.125;
        SocketSend my_socket,\Str:=LampOff;
        SocketClose my_socket;         
    ENDPROC
    
    PROC ConnectToLamp()
        VAR num retryNum:=0;
        
        SocketCreate my_socket;
        SocketConnect my_socket,"127.0.0.1", 7777\Time:=5;  
    ERROR
        IF ERRNO=ERR_SOCK_TIMEOUT THEN
            IF retryNum<3 THEN 
                WaitTime 1; 
                retryNum:=retryNum+1; 
                RETRY;
            ELSE
                Stop; 
            ENDIF
        ENDIF         
    ENDPROC
ENDMODULE