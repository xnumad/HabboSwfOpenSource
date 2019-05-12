package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class PickIssuesMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function PickIssuesMessageComposer(k:Array, _arg_2:Boolean, _arg_3:int, _arg_4:String)
        {
            this._array = new Array();
            super();
            this._array.push(k.length);
            var _local_5:int;
            while (_local_5 < k.length)
            {
                this._array.push(k[_local_5]);
                _local_5++;
            }
            this._array.push(_arg_2);
            this._array.push(_arg_3);
            this._array.push(_arg_4);
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
