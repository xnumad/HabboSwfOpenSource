//com.sulake.core.communication.messages.IMessageDataWrapper

package com.sulake.core.communication.messages{
    public /*dynamic*/ interface IMessageDataWrapper {

        function getID():int;
        function readString():String;
        function readInteger():int;
        function readBoolean():Boolean;
        function readShort():int;
        function readByte():int;
        function readFloat():Number;
        function get bytesAvailable():uint;

    }
}//package com.sulake.core.communication.messages

