package com.sulake.habbo.communication.messages.incoming.game.directory
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2AccountGameStatusMessageParser;

    public class Game2AccountGameStatusMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function Game2AccountGameStatusMessageEvent(k:Function)
        {
            super(k, Game2AccountGameStatusMessageParser);
        }

        public function getParser():Game2AccountGameStatusMessageParser
        {
            return this._parser as Game2AccountGameStatusMessageParser;
        }
    }
}
