MODULE MainModule
    !Pad Variabelen
    CONST robtarget Target_Clock:=[[403.638935148,187.5,398.207368981],[0.438371147,0,0.898794046,0],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget JointTarget_1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_10:=[[0.000039621,-0.000009983,-0.000059144],[0,-0.000000013,1,0],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[62.500002181,-0.000018827,-0.00007846],[-0.000000076,-0.000000003,1,-0.000000008],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[125.000019433,-0.000022385,-0.000058098],[-0.000000053,0.000000019,1,-0.000000005],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_40:=[[187.500022936,0.00000085,-0.000062666],[-0.000000053,0.000000013,1,0.000000021],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_50:=[[250.000011297,-0.000008337,-0.000065551],[-0.000000062,0.000000007,1,0.000000009],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_60:=[[250.000020519,93.749996566,-0.000065816],[-0.000000057,-0.000000008,1,-0.000000005],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_70:=[[250.000023135,187.5,-0.000064444],[-0.000000055,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_80:=[[250.000020519,281.250003434,-0.000065816],[-0.000000057,0.000000008,1,0.000000005],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_90:=[[250.000011297,375.000008337,-0.000065551],[-0.000000062,-0.000000007,1,-0.000000009],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_100:=[[187.500022936,374.99999915,-0.000062666],[-0.000000053,-0.000000013,1,-0.000000021],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_110:=[[125.000019433,375.000022385,-0.000058098],[-0.000000053,-0.000000019,1,0.000000005],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_120:=[[62.500002181,375.000018827,-0.00007846],[-0.000000076,0.000000003,1,0.000000008],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_130:=[[0.000020608,375.000011918,-0.000070489],[-0.000000054,-0.000000041,1,-0.000000035],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_140:=[[0.000033988,281.250033004,-0.000052305],[-0.000000054,-0.000000005,1,0.000000025],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_150:=[[0.000049627,187.5,-0.000037155],[-0.000000052,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_160:=[[0.000033988,93.749966996,-0.000052305],[-0.000000054,0.000000005,1,-0.000000025],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    PERS String state := "Idle";
    
    PERS bool startsync := FALSE;
    PERS robtarget currentpos; 
    PERS num sockErrorConFlag;
    PERS num nFlexdata{3}; 
    
    PROC main()
        IF initRob = 0 THEN
            initDO;
            state := "Idle"; 
            startsync := FALSE; 
            sockErrorConFlag := 0; 
            setupTrap;     
            RestoPath; 
            initRob := 1; 
        ENDIF 
        
        TEST state 
        CASE "Idle":
        CASE "Start":
            startsync := TRUE;
            setupTrap;
            nFlexdata{2} := 0; 
            nFlexdata{3} := 0;
            reg1 := 0;
            FOR i FROM 0 TO nFlexdata{1}-1 DO 
                Path_10;
                nFlexdata{2}:=Progresbar(reg1,nFlexdata{1});
            ENDFOR
            state := "Idle";
        DEFAULT:
        ENDTEST
    ENDPROC
    
    TRAP trapStop
        state := "Stop";
        initDO;
         
        StopMove\Quick; 
        Rob1.current_p := CRobT(\Tool:=MyTool \WObj:=wTable);
        StorePath; 
        
        WHILE state = "Stop"  DO
        ENDWHILE
        
        IF state = "Start" THEN 
            RestoPath;
            StartMove; 
        ENDIF
    ENDTRAP
    
    TRAP trapReset
        StopMove\Quick;
        RestoPath; 
        StorePath; 
        MoveAbsJ JointTarget_1,v500,fine,MyTool\WObj:=wTable;
        initDO; 
        IDelete intReset;
        state:="Idle"; 
        ExitCycle; 
    ENDTRAP
    
    PROC setupTrap ()
        IDelete intReset; 
        CONNECT intReset WITH trapReset;
        ISignalDO resetDO, 1, intReset; 
        IDelete intStop; 
        CONNECT intStop WITH trapStop;
        ISignalDO stopDO, 1, intStop;
    ENDPROC 
    
    PROC initDO ()
        SetDO stopDO, 0;
        SetDO resetDO, 0;
    ENDPROC
    
    PROC StartClock()
        ClkReset timer;
        ClkStart timer;
    ENDPROC
    
    PROC StopClock()
        ClkStop timer;
        nFlexdata{3}:=nFlexdata{3} + ClkRead(timer);
    ENDPROC

    FUNC num Progresbar(num aantal,num nRotaties)
        RETURN ((100/(19*nRotaties))*aantal);
    ENDFUNC
    
    PROC Path_10()
        MoveAbsJ JointTarget_1,v500,fine,MyTool\WObj:=wTable;
        MoveJSync Target_Clock,v500,fine,MyTool\WObj:=wTable,"StartClock";
        Add reg1,1;
        MoveJ Target_10,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_20,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_30,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_40,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_50,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_60,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_70,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_80,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_90,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_100,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_110,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_120,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_130,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_140,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_150,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_160,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveJ Target_10,v500,z100,MyTool\WObj:=wTable;
        Add reg1,1;
        MoveAbsJ JointTarget_1,v500,fine,MyTool\WObj:=wTable;
        MoveJSync Target_Clock,v500,fine,MyTool\WObj:=wTable,"StopClock";
        Add reg1, 1; 
    ENDPROC
    
ENDMODULE