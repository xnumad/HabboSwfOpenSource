//com.sulake.habbo.communication.messages.incoming.catalog.LimitedOfferAppearingNextMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.LimitedOfferAppearingNextMessageParser;

    [SecureSWF(rename="true")]
    public class LimitedOfferAppearingNextMessageEvent extends MessageEvent implements IMessageEvent {

        public function LimitedOfferAppearingNextMessageEvent(k:Function);

        public function getParser():LimitedOfferAppearingNextMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

