MODULE MainModule
    CONST robtarget Target_10:=[[-285.571688851,-254.029837254,381.276356624],[-0.000000084,-0.00000001,1,-0.000000053],[-2,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pHome:=[[364.353829072,0,594],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS bool startsync:=FALSE;
    VAR intnum pers1int;
    PERS num counter := 331; 
    
    
    !Hoeveel taken kunnen er op hetzelfde moment worden uitgevoerd met gebruik van de multitask optie?
    !Tot 20 verschillende taken kunnen uitgevoerd worden. 
    
    !Welke manieren van intertask communicatie zijn er ?
    !PERS variabelen, wachten op andere tasks, synchronisatie tussen taken en gebruikmaken van een dispatcher. 
    
    !Welke functie kun je gebruiken om te kijken of een bepaalde resource al door een andere taak wordt gebruikt? 
    !Hiervoor kan de functie TestAndSet gebruikt worden.
    
    !Wat voor type taken zijn er en hoe maak je deze aan? 
    !Normal, static en semistatic. Kunnen aangemaakt worden via config -> controller -> tasks -> new task.
    
    !Waar moet je goed op letten bij het gebruik van meerdere taken ?(Hierbij doel ik op het berekeningsvermogen van de controller)
    !Achtergrond taken kunnen onnodig veel rekenkracht innemen als ze niet goed ingesteld zijn met de onderlinge communicatie tussen taken. 

PROC main()
    !Multitasking en trap handling
    WaitTime 10; 
    CONNECT pers1int WITH iroutine1;
    IPERS counter, pers1int; 
    IDelete pers1int; 
    
    WHILE TRUE DO
        WaitTime 10;
    ENDWHILE
    
    !Knipperen van lamp tijdens beweging
    !setSync;
    !MoveTarget;
    !MoveHome;
    !resetSync;
    !WaitTime 5;
ENDPROC

TRAP iroutine1 
    MoveTarget; 
    MoveHome;
ENDTRAP

PROC MoveHome()
    MoveJ pHome,v1000,fine,tool0\WObj:=wobj0;
ENDPROC


PROC MoveTarget()
    MoveJ Target_10,v1000,fine,tool0\WObj:=wobj0;
ENDPROC

PROC setSync ()
    startsync:=TRUE;
ENDPROC

PROC resetSync ()
    startsync:=FALSE;
ENDPROC

ENDMODULE