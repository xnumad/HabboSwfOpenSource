//com.sulake.habbo.communication.messages.incoming.game.score.Game2FriendsLeaderboardEvent

package com.sulake.habbo.communication.messages.incoming.game.score{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2LeaderboardParser;

    [SecureSWF(rename="true")]
    public class Game2FriendsLeaderboardEvent extends MessageEvent {

        public function Game2FriendsLeaderboardEvent(k:Function);

        public function getParser():Game2LeaderboardParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.game.score

