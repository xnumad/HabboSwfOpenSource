package com.sulake.core.communication.connection
{
    import flash.events.IEventDispatcher;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.sulake.core.communication.messages.IMessageConfiguration;
    import com.sulake.core.communication.messages.IMessageEvent;

    public interface IConnection extends IEventDispatcher 
    {
        function dispose():void;
        function get disposed():Boolean;
        function init(_arg_1:String, _arg_2:uint=0):Boolean;
        function set timeout(_arg_1:int):void;
        function send(_arg_1:IMessageComposer):Boolean;
        function sendUnencrypted(_arg_1:IMessageComposer):Boolean;
        function setEncryption(_arg_1:IEncryption, _arg_2:IEncryption):void;
        function getServerToClientEncryption():IEncryption;
        function registerMessageClasses(_arg_1:IMessageConfiguration):void;
        function addMessageEvent(_arg_1:IMessageEvent):void;
        function removeMessageEvent(_arg_1:IMessageEvent):void;
        function processReceivedData():void;
        function get connected():Boolean;
        function close():void;
        function isAuthenticated():void;
        function isConfigured():void;
        function createSocket():void;
    }
}
