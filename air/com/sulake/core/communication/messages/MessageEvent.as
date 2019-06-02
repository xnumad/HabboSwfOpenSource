//com.sulake.core.communication.messages.MessageEvent

package com.sulake.core.communication.messages{
    import com.sulake.core.communication.connection.IConnection;

    public class MessageEvent implements IMessageEvent {

        protected var _callback:Function;
        protected var _connection:IConnection;
        private var _parserClass:Class;
        protected var _parser:IMessageParser;

        public function MessageEvent(k:Function, _arg_2:Class);

        public function dispose():void;

        public function get callback():Function;

        public function set connection(k:IConnection):void;

        public function get connection():IConnection;

        public function get parserClass():Class;

        public function get parser():IMessageParser;

        public function set parser(k:IMessageParser):void;


    }
}//package com.sulake.core.communication.messages

