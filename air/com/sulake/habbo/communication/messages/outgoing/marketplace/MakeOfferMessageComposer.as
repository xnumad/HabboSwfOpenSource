//com.sulake.habbo.communication.messages.outgoing.marketplace.MakeOfferMessageComposer

package com.sulake.habbo.communication.messages.outgoing.marketplace{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class MakeOfferMessageComposer implements IMessageComposer, IDisposable {

        public static const ITEMTYPE_STUFF:int;
        public static const ITEMTYPE_WALLITEM:int;

        private var _array:Array;

        public function MakeOfferMessageComposer(k:int, _arg_2:int, _arg_3:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.marketplace

