package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class CloseIssuesMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function CloseIssuesMessageComposer(k:Array, _arg_2:int)
        {
            this._array = new Array();
            super();
            this._array.push(_arg_2);
            this._array.push(k.length);
            var _local_3:int;
            while (_local_3 < k.length)
            {
                this._array.push(k[_local_3]);
                _local_3++;
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
