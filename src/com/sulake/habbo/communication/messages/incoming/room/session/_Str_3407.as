package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomReadyMessageParser;

    public class _Str_3407 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3407(k:Function)
        {
            super(k, RoomReadyMessageParser);
        }

        public function getParser():RoomReadyMessageParser
        {
            return _parser as RoomReadyMessageParser;
        }
    }
}
