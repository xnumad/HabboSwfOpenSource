//com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.session{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.CloseConnectionMessageParser;

    [SecureSWF(rename="true")]
    public class CloseConnectionMessageEvent extends MessageEvent implements IMessageEvent {

        public function CloseConnectionMessageEvent(k:Function);

        public function getParser():CloseConnectionMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.session

