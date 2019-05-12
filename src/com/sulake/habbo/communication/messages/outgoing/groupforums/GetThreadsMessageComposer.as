package com.sulake.habbo.communication.messages.outgoing.groupforums
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GetThreadsMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function GetThreadsMessageComposer(k:int)
        {
            this._array = new Array();
            super();
            this._array = [k];
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
