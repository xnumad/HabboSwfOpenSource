//com.sulake.habbo.communication.messages.parser.friendfurni.FriendFurniStartConfirmationMessageParser

package com.sulake.habbo.communication.messages.parser.friendfurni{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FriendFurniStartConfirmationMessageParser implements IMessageParser {

        private var _stuffId:int;
        private var _isOwner:Boolean;

        public function FriendFurniStartConfirmationMessageParser();

        public function get stuffId():int;

        public function get isOwner():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.friendfurni

