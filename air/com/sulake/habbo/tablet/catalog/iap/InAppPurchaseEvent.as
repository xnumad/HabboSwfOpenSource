//com.sulake.habbo.tablet.catalog.iap.InAppPurchaseEvent

package com.sulake.habbo.tablet.catalog.iap{
    import flash.events.Event;

    public class InAppPurchaseEvent extends Event {

        public static const TRANSACTION_SUCCESS:String;
        public static const TRANSACTION_FAIL:String;
        public static const TRANSACTION_CANCELED:String;
        public static const VALIDATION_SUCCESS:String;
        public static const VALIDATION_FAIL:String;

        private var _productId:String;
        private var _transactionId:String;

        public function InAppPurchaseEvent(k:String, _arg_2:String, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get productId():String;

        public function get transactionId():String;


    }
}//package com.sulake.habbo.tablet.catalog.iap

