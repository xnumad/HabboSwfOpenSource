//com.sulake.habbo.communication.messages.parser.catalog.VoucherRedeemOkMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class VoucherRedeemOkMessageParser implements IMessageParser {

        private var _productName:String;
        private var _productDescription:String;

        public function VoucherRedeemOkMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get productName():String;

        public function get productDescription():String;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

