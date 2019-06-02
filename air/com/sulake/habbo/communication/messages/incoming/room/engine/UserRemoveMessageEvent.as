//com.sulake.habbo.communication.messages.incoming.room.engine.UserRemoveMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.UserRemoveMessageParser;

    [SecureSWF(rename="true")]
    public class UserRemoveMessageEvent extends MessageEvent {

        public function UserRemoveMessageEvent(k:Function);

        public function getParser():UserRemoveMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

