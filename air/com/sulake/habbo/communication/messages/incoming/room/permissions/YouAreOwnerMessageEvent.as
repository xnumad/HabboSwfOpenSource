//com.sulake.habbo.communication.messages.incoming.room.permissions.YouAreOwnerMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.permissions{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.permissions.YouAreOwnerMessageParser;

    [SecureSWF(rename="true")]
    public class YouAreOwnerMessageEvent extends MessageEvent {

        public function YouAreOwnerMessageEvent(k:Function);

        public function getParser():YouAreOwnerMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.permissions

