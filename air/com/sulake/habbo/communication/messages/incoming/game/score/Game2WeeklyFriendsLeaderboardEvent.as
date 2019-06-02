//com.sulake.habbo.communication.messages.incoming.game.score.Game2WeeklyFriendsLeaderboardEvent

package com.sulake.habbo.communication.messages.incoming.game.score{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2WeeklyLeaderboardParser;

    [SecureSWF(rename="true")]
    public class Game2WeeklyFriendsLeaderboardEvent extends MessageEvent {

        public function Game2WeeklyFriendsLeaderboardEvent(k:Function);

        public function getParser():Game2WeeklyLeaderboardParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.score

