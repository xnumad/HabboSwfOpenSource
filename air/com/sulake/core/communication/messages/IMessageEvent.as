//com.sulake.core.communication.messages.IMessageEvent

package com.sulake.core.communication.messages{
    import com.sulake.core.communication.connection.IConnection;

    public /*dynamic*/ interface IMessageEvent {

        function get callback():Function;
        function set connection(k:IConnection):void;
        function get connection():IConnection;
        function get parserClass():Class;
        function get parser():IMessageParser;
        function set parser(k:IMessageParser):void;
        function dispose():void;

    }
}//package com.sulake.core.communication.messages

