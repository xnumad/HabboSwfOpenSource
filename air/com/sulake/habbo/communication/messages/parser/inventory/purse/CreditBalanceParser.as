//com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser

package com.sulake.habbo.communication.messages.parser.inventory.purse{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CreditBalanceParser implements IMessageParser {

        private var _balance:int;

        public function CreditBalanceParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get balance():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.purse

