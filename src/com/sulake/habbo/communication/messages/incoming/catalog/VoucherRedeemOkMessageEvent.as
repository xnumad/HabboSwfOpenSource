package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.VoucherRedeemOkMessageParser;

    public class VoucherRedeemOkMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function VoucherRedeemOkMessageEvent(k:Function)
        {
            super(k, VoucherRedeemOkMessageParser);
        }

        public function get productName():String
        {
            return (_parser as VoucherRedeemOkMessageParser).productName;
        }

        public function get productDescription():String
        {
            return (_parser as VoucherRedeemOkMessageParser).productDescription;
        }
    }
}
