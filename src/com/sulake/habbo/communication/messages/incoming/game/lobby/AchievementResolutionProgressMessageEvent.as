package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionProgressMessageParser;

    public class AchievementResolutionProgressMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function AchievementResolutionProgressMessageEvent(k:Function)
        {
            super(k, AchievementResolutionProgressMessageParser);
        }

        public function getParser():AchievementResolutionProgressMessageParser
        {
            return this._parser as AchievementResolutionProgressMessageParser;
        }
    }
}
