//com.sulake.habbo.communication.messages.parser.users.GuildCreatedMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildCreatedMessageParser implements IMessageParser {

        private var _baseRoomId:int;
        private var _groupId:int;

        public function GuildCreatedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get baseRoomId():int;

        public function get groupId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

