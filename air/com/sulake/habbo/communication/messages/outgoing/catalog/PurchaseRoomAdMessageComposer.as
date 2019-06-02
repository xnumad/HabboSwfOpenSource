//com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseRoomAdMessageComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PurchaseRoomAdMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function PurchaseRoomAdMessageComposer(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

