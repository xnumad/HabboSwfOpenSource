package snowwar._Str_496
{
	import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_4018 
    {
        private var _SafeStr_18565:int;
        private var _SafeStr_18580:String;
        private var _fieldId:int;
        private var _fieldName:int;
        private var _SafeStr_18581:int;
        private var _SafeStr_18596:int;
        private var _SafeStr_18597:String;
        private var _SafeStr_18598:int;
        private var _SafeStr_13149:Array;

        public function _SafeStr_4018(k:IMessageDataWrapper)
        {
            this._SafeStr_13149 = [];
            super();
            this._SafeStr_18565 = k.readInteger();
            this._SafeStr_18580 = k.readString();
            this._fieldId = k.readInteger();
            this._fieldName = k.readInteger();
            this._SafeStr_18581 = k.readInteger();
            this._SafeStr_18596 = k.readInteger();
            this._SafeStr_18597 = k.readString();
            this._SafeStr_18598 = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._SafeStr_13149.push(new _SafeStr_4032(k));
                _local_3++;
            }
        }

        public function get _SafeStr_13085():int
        {
            return this._SafeStr_18565;
        }

        public function get fieldId():int
        {
            return this._fieldId;
        }

        public function get fieldName():int //_SafeStr_13230
        {
            return this._fieldName;
        }

        public function get _SafeStr_13274():int
        {
            return this._SafeStr_18581;
        }

        public function get _SafeStr_13275():int
        {
            return this._SafeStr_18596;
        }

        public function get _SafeStr_18599():String
        {
            return this._SafeStr_18597;
        }

        public function get _SafeStr_18600():int
        {
            return this._SafeStr_18598;
        }

        public function get _SafeStr_13266():Array
        {
            return this._SafeStr_13149;
        }
    }
}
