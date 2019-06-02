//com.sulake.habbo.communication.messages.outgoing.catalog.GetCatalogIndexComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetCatalogIndexComposer implements IMessageComposer {

        private var _data:Array;

        public function GetCatalogIndexComposer(k:String, _arg_2:Array=null);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

