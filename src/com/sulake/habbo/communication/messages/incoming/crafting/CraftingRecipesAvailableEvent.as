package com.sulake.habbo.communication.messages.incoming.crafting
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftingRecipesAvailableMessageParser;

    public class CraftingRecipesAvailableEvent extends MessageEvent implements IMessageEvent 
    {
        public function CraftingRecipesAvailableEvent(k:Function)
        {
            super(k, CraftingRecipesAvailableMessageParser);
        }

        public function getParser():CraftingRecipesAvailableMessageParser
        {
            return _parser as CraftingRecipesAvailableMessageParser;
        }
    }
}
