package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.AchievementResolutionCompletedMessageParser;

    public class AchievementResolutionCompletedMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function AchievementResolutionCompletedMessageEvent(k:Function)
        {
            super(k, AchievementResolutionCompletedMessageParser);
        }

        public function getParser():AchievementResolutionCompletedMessageParser
        {
            return this._parser as AchievementResolutionCompletedMessageParser;
        }
    }
}
