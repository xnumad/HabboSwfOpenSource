package com.sulake.habbo.communication.messages.incoming.game.score
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.WeeklyGameRewardParser;

    public class WeeklyGameRewardEvent extends MessageEvent
    {
        public function WeeklyGameRewardEvent(k:Function)
        {
            super(k, WeeklyGameRewardParser);
        }

        public function getParser():WeeklyGameRewardParser
        {
            return this._parser as WeeklyGameRewardParser;
        }
    }
}
