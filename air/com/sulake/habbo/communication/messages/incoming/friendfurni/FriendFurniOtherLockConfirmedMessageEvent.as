//com.sulake.habbo.communication.messages.incoming.friendfurni.FriendFurniOtherLockConfirmedMessageEvent

package com.sulake.habbo.communication.messages.incoming.friendfurni{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni.FriendFurniOtherLockConfirmedMessageParser;

    [SecureSWF(rename="true")]
    public class FriendFurniOtherLockConfirmedMessageEvent extends MessageEvent implements IMessageEvent {

        public function FriendFurniOtherLockConfirmedMessageEvent(k:Function);

        public function getParser():FriendFurniOtherLockConfirmedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendfurni

