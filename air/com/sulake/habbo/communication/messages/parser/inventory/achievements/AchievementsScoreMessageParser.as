//com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsScoreMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.achievements{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class AchievementsScoreMessageParser implements IMessageParser {

        private var _score:int;

        public function AchievementsScoreMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get score():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.achievements

