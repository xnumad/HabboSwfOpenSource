//com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteMessageParser;

    [SecureSWF(rename="true")]
    public class RoomInviteEvent extends MessageEvent implements IMessageEvent {

        public function RoomInviteEvent(k:Function);

        public function getParser():RoomInviteMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

