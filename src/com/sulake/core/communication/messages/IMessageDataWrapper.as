package com.sulake.core.communication.messages
{
    public interface IMessageDataWrapper 
    {
        function getID():int;
        function readString():String;
        function readInteger():int;
        function readBoolean():Boolean;
        function readShort():int;
        function readByte():int;
        function readFloat():Number;
        function readDouble():Number;
        function get bytesAvailable():uint;
    }
}
