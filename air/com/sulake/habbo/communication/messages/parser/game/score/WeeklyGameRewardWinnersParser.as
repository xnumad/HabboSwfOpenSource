//com.sulake.habbo.communication.messages.parser.game.score.WeeklyGameRewardWinnersParser

package com.sulake.habbo.communication.messages.parser.game.score{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WeeklyGameRewardWinnersParser implements IMessageParser {

        private var _gameTypeId:int;
        private var _winners:Array;

        public function WeeklyGameRewardWinnersParser();

        public function get gameTypeId():int;

        public function get winners():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.score

