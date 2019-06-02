//com.sulake.habbo.communication.messages.outgoing.catalog.GetDirectClubBuyAvailableComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetDirectClubBuyAvailableComposer implements IMessageComposer {

        private var _days:int;

        public function GetDirectClubBuyAvailableComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

