package com.sulake.habbo.communication.messages.outgoing.mysterybox
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class MysteryBoxWaitingCanceledMessageComposer implements IMessageComposer, IDisposable
    {
        private var _array:Array;

        public function MysteryBoxWaitingCanceledMessageComposer(k:int)
        {
            this._array = new Array();
            super();
            this._array.push(k);
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
