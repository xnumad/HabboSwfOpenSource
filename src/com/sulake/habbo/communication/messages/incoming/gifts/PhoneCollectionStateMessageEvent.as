package com.sulake.habbo.communication.messages.incoming.gifts
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.gifts.PhoneCollectionStateParser;

    public class PhoneCollectionStateMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function PhoneCollectionStateMessageEvent(k:Function)
        {
            super(k, PhoneCollectionStateParser);
        }

        public function getParser():PhoneCollectionStateParser
        {
            return _parser as PhoneCollectionStateParser;
        }
    }
}
