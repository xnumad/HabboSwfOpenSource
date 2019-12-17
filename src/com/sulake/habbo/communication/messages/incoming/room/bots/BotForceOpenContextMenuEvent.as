package com.sulake.habbo.communication.messages.incoming.room.bots
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.bots.BotForceOpenContextMenuParser;

    public class BotForceOpenContextMenuEvent extends MessageEvent implements IMessageEvent 
    {
        public function BotForceOpenContextMenuEvent(k:Function)
        {
            super(k, BotForceOpenContextMenuParser);
        }

        public function getParser():BotForceOpenContextMenuParser
        {
            return _parser as BotForceOpenContextMenuParser;
        }
    }
}
