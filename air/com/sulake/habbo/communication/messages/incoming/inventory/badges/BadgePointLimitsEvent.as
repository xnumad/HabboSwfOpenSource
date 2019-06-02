//com.sulake.habbo.communication.messages.incoming.inventory.badges.BadgePointLimitsEvent

package com.sulake.habbo.communication.messages.incoming.inventory.badges{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgePointLimitsParser;

    [SecureSWF(rename="true")]
    public class BadgePointLimitsEvent extends MessageEvent {

        public function BadgePointLimitsEvent(k:Function);

        public function getParser():BadgePointLimitsParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.badges

