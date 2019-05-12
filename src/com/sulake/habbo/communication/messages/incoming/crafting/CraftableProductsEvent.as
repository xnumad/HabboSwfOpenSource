package com.sulake.habbo.communication.messages.incoming.crafting
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.crafting.CraftableProductsMessageParser;

    public class CraftableProductsEvent extends MessageEvent implements IMessageEvent 
    {
        public function CraftableProductsEvent(k:Function)
        {
            super(k, CraftableProductsMessageParser);
        }

        public function _Str_2273():CraftableProductsMessageParser
        {
            return _parser as CraftableProductsMessageParser;
        }
    }
}
