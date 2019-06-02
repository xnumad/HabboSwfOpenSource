//com.sulake.habbo.communication.messages.incoming.inventory.badges.BadgesEvent

package com.sulake.habbo.communication.messages.incoming.inventory.badges{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgesParser;

    [SecureSWF(rename="true")]
    public class BadgesEvent extends MessageEvent {

        public function BadgesEvent(k:Function);

        public function getParser():BadgesParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.badges

