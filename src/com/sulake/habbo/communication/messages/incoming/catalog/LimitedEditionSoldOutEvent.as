package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.LimitedEditionSoldOutParser;

    public class LimitedEditionSoldOutEvent extends MessageEvent implements IMessageEvent
    {
        public function LimitedEditionSoldOutEvent(k:Function)
        {
            super(k, LimitedEditionSoldOutParser);
        }

        public function getParser():LimitedEditionSoldOutParser
        {
            return this._parser as LimitedEditionSoldOutParser;
        }
    }
}
