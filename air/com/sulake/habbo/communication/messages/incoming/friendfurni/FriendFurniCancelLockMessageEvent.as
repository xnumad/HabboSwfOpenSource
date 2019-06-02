//com.sulake.habbo.communication.messages.incoming.friendfurni.FriendFurniCancelLockMessageEvent

package com.sulake.habbo.communication.messages.incoming.friendfurni{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni.FriendFurniCancelLockMessageParser;

    [SecureSWF(rename="true")]
    public class FriendFurniCancelLockMessageEvent extends MessageEvent implements IMessageEvent {

        public function FriendFurniCancelLockMessageEvent(k:Function);

        public function getParser():FriendFurniCancelLockMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendfurni

