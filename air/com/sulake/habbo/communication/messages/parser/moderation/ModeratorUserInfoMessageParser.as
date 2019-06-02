//com.sulake.habbo.communication.messages.parser.moderation.ModeratorUserInfoMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.moderation.ModeratorUserInfoData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ModeratorUserInfoMessageParser implements IMessageParser {

        private var _data:ModeratorUserInfoData;

        public function ModeratorUserInfoMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():ModeratorUserInfoData;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

