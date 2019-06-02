//com.sulake.habbo.communication.messages.outgoing.inventory.trading.AddItemToTradeComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.trading{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class AddItemToTradeComposer implements IMessageComposer {

        private var _itemID:int;

        public function AddItemToTradeComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.trading

