package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class CloseIssueDefaultActionMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function CloseIssueDefaultActionMessageComposer(k:int, _arg_2:Array, _arg_3:int)
        {
            this._array = new Array();
            super();
            this._array.push(k);
            this._array.push(_arg_2.length);
            var _local_4:int;
            while (_local_4 < _arg_2.length)
            {
                this._array.push(_arg_2[_local_4]);
                _local_4++;
            }
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
