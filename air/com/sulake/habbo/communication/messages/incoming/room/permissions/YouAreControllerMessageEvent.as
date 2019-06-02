//com.sulake.habbo.communication.messages.incoming.room.permissions.YouAreControllerMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.permissions{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.permissions.YouAreControllerMessageParser;

    [SecureSWF(rename="true")]
    public class YouAreControllerMessageEvent extends MessageEvent {

        public function YouAreControllerMessageEvent(k:Function);

        public function getParser():YouAreControllerMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.permissions

