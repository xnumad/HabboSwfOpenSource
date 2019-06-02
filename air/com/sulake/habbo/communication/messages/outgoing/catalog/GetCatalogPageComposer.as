//com.sulake.habbo.communication.messages.outgoing.catalog.GetCatalogPageComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetCatalogPageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetCatalogPageComposer(k:int, _arg_2:int, _arg_3:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

