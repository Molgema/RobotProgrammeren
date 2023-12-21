MODULE MainModule
    CONST jointtarget JointTarget_1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_10:=[[0.000039621,-0.000009983,-0.000059144],[0,-0.000000013,1,0],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    PROC main()
        Path_10; 
    ENDPROC
    
    PROC Path_10()
        MoveAbsJ JointTarget_1,v1000,z100,MyTool\WObj:=wTable;
        MoveJ Target_10,v1000,z100,MyTool\WObj:=wTable;
    ENDPROC
ENDMODULE