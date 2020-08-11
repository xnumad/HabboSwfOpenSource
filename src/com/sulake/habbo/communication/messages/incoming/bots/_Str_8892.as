package com.sulake.habbo.communication.messages.incoming.bots
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotAddedToInventoryParser;

    public class _Str_8892 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8892(k:Function)
        {
            super(k, BotAddedToInventoryParser);
        }

        public function getParser():BotAddedToInventoryParser
        {
            return _parser as BotAddedToInventoryParser;
        }
    }
}
