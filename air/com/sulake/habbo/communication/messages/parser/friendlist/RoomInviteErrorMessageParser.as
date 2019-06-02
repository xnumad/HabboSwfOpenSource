//com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteErrorMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomInviteErrorMessageParser implements IMessageParser {

        private var _errorCode:int;
        private var _failedRecipients:Array;

        public function RoomInviteErrorMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get errorCode():int;

        public function get failedRecipients():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

