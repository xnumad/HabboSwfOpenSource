package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.GamePlayerValueMessageParser;

    public class GamePlayerValueMessageEvent extends MessageEvent
    {
        public function GamePlayerValueMessageEvent(k:Function)
        {
            super(k, GamePlayerValueMessageParser);
        }

        public function getParser():GamePlayerValueMessageParser
        {
            return _parser as GamePlayerValueMessageParser;
        }
    }
}
