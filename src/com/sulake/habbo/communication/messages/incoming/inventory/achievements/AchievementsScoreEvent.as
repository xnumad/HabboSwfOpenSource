package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsScoreParser;

    public class AchievementsScoreEvent extends MessageEvent implements IMessageEvent 
    {
        public function AchievementsScoreEvent(k:Function)
        {
            super(k, AchievementsScoreParser);
        }

        public function _Str_2273():AchievementsScoreParser
        {
            return _parser as AchievementsScoreParser;
        }
    }
}
