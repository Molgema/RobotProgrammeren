MODULE MainModule
    VAR socketdev my_socket;
    PERS string inputVenster;
    PERS num sockErrorConFlag := 0;
    
    PROC main() 
        LampState inputVenster;
    ENDPROC
    
    PROC LampState (PERS string colour)
        VAR string RedOn:="11";
        VAR string RedOff:="10";
        VAR string YellowOn:="21";
        VAR string YellowOff:="20";
        VAR string GreenOn:="31";
        VAR string GreenOff:="30";
        
        TEST colour
        CASE "Rood" :
            SetLamp RedOn, RedOff;
        CASE "Geel" :
            SetLamp YellowOn, YellowOff;
        CASE "Groen" :
            SetLamp GreenOn, GreenOff;
        DEFAULT : 
            ConnectToLamp;
            SocketClose my_socket;
        ENDTEST
    ENDPROC
    
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
        sockErrorConFlag:=0;
        
        SocketCreate my_socket;
        SocketConnect my_socket,"127.0.0.1", 7777\Time:=5;  
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