package com.sulake.core.communication.encryption
{
    import flash.utils.ByteArray;

    public interface IEncryption 
    {
        function init(_arg_1:ByteArray):void;
        function encipher(_arg_1:ByteArray):ByteArray;
        function decipher(_arg_1:ByteArray):ByteArray;
        function mark():void;
        function reset():void;
    }
}
