//com.sulake.habbo.communication.messages.incoming.notifications.OfferRewardDeliveredMessageEvent

package com.sulake.habbo.communication.messages.incoming.notifications{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.OfferRewardDeliveredMessageParser;

    [SecureSWF(rename="true")]
    public class OfferRewardDeliveredMessageEvent extends MessageEvent implements IMessageEvent {

        public function OfferRewardDeliveredMessageEvent(k:Function);

        public function getParser():OfferRewardDeliveredMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.notifications

