//com.sulake.habbo.communication.messages.incoming.catalog.VoucherRedeemOkMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class VoucherRedeemOkMessageEvent extends MessageEvent implements IMessageEvent {

        public function VoucherRedeemOkMessageEvent(k:Function);

        public function get productName():String;

        public function get productDescription():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

