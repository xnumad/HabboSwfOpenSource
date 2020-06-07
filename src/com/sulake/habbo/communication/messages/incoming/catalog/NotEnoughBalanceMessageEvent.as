package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.NotEnoughBalanceMessageParser;

    public class NotEnoughBalanceMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function NotEnoughBalanceMessageEvent(callback:Function)
        {
            super(callback, NotEnoughBalanceMessageParser);
        }

        public function getParser():NotEnoughBalanceMessageParser
        {
            return this._parser as NotEnoughBalanceMessageParser;
        }
    }
}
