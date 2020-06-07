package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.PurchaseNotAllowedMessageParser;

    public class PurchaseNotAllowedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function PurchaseNotAllowedMessageEvent(k:Function)
        {
            super(k, PurchaseNotAllowedMessageParser);
        }

        public function getParser():PurchaseNotAllowedMessageParser
        {
            return this._parser as PurchaseNotAllowedMessageParser;
        }
    }
}
