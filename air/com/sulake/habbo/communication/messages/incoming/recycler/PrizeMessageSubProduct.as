//com.sulake.habbo.communication.messages.incoming.recycler.PrizeMessageSubProduct

package com.sulake.habbo.communication.messages.incoming.recycler{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PrizeMessageSubProduct {

        private var _productItemType:String;
        private var _productItemTypeId:int;

        public function PrizeMessageSubProduct(k:IMessageDataWrapper);

        public function get productItemType():String;

        public function get productItemTypeId():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.recycler

