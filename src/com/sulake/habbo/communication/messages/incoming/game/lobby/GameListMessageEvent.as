package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameListMessageParser;

    public class GameListMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function GameListMessageEvent(k:Function)
        {
            super(k, GameListMessageParser);
        }

        public function getParser():GameListMessageParser
        {
            return this._parser as GameListMessageParser;
        }
    }
}
