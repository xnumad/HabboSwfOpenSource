//com.sulake.habbo.communication.messages.incoming.friendlist.FriendNotificationEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendNotificationMessageParser;

    [SecureSWF(rename="true")]
    public class FriendNotificationEvent extends MessageEvent implements IMessageEvent {

        public function FriendNotificationEvent(k:Function);

        public function getParser():FriendNotificationMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

