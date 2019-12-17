package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionsMessageParser;

    public class AchievementResolutionsMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function AchievementResolutionsMessageEvent(k:Function)
        {
            super(k, AchievementResolutionsMessageParser);
        }

        public function getParser():AchievementResolutionsMessageParser
        {
            return this._parser as AchievementResolutionsMessageParser;
        }
    }
}
