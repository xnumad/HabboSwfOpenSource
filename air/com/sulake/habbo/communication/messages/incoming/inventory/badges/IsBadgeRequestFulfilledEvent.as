//com.sulake.habbo.communication.messages.incoming.inventory.badges.IsBadgeRequestFulfilledEvent

package com.sulake.habbo.communication.messages.incoming.inventory.badges{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.IsBadgeRequestFulfilledParser;

    [SecureSWF(rename="true")]
    public class IsBadgeRequestFulfilledEvent extends MessageEvent {

        public function IsBadgeRequestFulfilledEvent(k:Function);

        public function getParser():IsBadgeRequestFulfilledParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.badges

