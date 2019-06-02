//com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteErrorEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteErrorMessageParser;

    [SecureSWF(rename="true")]
    public class RoomInviteErrorEvent extends MessageEvent implements IMessageEvent {

        public function RoomInviteErrorEvent(k:Function);

        public function getParser():RoomInviteErrorMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

