//com.sulake.habbo.communication.messages.parser.quest.CommunityGoalHallOfFameMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalHallOfFame;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CommunityGoalHallOfFameMessageParser implements IMessageParser {

        private var _data:CommunityGoalHallOfFame;

        public function CommunityGoalHallOfFameMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():CommunityGoalHallOfFame;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

