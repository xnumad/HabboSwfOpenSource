//com.sulake.core.communication.connection.IConnectionStateListener

package com.sulake.core.communication.connection{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public /*dynamic*/ interface IConnectionStateListener {

        function connectionInit(k:String, _arg_2:int):void;
        function messageReceived(k:String):void;
        function messageSent(k:String):void;
        function messageParseError(k:IMessageDataWrapper):void;

    }
}//package com.sulake.core.communication.connection

