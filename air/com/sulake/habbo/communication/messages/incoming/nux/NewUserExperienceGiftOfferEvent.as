//com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceGiftOfferEvent

package com.sulake.habbo.communication.messages.incoming.nux{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.nux.NewUserExperienceGiftOfferParser;

    [SecureSWF(rename="true")]
    public class NewUserExperienceGiftOfferEvent extends MessageEvent implements IMessageEvent {

        public function NewUserExperienceGiftOfferEvent(k:Function);

        public function getParser():NewUserExperienceGiftOfferParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.nux

