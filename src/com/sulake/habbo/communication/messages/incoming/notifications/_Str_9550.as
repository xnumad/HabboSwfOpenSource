package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetAddedToInventoryParser;

    public class _Str_9550 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9550(k:Function)
        {
            super(k, PetAddedToInventoryParser);
        }

        public function getParser():PetAddedToInventoryParser
        {
            return _parser as PetAddedToInventoryParser;
        }
    }
}
