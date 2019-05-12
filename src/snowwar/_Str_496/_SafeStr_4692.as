package snowwar._Str_496
{
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import snowwar._Str_377._SafeStr_4677;

    public class _SafeStr_4692 
    {
        private var _turn:int;
        private var _checksum:int;
        private var _SafeStr_22203:Map;

        public function _SafeStr_4692(k:IMessageDataWrapper)
        {
            this.parse(k);
        }

        public function get turn():int
        {
            return this._turn;
        }

        public function get checksum():int
        {
            return this._checksum;
        }

        public function get events():Map
        {
            return this._SafeStr_22203;
        }

        public function parse(k:IMessageDataWrapper):void
        {
            var _local_4:int;
            var _local_5:Array;
            var _local_6:int;
            var _local_7:int;
            var _local_8:_SafeStr_4677;
            this._turn = k.readInteger();
            this._checksum = k.readInteger();
            this._SafeStr_22203 = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = [];
                _local_6 = 0;
                while (_local_6 < _local_4)
                {
                    _local_7 = k.readInteger();
                    _local_8 = _SafeStr_4677.create(_local_7);
                    if (_local_8)
                    {
                        _local_8.parse(k);
                        _local_5.push(_local_8);
                    }
                    _local_6++;
                }
                this._SafeStr_22203.add(_local_3, _local_5);
                _local_3++;
            }
        }
    }
}
