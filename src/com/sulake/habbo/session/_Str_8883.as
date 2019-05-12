package com.sulake.habbo.session
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_12283;

    public class _Str_8883 implements IDisposable 
    {
        private var _Str_17483:Map;
        private var _sessionDataManager:SessionDataManager;

        public function _Str_8883(k:SessionDataManager)
        {
            this._sessionDataManager = k;
            this._Str_17483 = new Map();
        }

        public function _Str_24368(k:int):Array
        {
            var _local_3:IConnection;
            var _local_2:Array = (this._Str_17483.getValue(k) as Array);
            if (_local_2 != null)
            {
                return _local_2.slice();
            }
            if (this._sessionDataManager.communication)
            {
                _local_3 = this._sessionDataManager.communication.connection;
                if (_local_3)
                {
                    _local_3.send(new _Str_12283(k));
                }
            }
            return null;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._sessionDataManager = null;
        }

        public function get disposed():Boolean
        {
            return this._sessionDataManager == null;
        }

        public function _Str_25163(k:int, _arg_2:Array):void
        {
            this._Str_17483.add(k, _arg_2);
        }
    }
}
