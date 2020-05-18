package com.sulake.habbo.communication.messages.incoming.gifts
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.gifts.TryPhoneNumberResultParser;

    public class TryPhoneNumberResultMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function TryPhoneNumberResultMessageEvent(k:Function)
        {
            super(k, TryPhoneNumberResultParser);
        }

        public function getParser():TryPhoneNumberResultParser
        {
            return _parser as TryPhoneNumberResultParser;
        }
    }
}
