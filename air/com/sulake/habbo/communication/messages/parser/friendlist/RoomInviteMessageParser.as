//com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomInviteMessageParser implements IMessageParser {

        private var _senderId:int;
        private var _messageText:String;

        public function RoomInviteMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get senderId():int;

        public function get messageText():String;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

