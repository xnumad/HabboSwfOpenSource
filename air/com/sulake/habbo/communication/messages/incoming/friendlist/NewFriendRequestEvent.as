//com.sulake.habbo.communication.messages.incoming.friendlist.NewFriendRequestEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.NewFriendRequestMessageParser;

    [SecureSWF(rename="true")]
    public class NewFriendRequestEvent extends MessageEvent implements IMessageEvent {

        public function NewFriendRequestEvent(k:Function);

        public function getParser():NewFriendRequestMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

