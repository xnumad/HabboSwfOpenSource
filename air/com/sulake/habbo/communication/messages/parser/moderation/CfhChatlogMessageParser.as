//com.sulake.habbo.communication.messages.parser.moderation.CfhChatlogMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.moderation.CfhChatlogData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CfhChatlogMessageParser implements IMessageParser {

        private var _data:CfhChatlogData;

        public function CfhChatlogMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():CfhChatlogData;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

