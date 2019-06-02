//com.sulake.habbo.communication.messages.parser.quest.QuestDailyMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class QuestDailyMessageParser implements IMessageParser {

        private var _quest:QuestMessageData;
        private var _easyQuestCount:int;
        private var _hardQuestCount:int;

        public function QuestDailyMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get quest():QuestMessageData;

        public function get easyQuestCount():int;

        public function get hardQuestCount():int;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

