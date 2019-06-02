//com.sulake.habbo.communication.messages.parser.quest.QuestCompletedMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class QuestCompletedMessageParser implements IMessageParser {

        private var _questData:QuestMessageData;
        private var _showDialog:Boolean;

        public function QuestCompletedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get questData():QuestMessageData;

        public function get showDialog():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

