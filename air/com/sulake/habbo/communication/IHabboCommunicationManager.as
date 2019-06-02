//com.sulake.habbo.communication.IHabboCommunicationManager

package com.sulake.habbo.communication{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.hurlant.math.BigInteger;
    import com.sulake.core.communication.handshake.IKeyExchange;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface IHabboCommunicationManager extends IUnknown {

        function get connection():IConnection;
        function get mode():int;
        function set mode(k:int):void;
        function get port():int;
        function updateHostParameters():void;
        function initConnection(k:String):void;
        function addHabboConnectionMessageEvent(k:IMessageEvent):IMessageEvent;
        function removeHabboConnectionMessageEvent(k:IMessageEvent):void;
        function habboWebLogin(k:String, _arg_2:String):IHabboWebLogin;
        function initializeEncryption(k:IEncryption):IEncryption;
        function initializeKeyExchange(k:BigInteger, _arg_2:BigInteger):IKeyExchange;
        function setMessageQueueErrorDebugData():void;
        function createPocketHabboSession(k:IPocketHabboListener, _arg_2:String):IPocketHabboSession;
        function getPocketHabboSession():IPocketHabboSession;
        function resetPocketHabboSession():void;
        function get events():IEventDispatcher;

    }
}//package com.sulake.habbo.communication

