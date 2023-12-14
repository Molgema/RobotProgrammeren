MODULE MainModule
    CONST jointtarget pHome:=[[0,0,0,0,30,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_10:=[[-0.000012646,-289.300007188,499.999964135],[0,0,1,0.000000007],[-2,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    !Variabelen van Screenmaker Opdrachten
    PERS string screenInput:="";
    PERS num tellerMoveHome:=0;
    PERS num resetInput:=0;

    !Variabelen van Socket Opdrachten
    VAR string data:="11";
    VAR socketdev my_socket;

    PROC Main()
        VAR num retryNum:=0; 
        
        SocketCreate my_socket;
        SocketConnect my_socket,"127.0.0.1", 8888;
        SocketSend my_socket,\Str:=data;
        SocketClose my_socket;
    
    ERROR
        IF ERRNO=ERR_SOCK_TIMEOUT THEN
            IF retryNum<5 THEN 
                WaitTime 1; 
                RETRY;
            ELSE 
                RaiseToUser\Errornumber:=ERRNO;
            ENDIF
        ENDIF
        
        !SocketInit;
        !SocketSendData data;

        !StateMachine screenInput;
        !ResetTeller tellerMoveHome, resetInput;
    ENDPROC

    !Answers to question: "Zoek in de "Application_Manual_ScreenMaker" op welke "Controls" er gekoppeld kunnen worden aan een array."
    !DataEditor ComboBox ListBox
    !Answers to question: "Zoek in dezelfde manual op welke mogelijke manieren er zijn om een variabele in je RAPID programma te schrijven."
    !Write a rapid data met controls van screenmaker

    PROC SocketInit()
        SocketCreate my_socket;
    ENDPROC

    PROC SocketSendData(VAR string sendData)
        SocketConnect my_socket,"127.0.0.1",8888;
        SocketSend my_socket,\Str:=sendData;
        SocketClose my_socket;
    ENDPROC

    PROC StateMachine(PERS string event)
        TEST event
        CASE "MoveTarget":
            MoveTarget;
            event:="";
        CASE "MoveHome":
            MoveHome;
            event:="";
            tellerMoveHome:=tellerMoveHome+1;
        ENDTEST
    ENDPROC

    PROC ResetTeller(PERS num teller,PERS num input)
        IF input=1 THEN
            input:=0;
            teller:=0;
        ELSE
        ENDIF
    ENDPROC

    PROC MoveTarget()
        MoveJ Target_10,v50,z100,tool0\WObj:=wobj0;
    ENDPROC

    PROC MoveHome()
        MoveAbsJ pHome,v50,fine,tool0\WObj:=wobj0;
    ENDPROC
ENDMODULE