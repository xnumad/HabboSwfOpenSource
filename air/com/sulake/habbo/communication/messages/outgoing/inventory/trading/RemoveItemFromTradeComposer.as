//com.sulake.habbo.communication.messages.outgoing.inventory.trading.RemoveItemFromTradeComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.trading{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RemoveItemFromTradeComposer implements IMessageComposer {

        private var _itemID:int;

        public function RemoveItemFromTradeComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.trading

