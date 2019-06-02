//com.sulake.habbo.communication.messages.parser.quest.CommunityGoalEarnedPrizesMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CommunityGoalEarnedPrizesMessageParser implements IMessageParser {

        private var _prizes:Array;

        public function CommunityGoalEarnedPrizesMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get prizes():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

