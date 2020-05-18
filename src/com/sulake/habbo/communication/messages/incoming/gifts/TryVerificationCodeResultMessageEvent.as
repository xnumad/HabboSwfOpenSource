package com.sulake.habbo.communication.messages.incoming.gifts
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.gifts.TryVerificationCodeResultParser;

    public class TryVerificationCodeResultMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function TryVerificationCodeResultMessageEvent(k:Function)
        {
            super(k, TryVerificationCodeResultParser);
        }

        public function getParser():TryVerificationCodeResultParser
        {
            return _parser as TryVerificationCodeResultParser;
        }
    }
}
