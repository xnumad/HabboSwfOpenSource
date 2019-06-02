//com.sulake.habbo.communication.messages.parser.friendlist.FriendNotificationMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FriendNotificationMessageParser implements IMessageParser {

        private var _typeCode:int;
        private var _avatarId:String;
        private var _message:String;

        public function FriendNotificationMessageParser();

        public function get typeCode():int;

        public function get avatarId():String;

        public function get message():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

