//com.sulake.habbo.communication.messages.incoming.game.score.Game2WeeklyLeaderboardEvent

package com.sulake.habbo.communication.messages.incoming.game.score{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2WeeklyLeaderboardParser;

    [SecureSWF(rename="true")]
    public class Game2WeeklyLeaderboardEvent extends MessageEvent {

        public function Game2WeeklyLeaderboardEvent(k:Function);

        public function getParser():Game2WeeklyLeaderboardParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.score

