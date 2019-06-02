//com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitMessageParser

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ModeratorInitMessageParser implements IMessageParser {

        private var _data:ModeratorInitData;

        public function ModeratorInitMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():ModeratorInitData;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

