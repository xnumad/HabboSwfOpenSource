package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsParser;

    public class AchievementsEvent extends MessageEvent implements IMessageEvent 
    {
        public function AchievementsEvent(k:Function)
        {
            super(k, AchievementsParser);
        }

        public function getParser():AchievementsParser
        {
            return _parser as AchievementsParser;
        }
    }
}
