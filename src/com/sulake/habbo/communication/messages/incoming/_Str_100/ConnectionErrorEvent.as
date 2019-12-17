package com.sulake.habbo.communication.messages.incoming._Str_100
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.error.ConnectionErrorMessageParser;

    public class ConnectionErrorEvent extends MessageEvent implements IMessageEvent 
    {
        public function ConnectionErrorEvent(k:Function)
        {
            super(k, ConnectionErrorMessageParser);
        }

        public function getParser():ConnectionErrorMessageParser
        {
            return this._parser as ConnectionErrorMessageParser;
        }
    }
}
