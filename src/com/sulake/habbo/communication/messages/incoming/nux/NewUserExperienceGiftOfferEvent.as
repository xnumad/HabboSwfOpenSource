package com.sulake.habbo.communication.messages.incoming.nux
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.nux.NewUserExperienceGiftOfferParser;

    public class NewUserExperienceGiftOfferEvent extends MessageEvent implements IMessageEvent 
    {
        public function NewUserExperienceGiftOfferEvent(k:Function)
        {
            super(k, NewUserExperienceGiftOfferParser);
        }

        public function getParser():NewUserExperienceGiftOfferParser
        {
            return _parser as NewUserExperienceGiftOfferParser;
        }
    }
}
