//com.sulake.habbo.communication.messages.incoming.catalog.VoucherRedeemErrorMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class VoucherRedeemErrorMessageEvent extends MessageEvent implements IMessageEvent {

        public function VoucherRedeemErrorMessageEvent(k:Function);

        public function get errorCode():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

