MODULE MainModule
    PERS bool startsync; 
    PERS String state; 
    VAR socketdev my_socket; 
    PERS num sockErrorConFlag := 0;
    
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
        
        TEST stateRob
            CASE "Start" :
                SetLamp GreenOn;
                SetLamp GreenOff;
            CASE "Stop" :
                SetLamp YellowOn;
                SetLamp YellowOff;
            CASE "Idle":
                SetLamp RedOn;
            DEFAULT:
        ENDTEST
    ENDPROC
    
    PROC SetLamp(VAR string colour)
        ConnectToLamp;
        WaitTime 0.100;
        SocketSend my_socket,\Str:=colour;
        !WaitTime 0.100;
        !SocketSend my_socket,\Str:=LampOff;
        SocketClose my_socket;         
    ENDPROC
    
    PROC ConnectToLamp()
        VAR num retryNum:=0;
        sockErrorConFlag:=0;
        
        SocketCreate my_socket;
        SocketConnect my_socket,"127.0.0.1", 7777\Time:=15;  
    ERROR
        IF ERRNO=ERR_SOCK_TIMEOUT THEN
            IF retryNum<3 THEN 
                WaitTime 1; 
                retryNum:=retryNum+1; 
                RETRY;
            ELSE
                sockErrorConFlag:= 1;
                Stop; 
            ENDIF
        ENDIF         
    ENDPROC
ENDMODULE