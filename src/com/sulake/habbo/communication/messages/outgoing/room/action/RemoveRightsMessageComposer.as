package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class RemoveRightsMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function RemoveRightsMessageComposer(k:Array)
        {
            this._array = new Array();
            super();
            this._array.push(k.length);
            var _local_2:int;
            while (_local_2 < k.length)
            {
                this._array.push(k[_local_2]);
                _local_2++;
            }
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
