//com.sulake.habbo.communication.messages.incoming.room.engine.UserUpdateMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.UserUpdateMessageParser;

    [SecureSWF(rename="true")]
    public class UserUpdateMessageEvent extends MessageEvent {

        public function UserUpdateMessageEvent(k:Function);

        public function getParser():UserUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

