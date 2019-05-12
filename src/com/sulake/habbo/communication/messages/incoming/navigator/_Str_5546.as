package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5546 implements IDisposable, _Str_5733 
    {
        private var _categoryToCurrentUserCountMap:Map;
        private var _categoryToMaxUserCountMap:Map;
        private var _disposed:Boolean;

        public function _Str_5546(k:IMessageDataWrapper)
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            this._categoryToCurrentUserCountMap = new Map();
            this._categoryToMaxUserCountMap = new Map();
            super();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                _local_6 = k.readInteger();
                this._categoryToCurrentUserCountMap.add(_local_4, _local_5);
                this._categoryToMaxUserCountMap.add(_local_4, _local_6);
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
            this._categoryToCurrentUserCountMap = null;
            this._categoryToMaxUserCountMap = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get categoryToCurrentUserCountMap():Map
        {
            return this._categoryToCurrentUserCountMap;
        }

        public function get categoryToMaxUserCountMap():Map
        {
            return this._categoryToMaxUserCountMap;
        }
    }
}
