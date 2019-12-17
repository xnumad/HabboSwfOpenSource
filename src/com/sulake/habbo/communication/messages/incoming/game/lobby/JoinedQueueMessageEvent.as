package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.JoinedQueueMessageParser;

    public class JoinedQueueMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function JoinedQueueMessageEvent(k:Function)
        {
            super(k, JoinedQueueMessageParser);
        }

        public function getParser():JoinedQueueMessageParser
        {
            return this._parser as JoinedQueueMessageParser;
        }
    }
}
