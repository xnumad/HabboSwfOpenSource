package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.LoadGameMessageParser;

    public class LoadGameMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function LoadGameMessageEvent(k:Function)
        {
            super(k, LoadGameMessageParser);
        }

        public function getParser():LoadGameMessageParser
        {
            return this._parser as LoadGameMessageParser;
        }
    }
}
