//com.sulake.habbo.tablet.catalog.iap.InAppPurchaser

package com.sulake.habbo.tablet.catalog.iap{
    import flash.events.EventDispatcher;
    import com.sulake.habbo.communication.IPocketHabboListener;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.IPocketHabboSession;
    import com.adobe.ane.productStore.ProductStore;
    import com.adobe.ane.productStore.Transaction;
    import com.adobe.ane.productStore.Product;
    import com.adobe.ane.productStore.ProductEvent;
    import com.adobe.ane.productStore.TransactionEvent;

    public class InAppPurchaser extends EventDispatcher implements IPocketHabboListener {

        public static const PRODUCTS_READY:String;
        public static const PRODUCTS_FAIL:String;

        private var _testMode:Boolean;
        private var _testProducts:Dictionary;
        private var _testProductIds:Vector.<String>;
        private var _pocketSession:IPocketHabboSession;
        private var _store:ProductStore;
        private var _fetchedProducts:Dictionary;
        private var _productsReady:Boolean;
        private var _isFetchingProducts:Boolean;
        private var _pocketErrorRetried:Boolean;
        private var _disposed:Boolean;

        public function InAppPurchaser(k:IPocketHabboSession);

        public static function isSupported():Boolean;

        private static function printTransaction(k:Transaction):void;

        private static function log(k:String):void;


        private function addTestProduct(k:String, _arg_2:Number, _arg_3:String, _arg_4:String, _arg_5:String="test=EUR"):void;

        public function dispose():void;

        public function get disposed():Boolean;

        public function isAvailable():Boolean;

        public function areProductsReady():Boolean;

        public function fetchProductDetails(k:Vector.<String>):void;

        public function getProductDetails(k:String):Product;

        public function hasPendingTransactions():Boolean;

        public function validateAllPendingTransactions():void;

        public function purchase(k:String, _arg_2:int):void;

        public function restoreTransactions():void;

        public function finishTransaction(k:String):void;

        private function onProductDetailsSuccess(k:ProductEvent):void;

        private function onProductDetailsSuccessBufferedCall(k:ProductEvent):void;

        private function onProductDetailsFailure(k:ProductEvent):void;

        private function onPurchaseTransactionSuccess(k:TransactionEvent):void;

        private function onPurchaseTransactionCanceled(k:TransactionEvent):void;

        private function onPurchaseTransactionCanceledBufferedCall(k:TransactionEvent):void;

        private function onPurchaseTransactionFailed(k:TransactionEvent):void;

        private function onPurchaseTransactionFailedBufferedCall(k:TransactionEvent):void;

        private function onFinishTransactionSucceeded(k:TransactionEvent):void;

        private function onRestoreTransactionSucceeded(k:TransactionEvent):void;

        private function onRrestoreTransactionFailed(k:TransactionEvent):void;

        private function onRestoreTransactionCompleted(k:TransactionEvent):void;

        private function validateItunesReceipt(k:String, _arg_2:String, _arg_3:int, _arg_4:String):void;

        private function onValidateItunesReceiptReply(k:Object, _arg_2:Boolean):void;

        private function onValidateItunesReceiptReplyBufferedCall(k:Object, _arg_2:Boolean):void;

        public function pocketHabboResponse(k:String, _arg_2:Object):void;

        public function pocketHabboRawResponse(k:String, _arg_2:Object):void;

        public function pocketHabboError(k:String, _arg_2:Object):void;

        private function getPendingTransaction(k:String):Transaction;

        private function printPendingTransactions():void;

        public function printProduct(k:Product):void;

        private function showAlert(title:String, desc:String):void{
        }
        private function registerEvents():void;

        private function forgetEvents():void;


    }
}//package com.sulake.habbo.tablet.catalog.iap

