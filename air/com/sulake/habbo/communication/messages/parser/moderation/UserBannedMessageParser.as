//com.sulake.habbo.communication.messages.parser.moderation.UserBannedMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserBannedMessageParser implements IMessageParser {

        private var _message:String;

        public function UserBannedMessageParser();

        public function get message():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

