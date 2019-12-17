package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.LoadGameUrlMessageParser;

    public class LoadGameUrlMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function LoadGameUrlMessageEvent(k:Function)
        {
            super(k, LoadGameUrlMessageParser);
        }

        public function getParser():LoadGameUrlMessageParser
        {
            return this._parser as LoadGameUrlMessageParser;
        }
    }
}
