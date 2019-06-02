//com.sulake.core.communication.connection.IConnection

package com.sulake.core.communication.connection{
    import flash.events.IEventDispatcher;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.sulake.core.communication.messages.IMessageConfiguration;
    import com.sulake.core.communication.messages.IMessageEvent;

    public /*dynamic*/ interface IConnection extends IEventDispatcher {

        function dispose():void;
        function get disposed():Boolean;
        function init(k:String, _arg_2:uint=0, _arg_3:String=null):Boolean;
        function set timeout(k:int):void;
        function send(k:IMessageComposer):Boolean;
        function sendUnencrypted(k:IMessageComposer):Boolean;
        function setEncryption(k:IEncryption):void;
        function registerMessageClasses(k:IMessageConfiguration):void;
        function addMessageEvent(k:IMessageEvent):void;
        function removeMessageEvent(k:IMessageEvent):void;
        function processReceivedData():void;
        function get connected():Boolean;
        function close():void;
        function isAuthenticated():void;
        function isConfigured():void;

    }
}//package com.sulake.core.communication.connection

