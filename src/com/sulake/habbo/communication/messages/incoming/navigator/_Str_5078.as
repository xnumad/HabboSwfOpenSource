package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5078 implements IDisposable, _Str_5733 
    {
        private var _entries:Array;
        private var _disposed:Boolean;

        public function _Str_5078(k:IMessageDataWrapper)
        {
            this._entries = new Array();
            super();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._entries.push(new _Str_2632(k));
                _local_3++;
            }
        }

        public function dispose():void
        {
            var k:_Str_2632;
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._entries != null)
            {
                for each (k in this._entries)
                {
                    k.dispose();
                }
            }
            this._entries = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get entries():Array
        {
            return this._entries;
        }
    }
}
