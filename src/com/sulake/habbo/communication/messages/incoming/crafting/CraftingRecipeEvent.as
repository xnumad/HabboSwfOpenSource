package com.sulake.habbo.communication.messages.incoming.crafting
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftingRecipeMessageParser;

    public class CraftingRecipeEvent extends MessageEvent implements IMessageEvent 
    {
        public function CraftingRecipeEvent(k:Function)
        {
            super(k, CraftingRecipeMessageParser);
        }

        public function getParser():CraftingRecipeMessageParser
        {
            return _parser as CraftingRecipeMessageParser;
        }
    }
}
