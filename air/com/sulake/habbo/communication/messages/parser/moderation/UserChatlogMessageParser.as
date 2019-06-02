//com.sulake.habbo.communication.messages.parser.moderation.UserChatlogMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.moderation.UserChatlogData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserChatlogMessageParser implements IMessageParser {

        private var _data:UserChatlogData;

        public function UserChatlogMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():UserChatlogData;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

