package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.GiftReceiverNotFoundParser;

    public class _Str_8409 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8409(k:Function)
        {
            super(k, GiftReceiverNotFoundParser);
        }

        public function getParser():GiftReceiverNotFoundParser
        {
            return this._parser as GiftReceiverNotFoundParser;
        }
    }
}
