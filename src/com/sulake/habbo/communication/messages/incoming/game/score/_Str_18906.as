package com.sulake.habbo.communication.messages.incoming.game.score
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.Game2LeaderboardParser;

    public class _Str_18906 extends MessageEvent 
    {
        public function _Str_18906(k:Function)
        {
            super(k, Game2LeaderboardParser);
        }

        public function getParser():Game2LeaderboardParser
        {
            return this._parser as Game2LeaderboardParser;
        }
    }
}
