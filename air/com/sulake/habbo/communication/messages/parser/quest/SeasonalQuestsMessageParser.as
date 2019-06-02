//com.sulake.habbo.communication.messages.parser.quest.SeasonalQuestsMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class SeasonalQuestsMessageParser implements IMessageParser {

        private var _quests:Array;

        public function SeasonalQuestsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get quests():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

