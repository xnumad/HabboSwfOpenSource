//com.sulake.habbo.communication.messages.parser.friendfurni.FriendFurniCancelLockMessageParser

package com.sulake.habbo.communication.messages.parser.friendfurni{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FriendFurniCancelLockMessageParser implements IMessageParser {

        private var _stuffId:int;

        public function FriendFurniCancelLockMessageParser();

        public function get stuffId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.friendfurni

