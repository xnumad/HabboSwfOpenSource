package com.sulake.habbo.communication.messages.incoming.game.lobby
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.JoiningQueueFailedMessageParser;

    public class JoiningQueueFailedMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function JoiningQueueFailedMessageEvent(k:Function)
        {
            super(k, JoiningQueueFailedMessageParser);
        }

        public function getParser():JoiningQueueFailedMessageParser
        {
            return this._parser as JoiningQueueFailedMessageParser;
        }
    }
}
