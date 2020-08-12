package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.ConfirmBreedingResultParser;

    public class _Str_9336 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9336(k:Function)
        {
            super(k, ConfirmBreedingResultParser);
        }

        public function getParser():ConfirmBreedingResultParser
        {
            return _parser as ConfirmBreedingResultParser;
        }
    }
}
