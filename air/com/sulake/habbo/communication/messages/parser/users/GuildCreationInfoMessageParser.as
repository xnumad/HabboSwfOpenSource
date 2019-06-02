//com.sulake.habbo.communication.messages.parser.users.GuildCreationInfoMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.GuildCreationData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildCreationInfoMessageParser implements IMessageParser {

        private var _data:GuildCreationData;

        public function GuildCreationInfoMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():GuildCreationData;


    }
}//package com.sulake.habbo.communication.messages.parser.users

