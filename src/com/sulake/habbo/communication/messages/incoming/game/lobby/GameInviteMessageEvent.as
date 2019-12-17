package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameInviteMessageParser;

    public class GameInviteMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function GameInviteMessageEvent(k:Function)
        {
            super(k, GameInviteMessageParser);
        }

        public function getParser():GameInviteMessageParser
        {
            return this._parser as GameInviteMessageParser;
        }
    }
}
