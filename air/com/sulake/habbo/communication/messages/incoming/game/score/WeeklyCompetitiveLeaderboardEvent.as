//com.sulake.habbo.communication.messages.incoming.game.score.WeeklyCompetitiveLeaderboardEvent

package com.sulake.habbo.communication.messages.incoming.game.score{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2WeeklyLeaderboardParser;

    [SecureSWF(rename="true")]
    public class WeeklyCompetitiveLeaderboardEvent extends MessageEvent {

        public function WeeklyCompetitiveLeaderboardEvent(k:Function);

        public function getParser():Game2WeeklyLeaderboardParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.score

