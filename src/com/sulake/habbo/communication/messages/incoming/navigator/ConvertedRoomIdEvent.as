package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.ConvertedRoomIdMessageParser;

    public class ConvertedRoomIdEvent extends MessageEvent
    {
        public function ConvertedRoomIdEvent(k:Function)
        {
            super(k, ConvertedRoomIdMessageParser);
        }

        public function get _Str_17914():String
        {
            return (this._parser as ConvertedRoomIdMessageParser)._Str_17914;
        }

        public function get _Str_12434():int
        {
            return (this._parser as ConvertedRoomIdMessageParser)._Str_12434;
        }

        public function getParser():ConvertedRoomIdMessageParser
        {
            return _parser as ConvertedRoomIdMessageParser;
        }
    }
}
