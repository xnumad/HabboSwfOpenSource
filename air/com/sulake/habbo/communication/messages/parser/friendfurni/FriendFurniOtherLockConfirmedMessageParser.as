//com.sulake.habbo.communication.messages.parser.friendfurni.FriendFurniOtherLockConfirmedMessageParser

package com.sulake.habbo.communication.messages.parser.friendfurni{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FriendFurniOtherLockConfirmedMessageParser implements IMessageParser {

        private var _stuffId:int;

        public function FriendFurniOtherLockConfirmedMessageParser();

        public function get stuffId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.friendfurni

