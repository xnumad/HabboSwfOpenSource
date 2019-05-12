package com.sulake.core.communication.connection
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public interface IConnectionStateListener 
    {
        function connectionInit(host:String, port:int):void;
        function messageReceived(_arg_1:String):void;
        function messageSent(_arg_1:String):void;
        function messageParseError(_arg_1:IMessageDataWrapper):void;
    }
}
