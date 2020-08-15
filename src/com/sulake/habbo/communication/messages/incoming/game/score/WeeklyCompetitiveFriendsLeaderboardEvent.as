package com.sulake.habbo.communication.messages.incoming.game.score
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2WeeklyLeaderboardParser;

    public class WeeklyCompetitiveFriendsLeaderboardEvent extends MessageEvent
    {
        public function WeeklyCompetitiveFriendsLeaderboardEvent(k:Function)
        {
            super(k, Game2WeeklyLeaderboardParser);
        }

        public function getParser():Game2WeeklyLeaderboardParser
        {
            return this._parser as Game2WeeklyLeaderboardParser;
        }
    }
}
