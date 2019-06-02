//com.sulake.habbo.communication.messages.incoming.friendlist.FollowFriendFailedEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FollowFriendFailedMessageParser;

    [SecureSWF(rename="true")]
    public class FollowFriendFailedEvent extends MessageEvent implements IMessageEvent {

        public function FollowFriendFailedEvent(k:Function);

        public function getParser():FollowFriendFailedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

