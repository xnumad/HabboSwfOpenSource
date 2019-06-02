//com.sulake.habbo.communication.messages.outgoing.room.furniture.ExtendRentOrBuyoutFurniMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ExtendRentOrBuyoutFurniMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function ExtendRentOrBuyoutFurniMessageComposer(k:Boolean, _arg_2:int, _arg_3:Boolean);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

