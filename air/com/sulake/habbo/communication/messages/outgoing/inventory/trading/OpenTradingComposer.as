//com.sulake.habbo.communication.messages.outgoing.inventory.trading.OpenTradingComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.trading{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class OpenTradingComposer implements IMessageComposer {

        private var _userRoomIndex:int;

        public function OpenTradingComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.trading

