//com.sulake.habbo.communication.messages.incoming.recycler.PrizeMessageData

package com.sulake.habbo.communication.messages.incoming.recycler{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PrizeMessageData {

        private var _productConfigurationSize:int;
        private var _productCode:String;
        private var _subProducts:Array;
        private var _productItemType:String;
        private var _productItemTypeId:int;

        public function PrizeMessageData(k:IMessageDataWrapper);

        public function get productItemType():String;

        public function get productItemTypeId():int;

        public function get isDeal():Boolean;

        public function get subProducts():Array;

        public function get productCode():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.recycler

