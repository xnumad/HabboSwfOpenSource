//com.sulake.habbo.communication.messages.outgoing.catalog.GetIsOfferGiftableComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetIsOfferGiftableComposer implements IMessageComposer {

        private var _data:Array;

        public function GetIsOfferGiftableComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

