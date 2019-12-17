package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameAchievementsMessageParser;

    public class GameAchievementsMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function GameAchievementsMessageEvent(k:Function)
        {
            super(k, GameAchievementsMessageParser);
        }

        public function getParser():GameAchievementsMessageParser
        {
            return this._parser as GameAchievementsMessageParser;
        }
    }
}
