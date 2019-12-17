package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.LeftQueueMessageParser;

    public class LeftQueueMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function LeftQueueMessageEvent(k:Function)
        {
            super(k, LeftQueueMessageParser);
        }

        public function getParser():LeftQueueMessageParser
        {
            return this._parser as LeftQueueMessageParser;
        }
    }
}
