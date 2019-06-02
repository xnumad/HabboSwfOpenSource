//com.sulake.habbo.communication.messages.incoming.room.session.OpenConnectionMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.session{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.OpenConnectionMessageParser;

    [SecureSWF(rename="true")]
    public class OpenConnectionMessageEvent extends MessageEvent {

        public function OpenConnectionMessageEvent(k:Function);

        public function getParser():OpenConnectionMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.session

