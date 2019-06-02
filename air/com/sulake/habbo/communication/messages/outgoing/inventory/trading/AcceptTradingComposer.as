//com.sulake.habbo.communication.messages.outgoing.inventory.trading.AcceptTradingComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.trading{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class AcceptTradingComposer implements IMessageComposer {

        public function AcceptTradingComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.trading

