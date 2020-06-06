package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.OfficialRoomsMessageParser;

    public class _Str_5134 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5134(k:Function)
        {
            super(k, OfficialRoomsMessageParser);
        }

        public function getParser():OfficialRoomsMessageParser
        {
            return this._parser as OfficialRoomsMessageParser;
        }
    }
}
