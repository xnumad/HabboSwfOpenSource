//com.sulake.habbo.communication.messages.parser.users.GuildMemberFurniCountInHQMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildMemberFurniCountInHQMessageParser implements IMessageParser {

        private var _userId:int;
        private var _furniCount:int;

        public function GuildMemberFurniCountInHQMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get userId():int;

        public function get furniCount():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

