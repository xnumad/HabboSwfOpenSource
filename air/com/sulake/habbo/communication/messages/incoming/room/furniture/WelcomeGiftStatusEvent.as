//com.sulake.habbo.communication.messages.incoming.room.furniture.WelcomeGiftStatusEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.WelcomeGiftStatusParser;

    [SecureSWF(rename="true")]
    public class WelcomeGiftStatusEvent extends MessageEvent {

        public function WelcomeGiftStatusEvent(k:Function);

        public function getParser():WelcomeGiftStatusParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

