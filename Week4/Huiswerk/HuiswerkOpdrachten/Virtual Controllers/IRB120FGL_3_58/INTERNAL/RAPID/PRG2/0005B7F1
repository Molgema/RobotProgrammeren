MODULE MainModule
    VAR string data:="11";
    VAR socketdev my_socket;

    PROC Main()
        !SocketCreate my_socket;
        !SocketConnect my_socket,"127.0.0.1",8888;
        !SocketSend my_socket,\Str:=data;
        !SocketClose my_socket;
        VAR num ok:=0;
    ENDPROC
ENDMODULE