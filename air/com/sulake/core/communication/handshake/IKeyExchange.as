//com.sulake.core.communication.handshake.IKeyExchange

package com.sulake.core.communication.handshake{
    public /*dynamic*/ interface IKeyExchange {

        function init(k:String, _arg_2:uint=16):Boolean;
        function generateSharedKey(k:String, _arg_2:uint=16):String;
        function getSharedKey(k:uint=16):String;
        function getPublicKey(k:uint=16):String;

    }
}//package com.sulake.core.communication.handshake

