//com.sulake.habbo.communication.messages.outgoing.inventory.trading.UnacceptTradingComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.trading{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class UnacceptTradingComposer implements IMessageComposer {

        public function UnacceptTradingComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.trading

