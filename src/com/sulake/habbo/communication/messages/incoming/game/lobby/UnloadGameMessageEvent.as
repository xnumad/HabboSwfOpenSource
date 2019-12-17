package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.UnloadGameMessageParser;

    public class UnloadGameMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function UnloadGameMessageEvent(k:Function)
        {
            super(k, UnloadGameMessageParser);
        }

        public function getParser():UnloadGameMessageParser
        {
            return this._parser as UnloadGameMessageParser;
        }
    }
}
