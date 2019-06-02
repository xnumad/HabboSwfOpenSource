//com.sulake.habbo.communication.messages.incoming.room.session.FlatAccessibleMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.session{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.FlatAccessibleMessageParser;

    [SecureSWF(rename="true")]
    public class FlatAccessibleMessageEvent extends MessageEvent {

        public function FlatAccessibleMessageEvent(k:Function);

        public function getParser():FlatAccessibleMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.session

