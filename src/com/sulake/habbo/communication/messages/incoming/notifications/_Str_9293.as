package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.ConfirmBreedingRequestParser;

    public class _Str_9293 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9293(k:Function)
        {
            super(k, ConfirmBreedingRequestParser);
        }

        public function getParser():ConfirmBreedingRequestParser
        {
            return _parser as ConfirmBreedingRequestParser;
        }
    }
}
