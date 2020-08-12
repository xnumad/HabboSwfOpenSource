package com.sulake.habbo.communication.messages.outgoing.marketplace
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class MakeOfferMessageComposer implements IMessageComposer, IDisposable
    {
        public static const ITEMTYPE_STUFF:int = 1;
        public static const ITEMTYPE_WALLITEM:int = 2;

        private var _array:Array;

        public function MakeOfferMessageComposer(k:int, _arg_2:int, _arg_3:int)
        {
            this._array = new Array();
            super();
            this._array.push(k);
            this._array.push(_arg_2);
            this._array.push(_arg_3);
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
