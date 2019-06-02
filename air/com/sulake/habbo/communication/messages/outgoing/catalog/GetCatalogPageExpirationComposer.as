//com.sulake.habbo.communication.messages.outgoing.catalog.GetCatalogPageExpirationComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetCatalogPageExpirationComposer implements IMessageComposer {

        private var _data:Array;

        public function GetCatalogPageExpirationComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

