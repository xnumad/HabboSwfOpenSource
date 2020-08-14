package com.sulake.habbo.communication.messages.incoming.game.score
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.WeeklyGameRewardParser;

    public class _Str_11645 extends MessageEvent 
    {
        public function _Str_11645(k:Function)
        {
            super(k, WeeklyGameRewardParser);
        }

        public function getParser():WeeklyGameRewardParser
        {
            return this._parser as WeeklyGameRewardParser;
        }
    }
}
