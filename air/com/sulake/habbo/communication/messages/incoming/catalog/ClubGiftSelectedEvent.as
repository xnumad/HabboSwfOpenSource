//com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftSelectedEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.ClubGiftSelectedParser;

    [SecureSWF(rename="true")]
    public class ClubGiftSelectedEvent extends MessageEvent implements IMessageEvent {

        public function ClubGiftSelectedEvent(k:Function);

        public function getParser():ClubGiftSelectedParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

