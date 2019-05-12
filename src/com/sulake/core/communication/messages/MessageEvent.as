package com.sulake.core.communication.messages
{
    import com.sulake.core.communication.connection.IConnection;

    public class MessageEvent implements IMessageEvent 
    {
        protected var _callback:Function;
        protected var _connection:IConnection;
        private var _parserClass:Class;
        protected var _parser:IMessageParser;

        public function MessageEvent(callback:Function, parserClass:Class)
        {
            this._callback = callback;
            this._parserClass = parserClass;
        }

        public function dispose():void
        {
            this._callback = null;
            this._parserClass = null;
            this._connection = null;
            this._parser = null;
        }

        public function get callback():Function
        {
            return this._callback;
        }

        public function set connection(connection:IConnection):void
        {
            this._connection = connection;
        }

        public function get connection():IConnection
        {
            return this._connection;
        }

        public function get parserClass():Class
        {
            return this._parserClass;
        }

        public function get parser():IMessageParser
        {
            return this._parser;
        }

        public function set parser(parser:IMessageParser):void
        {
            this._parser = parser;
        }
    }
}
