//com.sulake.habbo.communication.messages.parser.game.score.WeeklyGameRewardParser

package com.sulake.habbo.communication.messages.parser.game.score{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WeeklyGameRewardParser implements IMessageParser {

        private var _gameTypeId:int;
        private var _products:Array;
        private var _minutesUntilNextWeek:int;
        private var _rewardingOn:Boolean;

        public function WeeklyGameRewardParser();

        public function get gameTypeId():int;

        public function get products():Array;

        public function get minutesUntilNextWeek():int;

        public function get rewardingOn():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.score

