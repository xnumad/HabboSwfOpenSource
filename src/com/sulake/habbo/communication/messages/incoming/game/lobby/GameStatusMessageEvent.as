package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameStatusMessageParser;

    public class GameStatusMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function GameStatusMessageEvent(k:Function)
        {
            super(k, GameStatusMessageParser);
        }

        public function _Str_2273():GameStatusMessageParser
        {
            return this._parser as GameStatusMessageParser;
        }
    }
}
