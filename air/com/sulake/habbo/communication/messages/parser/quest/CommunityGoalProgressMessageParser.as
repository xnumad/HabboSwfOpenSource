//com.sulake.habbo.communication.messages.parser.quest.CommunityGoalProgressMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CommunityGoalProgressMessageParser implements IMessageParser {

        private var _data:CommunityGoalData;

        public function CommunityGoalProgressMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():CommunityGoalData;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

