package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementParser;

    public class AchievementEvent extends MessageEvent implements IMessageEvent 
    {
        public function AchievementEvent(k:Function)
        {
            super(k, AchievementParser);
        }

        public function getParser():AchievementParser
        {
            return _parser as AchievementParser;
        }
    }
}
