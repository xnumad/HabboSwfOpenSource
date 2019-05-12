package com.sulake.core.communication.wireformat
{
    import flash.utils.ByteArray;
    import com.sulake.core.communication.connection.IConnection;

    public interface IWireFormat 
    {
        function dispose():void;
        function encode(header:int, messageBuffer:Array):ByteArray;
        function decode(buffer:ByteArray, socket:IConnection):Array;
    }
}
