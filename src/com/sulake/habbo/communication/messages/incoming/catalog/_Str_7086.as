package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.PurchaseNotAllowedMessageParser;

    public class _Str_7086 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7086(k:Function)
        {
            super(k, PurchaseNotAllowedMessageParser);
        }

        public function getParser():PurchaseNotAllowedMessageParser
        {
            return this._parser as PurchaseNotAllowedMessageParser;
        }
    }
}
