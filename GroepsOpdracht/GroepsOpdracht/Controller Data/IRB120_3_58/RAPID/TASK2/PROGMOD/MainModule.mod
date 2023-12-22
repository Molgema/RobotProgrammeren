MODULE MainModule
    PERS bool startsync; 
    PERS String state; 
    VAR socketdev my_socket; 
    PERS num sockErrorConFlag := 1; 
    
    PROC main()
        WaitUntil startsync;      
        LampState state; 
    ENDPROC
    
    PROC LampState (PERS string stateRob)
        VAR string RedOn:="11";
        VAR string RedOff:="10";
        VAR string YellowOn:="21";
        VAR string YellowOff:="20";
        VAR string GreenOn:="31";
        VAR string GreenOff:="30";
        VAR num blinkTime := 0.1; 
        
        TEST stateRob
            CASE "Start" :
                SetLamp GreenOn, blinkTime;
                SetLamp GreenOff, blinkTime;
                
                IF stateRob <> "Start" THEN 
                    SetLamp GreenOff, blinkTime; 
                ENDIF
            CASE "Stop" :
                SetLamp YellowOn, blinkTime;
                SetLamp YellowOff, blinkTime;
                
                IF stateRob <> "Stop" THEN 
                    SetLamp YellowOff, blinkTime; 
                ENDIF
            CASE "Idle":
                    SetLamp RedOn, blinkTime;
                    IF stateRob <> "Idle" THEN 
                        SetLamp RedOff, blinkTime; 
                    ENDIF
            DEFAULT:
        ENDTEST
    ENDPROC
    
    PROC SetLamp(VAR string colour, VAR num delay)
        ConnectToLamp;
        WaitTime delay;
        SocketSend my_socket,\Str:=colour;
        SocketClose my_socket; 
    ENDPROC
    
    PROC ConnectToLamp()
        VAR num retryNum:=0;
        sockErrorConFlag:=0;
        
        SocketCreate my_socket;
        SocketConnect my_socket,"127.0.0.1", 7777\Time:=5;  
    ERROR
        IF ERRNO=ERR_SOCK_TIMEOUT THEN
            !SocketClose my_socket; 
            
            IF retryNum<2 THEN 
                WaitTime 1; 
                retryNum:=retryNum+1; 
                RETRY;
            ELSE
                sockErrorConFlag:= 1;
                TPWrite("Er is geen verbinding meer met de socketlamp. Restart het programma."); 
                Stop; 
            ENDIF
        ENDIF         
    ENDPROC
ENDMODULE