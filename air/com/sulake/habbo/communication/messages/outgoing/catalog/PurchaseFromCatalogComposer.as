//com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseFromCatalogComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PurchaseFromCatalogComposer implements IMessageComposer {

        private var _data:Array;

        public function PurchaseFromCatalogComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

