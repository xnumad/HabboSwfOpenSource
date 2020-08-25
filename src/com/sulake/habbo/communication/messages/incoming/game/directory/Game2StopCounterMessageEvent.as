package com.sulake.habbo.communication.messages.incoming.game.directory
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2StopCounterMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.directory.Game2InArenaQueueMessageParser;

    public class Game2StopCounterMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function Game2StopCounterMessageEvent(k:Function)
        {
            super(k, Game2StopCounterMessageParser);
        }

        public function getParser():Game2InArenaQueueMessageParser
        {
            return this._parser as Game2InArenaQueueMessageParser;
        }
    }
}
