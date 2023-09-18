<?php

include '/Applications/XAMPP/htdocs/API/lib/push.php';

class Inicio_Ctrl
{
    public function Obtener_Totales($f3)
    {
        $M_Usuarios = new M_Usuarios();
        $M_Clientes = new M_Clientes();
        $M_Pedidos = new M_Pedidos();
        $M_Productos = new M_Productos();
        
        echo json_encode([
            'mensaje' => '',
            'info' => [
                'pedidos' => $M_Pedidos->count(),
                'productos' => $M_Productos->count(),
                'clientes' => $M_Clientes->count(),
                'usuarios' => $M_Usuarios->count(),
            ]
        ]);
    }

    public function Test_Notificacion($f3)
    {
        $r = Push::android(['mtitle' => "Notificacion de prueba", 'mdesc' => "Esta es una notificacion " . date("Y-m-d H:i:s")], "eb6HL0druPs:APA91bFWZo2k2dY_T4HuD8mXUuxIkOYbjOboygcYCMz2SZqwHCNNzBk7YmFHdFyxUICjwlMPcVcqrXemqbSPCS8ioPFGKcVZbrxSZMQV23cHPddwSbrCorX68Ce16s8wDlFuZVLr8Yyv");
        var_dump($r);
    }
}
