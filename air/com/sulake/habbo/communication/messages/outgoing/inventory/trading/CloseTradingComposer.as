//com.sulake.habbo.communication.messages.outgoing.inventory.trading.CloseTradingComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.trading{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CloseTradingComposer implements IMessageComposer {

        public function CloseTradingComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.trading

