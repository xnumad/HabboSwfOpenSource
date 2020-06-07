package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.PurchaseErrorMessageParser;

    public class _Str_8078 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8078(k:Function)
        {
            super(k, PurchaseErrorMessageParser);
        }

        public function getParser():PurchaseErrorMessageParser
        {
            return this._parser as PurchaseErrorMessageParser;
        }
    }
}
