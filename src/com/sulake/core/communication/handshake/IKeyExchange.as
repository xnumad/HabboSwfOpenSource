package com.sulake.core.communication.handshake
{
    public interface IKeyExchange 
    {
        function init(_arg_1:String, _arg_2:uint=16):Boolean;
        function generateSharedKey(_arg_1:String, _arg_2:uint=16):String;
        function getSharedKey(_arg_1:uint=16):String;
        function getPublicKey(_arg_1:uint=16):String;
        function _Str_20000():Boolean;
        function _Str_21716():Boolean;
    }
}
