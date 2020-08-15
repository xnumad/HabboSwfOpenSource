package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications.OfferRewardDeliveredMessageParser;

    public class OfferRewardDeliveredMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function OfferRewardDeliveredMessageEvent(k:Function)
        {
            super(k, OfferRewardDeliveredMessageParser);
        }

        public function getParser():OfferRewardDeliveredMessageParser
        {
            return _parser as OfferRewardDeliveredMessageParser;
        }
    }
}
