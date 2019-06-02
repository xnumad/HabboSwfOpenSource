//com.sulake.habbo.communication.messages.parser.users.GuildEditInfoMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.GuildEditData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildEditInfoMessageParser implements IMessageParser {

        private var _data:GuildEditData;

        public function GuildEditInfoMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():GuildEditData;


    }
}//package com.sulake.habbo.communication.messages.parser.users

