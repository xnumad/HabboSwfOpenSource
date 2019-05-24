package com.sulake.habbo.communication
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.hurlant.math.BigInteger;
    import com.sulake.core.communication.handshake.IKeyExchange;

    public interface IHabboCommunicationManager extends IUnknown 
    {
        function get connection():IConnection;
        function get mode():int;
        function set mode(_arg_1:int):void;
        function get port():int;
        function updateHostParameters():void;
        function initConnection(_arg_1:String):void;
        function _Str_23491():void;
        function addHabboConnectionMessageEvent(_arg_1:IMessageEvent):IMessageEvent;
        function removeHabboConnectionMessageEvent(_arg_1:IMessageEvent):void;
        function habboWebLogin(_arg_1:String, _arg_2:String):IHabboWebLogin;
        function initializeEncryption():IEncryption;
        function initializeKeyExchange(_arg_1:BigInteger, _arg_2:BigInteger):IKeyExchange;
        function setMessageQueueErrorDebugData():void;
    }
}
