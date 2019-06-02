//com.sulake.habbo.communication.messages.outgoing.marketplace.GetMarketplaceOffersMessageComposer

package com.sulake.habbo.communication.messages.outgoing.marketplace{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetMarketplaceOffersMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function GetMarketplaceOffersMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.marketplace

