package com.sulake.habbo.communication
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.hurlant.math.BigInteger;
    import _Str_538._Str_9612;

    public interface IHabboCommunicationManager extends IUnknown 
    {
        function get connection():IConnection;
        function get mode():int;
        function set mode(_arg_1:int):void;
        function get port():int;
        function _Str_18204():void;
        function _Str_14453(_arg_1:String):void;
        function _Str_23491():void;
        function addHabboConnectionMessageEvent(_arg_1:IMessageEvent):IMessageEvent;
        function _Str_2778(_arg_1:IMessageEvent):void;
        function _Str_20482(_arg_1:String, _arg_2:String):IHabboWebLogin;
        function _Str_16220():IEncryption;
        function _Str_22185(_arg_1:BigInteger, _arg_2:BigInteger):_Str_9612;
        function _Str_19659():void;
    }
}
