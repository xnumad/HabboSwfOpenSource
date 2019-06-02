//com.sulake.habbo.communication.messages.outgoing.room.furniture.GetRentOrBuyoutOfferMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetRentOrBuyoutOfferMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetRentOrBuyoutOfferMessageComposer(k:Boolean, _arg_2:String, _arg_3:Boolean);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

