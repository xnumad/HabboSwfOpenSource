//com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestsEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendRequestsMessageParser;

    [SecureSWF(rename="true")]
    public class FriendRequestsEvent extends MessageEvent implements IMessageEvent {

        public function FriendRequestsEvent(k:Function);

        public function getParser():FriendRequestsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

