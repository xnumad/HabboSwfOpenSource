package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.FlatCreatedMessageParser;

    public class FlatCreatedEvent extends MessageEvent implements IMessageEvent
    {
        public function FlatCreatedEvent(k:Function)
        {
            super(k, FlatCreatedMessageParser);
        }

        public function getParser():FlatCreatedMessageParser
        {
            return this._parser as FlatCreatedMessageParser;
        }
    }
}
