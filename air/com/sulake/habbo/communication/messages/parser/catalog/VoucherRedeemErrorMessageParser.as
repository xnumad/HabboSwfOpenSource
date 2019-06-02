//com.sulake.habbo.communication.messages.parser.catalog.VoucherRedeemErrorMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class VoucherRedeemErrorMessageParser implements IMessageParser {

        private var _errorCode:String;

        public function VoucherRedeemErrorMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get errorCode():String;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

