package snowwar._Str_496
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_4032 
    {
        public static var _SafeStr_19014:Function = _SafeStr_19012;
        public static var _SafeStr_18802:Function = _SafeStr_19013;

        private var _userId:int;
        private var _name:String;
        private var _figure:String;
        private var _gender:String;
        private var _final:int;
        private var _skillLevel:int;
        private var _SafeStr_19017:int;
        private var _SafeStr_19018:int;

        public function _SafeStr_4032(k:IMessageDataWrapper)
        {
            this._userId = k.readInteger();
            this._name = k.readString();
            this._figure = k.readString();
            this._gender = k.readString();
            this._final = k.readInteger();
            this._skillLevel = k.readInteger();
            this._SafeStr_19017 = k.readInteger();
            this._SafeStr_19018 = k.readInteger();
        }

        private static function _SafeStr_19012(k:_SafeStr_4032, _arg_2:_SafeStr_4032):Number
        {
            var _local_3:int = k._SafeStr_17897;
            var _local_4:int = _arg_2._SafeStr_17897;
            if (_local_3 < _local_4)
            {
                return 1;
            }
            if (_local_3 == _local_4)
            {
                return 0;
            }
            return -1;
        }

        private static function _SafeStr_19013(k:_SafeStr_4032, _arg_2:_SafeStr_4032):Number
        {
            var _local_3:int = k.skillLevel;
            var _local_4:int = _arg_2.skillLevel;
            if (_local_3 < _local_4)
            {
                return 1;
            }
            if (_local_3 == _local_4)
            {
                return 0;
            }
            return -1;
        }


        public function get userId():int
        {
            return this._userId;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function get final():int
        {
            return this._final;
        }

        public function get skillLevel():int
        {
            return this._skillLevel;
        }

        public function get _SafeStr_17897():int
        {
            return this._SafeStr_19017;
        }

        public function get _SafeStr_18803():int
        {
            return this._SafeStr_19018;
        }
    }
}














