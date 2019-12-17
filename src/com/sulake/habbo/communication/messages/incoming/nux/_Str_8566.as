package com.sulake.habbo.communication.messages.incoming.nux
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.nux.NewUserExperienceGiftOfferParser;

    public class _Str_8566 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8566(k:Function)
        {
            super(k, NewUserExperienceGiftOfferParser);
        }

        public function getParser():NewUserExperienceGiftOfferParser
        {
            return _parser as NewUserExperienceGiftOfferParser;
        }
    }
}
