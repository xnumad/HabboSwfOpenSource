//com.sulake.habbo.communication.messages.incoming.game.score.Game2TotalLeaderboardEvent

package com.sulake.habbo.communication.messages.incoming.game.score{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2LeaderboardParser;

    [SecureSWF(rename="true")]
    public class Game2TotalLeaderboardEvent extends MessageEvent {

        public function Game2TotalLeaderboardEvent(k:Function);

        public function getParser():Game2LeaderboardParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.score

