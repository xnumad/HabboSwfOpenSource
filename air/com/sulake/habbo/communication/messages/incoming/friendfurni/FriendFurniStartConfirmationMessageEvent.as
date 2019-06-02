//com.sulake.habbo.communication.messages.incoming.friendfurni.FriendFurniStartConfirmationMessageEvent

package com.sulake.habbo.communication.messages.incoming.friendfurni{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni.FriendFurniStartConfirmationMessageParser;

    [SecureSWF(rename="true")]
    public class FriendFurniStartConfirmationMessageEvent extends MessageEvent implements IMessageEvent {

        public function FriendFurniStartConfirmationMessageEvent(k:Function);

        public function getParser():FriendFurniStartConfirmationMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendfurni

