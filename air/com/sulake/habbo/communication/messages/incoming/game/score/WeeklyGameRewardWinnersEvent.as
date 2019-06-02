//com.sulake.habbo.communication.messages.incoming.game.score.WeeklyGameRewardWinnersEvent

package com.sulake.habbo.communication.messages.incoming.game.score{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.WeeklyGameRewardWinnersParser;

    [SecureSWF(rename="true")]
    public class WeeklyGameRewardWinnersEvent extends MessageEvent {

        public function WeeklyGameRewardWinnersEvent(k:Function);

        public function getParser():WeeklyGameRewardWinnersParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.score

