//com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendListUpdateMessageParser;

    [SecureSWF(rename="true")]
    public class FriendListUpdateEvent extends MessageEvent implements IMessageEvent {

        public function FriendListUpdateEvent(k:Function);

        public function getParser():FriendListUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

