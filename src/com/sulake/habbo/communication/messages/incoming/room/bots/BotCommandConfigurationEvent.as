package com.sulake.habbo.communication.messages.incoming.room.bots
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.bots.BotCommandConfigurationParser;

    public class BotCommandConfigurationEvent extends MessageEvent implements IMessageEvent 
    {
        public function BotCommandConfigurationEvent(k:Function)
        {
            super(k, BotCommandConfigurationParser);
        }

        public function getParser():BotCommandConfigurationParser
        {
            return _parser as BotCommandConfigurationParser;
        }
    }
}
