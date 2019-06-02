//com.sulake.habbo.communication.messages.parser.quest.QuestMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class QuestMessageParser implements IMessageParser {

        private var _quest:QuestMessageData;

        public function QuestMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get quest():QuestMessageData;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

