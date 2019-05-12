package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4587 implements IDisposable, _Str_5733 
    {
        private var _tags:Array;
        private var _disposed:Boolean;

        public function _Str_4587(k:IMessageDataWrapper)
        {
            this._tags = new Array();
            super();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._tags.push(new _Str_6625(k));
                _local_3++;
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._tags = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get tags():Array
        {
            return this._tags;
        }
    }
}
