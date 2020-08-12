package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetInventoryMessageParser;

    public class _Str_9259 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9259(k:Function)
        {
            super(k, PetInventoryMessageParser);
        }

        public function getParser():PetInventoryMessageParser
        {
            return _parser as PetInventoryMessageParser;
        }
    }
}
