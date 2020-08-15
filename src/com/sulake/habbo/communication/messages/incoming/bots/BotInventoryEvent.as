package com.sulake.habbo.communication.messages.incoming.bots
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotInventoryMessageParser;

    public class BotInventoryEvent extends MessageEvent implements IMessageEvent
    {
        public function BotInventoryEvent(k:Function)
        {
            super(k, BotInventoryMessageParser);
        }

        public function getParser():BotInventoryMessageParser
        {
            return _parser as BotInventoryMessageParser;
        }
    }
}
