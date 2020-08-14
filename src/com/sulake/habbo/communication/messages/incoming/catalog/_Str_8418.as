package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.VoucherRedeemErrorMessageParser;

    public class _Str_8418 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8418(k:Function)
        {
            super(k, VoucherRedeemErrorMessageParser);
        }

        public function get errorCode():String
        {
            return (_parser as VoucherRedeemErrorMessageParser).errorCode;
        }
    }
}
