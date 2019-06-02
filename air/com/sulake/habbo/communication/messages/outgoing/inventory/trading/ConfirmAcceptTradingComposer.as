//com.sulake.habbo.communication.messages.outgoing.inventory.trading.ConfirmAcceptTradingComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.trading{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ConfirmAcceptTradingComposer implements IMessageComposer {

        public function ConfirmAcceptTradingComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.trading

