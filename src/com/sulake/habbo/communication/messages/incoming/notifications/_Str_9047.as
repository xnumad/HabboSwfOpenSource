package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetRemovedFromInventoryParser;

    public class _Str_9047 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9047(k:Function)
        {
            super(k, PetRemovedFromInventoryParser);
        }

        public function getParser():PetRemovedFromInventoryParser
        {
            return _parser as PetRemovedFromInventoryParser;
        }
    }
}
