//com.sulake.habbo.communication.messages.incoming.friendlist.AcceptFriendResultEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.AcceptFriendResultMessageParser;

    [SecureSWF(rename="true")]
    public class AcceptFriendResultEvent extends MessageEvent implements IMessageEvent {

        public function AcceptFriendResultEvent(k:Function);

        public function getParser():AcceptFriendResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

