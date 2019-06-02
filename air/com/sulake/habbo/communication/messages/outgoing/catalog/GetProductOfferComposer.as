//com.sulake.habbo.communication.messages.outgoing.catalog.GetProductOfferComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetProductOfferComposer implements IMessageComposer {

        private var _offerId:int;

        public function GetProductOfferComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

