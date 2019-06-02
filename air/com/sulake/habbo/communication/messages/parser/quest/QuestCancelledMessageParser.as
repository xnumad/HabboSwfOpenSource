//com.sulake.habbo.communication.messages.parser.quest.QuestCancelledMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class QuestCancelledMessageParser implements IMessageParser {

        private var _expired:Boolean;

        public function QuestCancelledMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get expired():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

