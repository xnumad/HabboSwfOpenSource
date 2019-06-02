//com.sulake.habbo.communication.messages.incoming.game.score.WeeklyCompetitiveFriendsLeaderboardEvent

package com.sulake.habbo.communication.messages.incoming.game.score{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2WeeklyLeaderboardParser;

    [SecureSWF(rename="true")]
    public class WeeklyCompetitiveFriendsLeaderboardEvent extends MessageEvent {

        public function WeeklyCompetitiveFriendsLeaderboardEvent(k:Function);

        public function getParser():Game2WeeklyLeaderboardParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.score

