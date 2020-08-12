package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomInfoUpdatedMessageParser;

    public class _Str_5711 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5711(k:Function)
        {
            super(k, RoomInfoUpdatedMessageParser);
        }

        public function getParser():RoomInfoUpdatedMessageParser
        {
            return this._parser as RoomInfoUpdatedMessageParser;
        }
    }
}
