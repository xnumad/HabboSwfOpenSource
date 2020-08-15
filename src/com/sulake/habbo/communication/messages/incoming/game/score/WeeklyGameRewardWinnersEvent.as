package com.sulake.habbo.communication.messages.incoming.game.score
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score.WeeklyGameRewardWinnersParser;

    public class WeeklyGameRewardWinnersEvent extends MessageEvent
    {
        public function WeeklyGameRewardWinnersEvent(k:Function)
        {
            super(k, WeeklyGameRewardWinnersParser);
        }

        public function getParser():WeeklyGameRewardWinnersParser
        {
            return this._parser as WeeklyGameRewardWinnersParser;
        }
    }
}
