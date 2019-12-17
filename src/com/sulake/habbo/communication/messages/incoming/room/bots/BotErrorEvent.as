package com.sulake.habbo.communication.messages.incoming.room.bots
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.bots.BotErrorParser;

    public class BotErrorEvent extends MessageEvent implements IMessageEvent 
    {
        public function BotErrorEvent(k:Function)
        {
            super(k, BotErrorParser);
        }

        public function getParser():BotErrorParser
        {
            return _parser as BotErrorParser;
        }
    }
}
