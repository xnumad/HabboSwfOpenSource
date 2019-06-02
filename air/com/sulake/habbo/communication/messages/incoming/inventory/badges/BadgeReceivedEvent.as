//com.sulake.habbo.communication.messages.incoming.inventory.badges.BadgeReceivedEvent

package com.sulake.habbo.communication.messages.incoming.inventory.badges{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgeReceivedParser;

    public class BadgeReceivedEvent extends MessageEvent {

        public function BadgeReceivedEvent(k:Function);

        public function getParser():BadgeReceivedParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.badges

