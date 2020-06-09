package com.sulake.habbo.communication.messages.incoming._Str_433
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.bots.BotRemovedFromInventoryParser;

    public class _Str_8269 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8269(k:Function)
        {
            super(k, BotRemovedFromInventoryParser);
        }

        public function getParser():BotRemovedFromInventoryParser
        {
            return _parser as BotRemovedFromInventoryParser;
        }
    }
}
