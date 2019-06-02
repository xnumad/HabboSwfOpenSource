//com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseFromCatalogAsGiftComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PurchaseFromCatalogAsGiftComposer implements IMessageComposer {

        private var _data:Array;

        public function PurchaseFromCatalogAsGiftComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

