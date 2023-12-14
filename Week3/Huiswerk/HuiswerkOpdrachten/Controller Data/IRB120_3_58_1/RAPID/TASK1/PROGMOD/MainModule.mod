MODULE MainModule
    CONST robtarget Target_10:=[[13.339457543,94.549134052,0.00304146],[0.2000503,-0.728111971,-0.629237448,-0.184100703],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[13.332826218,181.017070199,-0.002085504],[0.208470218,-0.0367133,0.938401725,-0.273119946],[1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[36.028653379,173.130972729,0.101493998],[0.192176514,0.008539127,0.934406114,-0.299800743],[1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_40:=[[68.886844506,181.679741052,0.004277473],[0.20763609,-0.040383239,0.933538766,-0.289416344],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_50:=[[86.992032728,204.238232069,-0.000542538],[0.248142733,0.022796746,0.968448604,-0.003576738],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_60:=[[90.570786944,224.931972594,-0.001231747],[0.314788255,-0.103404198,0.936171663,0.117467202],[0,-2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_70:=[[78.511692534,255.547076122,-0.002261983],[0.29266045,-0.161496995,0.929053949,0.158516062],[0,-2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_80:=[[50.000767435,272.032034665,-0.000958088],[0.256842653,-0.038605415,0.951258076,0.16628153],[1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_90:=[[50.004134212,335.457537805,-0.000775987],[0.303506126,0.382546019,0.871854043,0.037591258],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_100:=[[61.600998929,345.552637331,-0.004439553],[0.319393216,0.369031587,0.872813351,-0.000717926],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_110:=[[70.615208711,361.412818585,0.001383803],[0.319393434,0.369057732,0.87280218,-0.000761067],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_120:=[[73.35479978,378.457518754,-0.003354051],[0.3026277,0.064615344,0.945337596,0.10285019],[1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_130:=[[70.461044386,394.547866855,0.001970142],[0.319174324,0.330611414,0.888060707,0.01311581],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_140:=[[213.334289144,394.555724872,-0.001120603],[0.008745743,0.340533424,-0.920943807,0.189269658],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_150:=[[213.337859733,94.548493566,-0.001634481],[0.263393572,-0.331833974,-0.903578019,-0.063693041],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_160:=[[13.339442446,94.549137974,0.003048941],[0.174490808,0.006681271,0.984635768,-0.000849953],[1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget pAboveTable:=[[64.490127049,-10.856608738,2.57046336,-54.941495268,72.724596282,69.2785746],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget pHome:= [[0,0,0,0,30,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]; 
    !***********************************************************
    !
    ! Module:  MainModule
    !
    ! Description:
    !   <Insert description here>
    !
    ! Author: niels
    !
    ! Version: 1.0
    !
    !***********************************************************
    
    
    !***********************************************************
    !
    ! Procedure main
    !
    !   This is the entry point of your program
    !
    !***********************************************************
    
    VAR STRING matrixDamBord {10, 10}; 
    
    VAR intnum analoginputnum;
    
    
    PROC main()
        CONNECT analoginputnum WITH AnalogInpTrap; 
        ISignalAI AI1, AIO_BETWEEN, 100, 99, 0, analoginputnum;
        
        !Add your code here
        WHILE TRUE DO
            Path_20;
        ENDWHILE
        !GoHome; 
        !VullenDambord matrixDamBord;
        !CheckenPositieBord matrixDamBord;
    ENDPROC
    
    !Functies voor de interrupts bij opdracht 4
    TRAP AnalogInpTrap
        VAR robtarget currentpos; 
        
        StopMove\Quick; 
        currentpos:=CRobT(\Tool:=tTrainingTool \WObj:=wCurveThing);
        StorePath; 
        
        AboveTable; 
        TPReadFK reg1, "Doorgaan met laspad uitvoeren?", "Ja", "Nee",stEmpty,stEmpty,stEmpty;
        
        IF (reg1 = 2) THEN 
            GoHome;         
                
            WHILE reg2 <> 1 DO
                TPReadFK reg2, "Doorgaan met laspad uitvoeren?", "Ja", "Nee",stEmpty,stEmpty,stEmpty;
            ENDWHILE
            
            reg2:=0; 
        ENDIF
        
        MoveJ currentpos,v50,z100,tTrainingTool\WObj:=wCurveThing;
        RestoPath;
        StartMove; 
    ENDTRAP
    
    !Functies voor het dambord bij opdracht 3
    PROC VullenDambord (INOUT STRING dambord{*,*})
        FOR i FROM 1 TO 10 DO
            FOR j FROM 1 TO 10 DO
                IF((i+j) MOD 2 = 0) THEN 
                    dambord{i,j}:="WIT";
                ELSE
                    dambord{i,j}:="ZWART";
                ENDIF
            ENDFOR
        ENDFOR 
    ENDPROC
    
    PROC CheckenPositieBord (STRING gevuldDambord{*,*})
        VAR num rij; 
        VAR num kolom;
        VAR string positie; 
        
        TPReadNum rij, "Voer een getal tussen 1 en 10 voor de rij op het dambord.";
        TPReadNum kolom, "Voer een getal tussen 1 en 10 voor de kolom op het dambord.";
        positie:=gevuldDambord{rij, kolom};
        TPWrite "De uitgekozen positie is " + positie; 
    ENDPROC
    
    
    !Laspad voor opdracht 1 en 2
    PROC Path_20()
        MoveJSync Target_10,v50,z100,tTrainingTool\WObj:=wCurveThing, "SetDO1";
        MoveL Target_20,v50,fine,tTrainingTool\WObj:=wCurveThing;
        MoveJ Target_30,v50,z100,tTrainingTool\WObj:=wCurveThing;
        MoveJ Target_40,v50,z100,tTrainingTool\WObj:=wCurveThing;
        MoveJ Target_50,v50,z100,tTrainingTool\WObj:=wCurveThing;
        MoveJ Target_60,v50,z100,tTrainingTool\WObj:=wCurveThing;
        MoveJ Target_70,v50,z100,tTrainingTool\WObj:=wCurveThing;
        MoveJ Target_80,v50,z100,tTrainingTool\WObj:=wCurveThing;
        MoveL Target_90,v50,fine,tTrainingTool\WObj:=wCurveThing;
        MoveJ Target_100,v50,z100,tTrainingTool\WObj:=wCurveThing;
        MoveJ Target_110,v50,z100,tTrainingTool\WObj:=wCurveThing;
        MoveJ Target_120,v50,z100,tTrainingTool\WObj:=wCurveThing;
        MoveJ Target_130,v50,z100,tTrainingTool\WObj:=wCurveThing;
        MoveL Target_140,v50,fine,tTrainingTool\WObj:=wCurveThing;
        MoveL Target_150,v50,fine,tTrainingTool\WObj:=wCurveThing;
        MoveLSync Target_160,v50,z100,tTrainingTool\WObj:=wCurveThing, "ResetDO1";
    ENDPROC
    
    PROC SetDO1 ()
        SetDO do1, 1;
    ENDPROC
    
    PROC ResetDO1 ()
        SetDO do1, 0;
    ENDPROC
    
    PROC AboveTable()
        MoveAbsJ pAboveTable,v50,fine,tTrainingTool\WObj:=wCurveThing;
    ENDPROC
    
    PROC GoHome()
        MoveAbsJ pHome,v50,fine,tTrainingTool\WObj:=wCurveThing;
    ENDPROC
    
ENDMODULE