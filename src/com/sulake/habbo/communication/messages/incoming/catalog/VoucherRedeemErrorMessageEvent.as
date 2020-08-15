package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.VoucherRedeemErrorMessageParser;

    public class VoucherRedeemErrorMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function VoucherRedeemErrorMessageEvent(k:Function)
        {
            super(k, VoucherRedeemErrorMessageParser);
        }

        public function get errorCode():String
        {
            return (_parser as VoucherRedeemErrorMessageParser).errorCode;
        }
    }
}
