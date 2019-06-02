//com.sulake.habbo.communication.messages.incoming.recycler.PrizeLevelMessageData

package com.sulake.habbo.communication.messages.incoming.recycler{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PrizeLevelMessageData {

        private var _prizeLevelId:int;
        private var _probabilityDenominator:int;
        private var _prizes:Array;

        public function PrizeLevelMessageData(k:IMessageDataWrapper);

        public function get prizeLevelId():int;

        public function get probabilityDenominator():int;

        public function get prizes():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.recycler

