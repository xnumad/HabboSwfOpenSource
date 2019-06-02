//com.sulake.habbo.communication.messages.incoming.game.score.WeeklyGameRewardEvent

package com.sulake.habbo.communication.messages.incoming.game.score{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.WeeklyGameRewardParser;

    [SecureSWF(rename="true")]
    public class WeeklyGameRewardEvent extends MessageEvent {

        public function WeeklyGameRewardEvent(k:Function);

        public function getParser():WeeklyGameRewardParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.score

