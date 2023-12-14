MODULE MainModule
	CONST robtarget pStartPos:=[[364.35,0.00,594.00],[0.5,-1.03468E-33,0.866025,1.81323E-34],[0,0,-1,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget pStartPos10:=[[364.35,-100.00,594.00],[0.5,7.39289E-8,0.866025,2.34841E-8],[-1,0,-1,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget pStartPos20:=[[464.35,-100.00,594.00],[0.5,4.98873E-8,0.866025,1.58467E-8],[-1,0,-1,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget pStartPos30:=[[464.35,0.00,594.00],[0.5,2.10292E-33,0.866025,3.96596E-33],[0,0,0,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
	CONST robtarget pStartPos40:=[[364.35,0.00,594.00],[0.5,-1.03468E-33,0.866025,1.81323E-34],[0,0,-1,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
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
        !Add your code here
        MoveJ pStartPos, v500, z50, tool0;
        MoveL pStartPos10, v500, z50, tool0;
        MoveL pStartPos20, v500, z50, tool0;
        MoveL pStartPos30, v500, z50, tool0;
        MoveL pStartPos40, v500, z50, tool0;
    ENDPROC
ENDMODULE