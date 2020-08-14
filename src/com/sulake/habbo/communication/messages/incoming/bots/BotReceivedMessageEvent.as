package com.sulake.habbo.communication.messages.incoming.bots
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotReceivedMessageParser;

    public class BotReceivedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function BotReceivedMessageEvent(k:Function)
        {
            super(k, BotReceivedMessageParser);
        }

        public function getParser():BotReceivedMessageParser
        {
            return _parser as BotReceivedMessageParser;
        }
    }
}
