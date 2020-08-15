package com.sulake.habbo.communication.messages.incoming.game.directory
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2InArenaQueueMessageParser;

    public class Game2InArenaQueueMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function Game2InArenaQueueMessageEvent(k:Function)
        {
            super(k, Game2InArenaQueueMessageParser);
        }

        public function getParser():Game2InArenaQueueMessageParser
        {
            return this._parser as Game2InArenaQueueMessageParser;
        }
    }
}
