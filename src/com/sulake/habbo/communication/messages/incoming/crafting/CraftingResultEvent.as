package com.sulake.habbo.communication.messages.incoming.crafting
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftingResultMessageParser;

    public class CraftingResultEvent extends MessageEvent implements IMessageEvent 
    {
        public function CraftingResultEvent(k:Function)
        {
            super(k, CraftingResultMessageParser);
        }

        public function getParser():CraftingResultMessageParser
        {
            return _parser as CraftingResultMessageParser;
        }
    }
}
