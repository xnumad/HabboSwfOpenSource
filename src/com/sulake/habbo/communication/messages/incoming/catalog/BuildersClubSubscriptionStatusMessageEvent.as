package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.BuildersClubSubscriptionStatusMessageParser;

    public class BuildersClubSubscriptionStatusMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function BuildersClubSubscriptionStatusMessageEvent(k:Function)
        {
            super(k, BuildersClubSubscriptionStatusMessageParser);
        }

        public function getParser():BuildersClubSubscriptionStatusMessageParser
        {
            return this._parser as BuildersClubSubscriptionStatusMessageParser;
        }
    }
}
