//com.sulake.habbo.communication.messages.incoming.catalog.BuildersClubSubscriptionStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.BuildersClubSubscriptionStatusMessageParser;

    public class BuildersClubSubscriptionStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function BuildersClubSubscriptionStatusMessageEvent(k:Function);

        public function getParser():BuildersClubSubscriptionStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

