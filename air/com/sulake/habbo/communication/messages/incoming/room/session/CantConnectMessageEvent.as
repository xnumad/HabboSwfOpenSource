//com.sulake.habbo.communication.messages.incoming.room.session.CantConnectMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.session{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.CantConnectMessageParser;

    [SecureSWF(rename="true")]
    public class CantConnectMessageEvent extends MessageEvent {

        public function CantConnectMessageEvent(k:Function);

        public function getParser():CantConnectMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.session

