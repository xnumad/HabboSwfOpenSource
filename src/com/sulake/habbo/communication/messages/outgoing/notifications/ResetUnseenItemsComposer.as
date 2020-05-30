package com.sulake.habbo.communication.messages.outgoing.notifications
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class ResetUnseenItemsComposer implements IMessageComposer, IDisposable
    {
        private var _array:Array;

        public function ResetUnseenItemsComposer(k:int, _arg_2:Array)
        {
            this._array = new Array();
            super();
            this._array.push(k);
            this._array.push(_arg_2.length);
            this._array = this._array.concat(_arg_2);
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
