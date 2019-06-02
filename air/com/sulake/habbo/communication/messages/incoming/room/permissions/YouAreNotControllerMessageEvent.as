//com.sulake.habbo.communication.messages.incoming.room.permissions.YouAreNotControllerMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.permissions{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.permissions.YouAreNotControllerMessageParser;

    [SecureSWF(rename="true")]
    public class YouAreNotControllerMessageEvent extends MessageEvent {

        public function YouAreNotControllerMessageEvent(k:Function);

        public function getParser():YouAreNotControllerMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.permissions

