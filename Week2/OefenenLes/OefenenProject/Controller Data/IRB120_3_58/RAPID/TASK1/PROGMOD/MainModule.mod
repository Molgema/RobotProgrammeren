MODULE MainModule
        CONST robtarget Target_10:=[[364.353826402,0,593.999995375],[0.499999968,0,0.866025422,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[364.350003999,-150.000012968,593.999948931],[0.500000003,-0.000000009,0.866025402,-0.000000011],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[464.349996964,-150.000004094,593.999954373],[0.50000001,-0.000000015,0.866025398,-0.000000004],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_40:=[[464.349992876,0,593.999954404],[0.500000007,0,0.8660254,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_50:=[[464.349996964,-150.000004094,593.999954373],[0.50000001,-0.000000015,0.866025398,-0.000000004],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_60:=[[364.350003999,-150.000012968,593.999948931],[0.500000003,-0.000000009,0.866025402,-0.000000011],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_70:=[[364.35000662,0,593.999946155],[0.499999995,0,0.866025407,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS num Teller := 0; 
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
    PROC main()
        
        FOR Teller FROM 0 TO 3 DO
            Path_10;
        ENDFOR 
    ENDPROC
    PROC Path_10()
        MoveJ Target_10,v500, z50,tool0\WObj:=wobj0;
        MoveL Target_20,v500,z50,tool0\WObj:=wobj0;
        MoveL Target_30,v500,z50,tool0\WObj:=wobj0;
        MoveL Target_40,v500,z50,tool0\WObj:=wobj0;
        MoveL Target_50,v500,z50,tool0\WObj:=wobj0;
        MoveL Target_60,v500,z50,tool0\WObj:=wobj0;
        MoveL Target_70,v500,z50,tool0\WObj:=wobj0;
    ENDPROC
ENDMODULE