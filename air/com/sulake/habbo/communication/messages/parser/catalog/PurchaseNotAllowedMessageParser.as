//com.sulake.habbo.communication.messages.parser.catalog.PurchaseNotAllowedMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PurchaseNotAllowedMessageParser implements IMessageParser {

        private var _errorCode:int;

        public function PurchaseNotAllowedMessageParser();

        public function get errorCode():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

