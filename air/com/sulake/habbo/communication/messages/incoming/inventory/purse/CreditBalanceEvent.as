//com.sulake.habbo.communication.messages.incoming.inventory.purse.CreditBalanceEvent

package com.sulake.habbo.communication.messages.incoming.inventory.purse{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser;

    [SecureSWF(rename="true")]
    public class CreditBalanceEvent extends MessageEvent implements IMessageEvent {

        public function CreditBalanceEvent(k:Function);

        public function getParser():CreditBalanceParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.purse

