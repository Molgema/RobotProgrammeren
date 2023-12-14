MODULE MainModule
    CONST jointtarget pHome:= [[0,0,0,0,30,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_10:=[[-0.000012646,-289.300007188,499.999964135],[0,0,1,0.000000007],[-2,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    PROC Main()
        Path_10;
        MoveHome; 
    ENDPROC    
    
    PROC Path_10()
        MoveJ Target_10,v1000,z100,tool0\WObj:=wobj0;
    ENDPROC
    PROC MoveHome()
        MoveAbsJ pHome,v1000,z100,tool0\WObj:=wobj0;
    ENDPROC
ENDMODULE