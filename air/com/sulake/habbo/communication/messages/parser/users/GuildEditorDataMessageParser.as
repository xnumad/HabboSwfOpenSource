//com.sulake.habbo.communication.messages.parser.users.GuildEditorDataMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.GuildEditorData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuildEditorDataMessageParser implements IMessageParser {

        private var _data:GuildEditorData;

        public function GuildEditorDataMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():GuildEditorData;


    }
}//package com.sulake.habbo.communication.messages.parser.users

