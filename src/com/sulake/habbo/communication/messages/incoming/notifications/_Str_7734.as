package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetBreedingMessageParser;

    public class _Str_7734 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7734(k:Function)
        {
            super(k, PetBreedingMessageParser);
        }

        public function getParser():PetBreedingMessageParser
        {
            return _parser as PetBreedingMessageParser;
        }
    }
}
