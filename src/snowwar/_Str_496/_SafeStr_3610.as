package snowwar._Str_496
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import snowwar._Str_62.SnowWarGameObjectData;

    public class _SafeStr_3610 
    {
        private var _SafeStr_12654:Array;

        public function _SafeStr_3610(k:IMessageDataWrapper)
        {
            this._SafeStr_12654 = [];
            super();
            this.parse(k);
        }

        public function get _SafeStr_7508():Array
        {
            return this._SafeStr_12654;
        }

        public function parse(k:IMessageDataWrapper):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:SnowWarGameObjectData;
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                _local_6 = SnowWarGameObjectData.create(_local_4, _local_5);
                _local_6.parse(k);
                this._SafeStr_12654.push(_local_6);
                _local_3++;
            }
        }
    }
}
