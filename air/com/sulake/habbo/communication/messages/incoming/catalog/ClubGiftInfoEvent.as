//com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftInfoEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.ClubGiftInfoParser;

    [SecureSWF(rename="true")]
    public class ClubGiftInfoEvent extends MessageEvent implements IMessageEvent {

        public function ClubGiftInfoEvent(k:Function);

        public function getParser():ClubGiftInfoParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

