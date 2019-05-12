package snowwar._Str_496
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2SnowWarGameStats 
    {
        private var _SafeStr_18912:int;
        private var _SafeStr_18913:int;

        public function Game2SnowWarGameStats(k:IMessageDataWrapper)
        {
            this._SafeStr_18912 = k.readInteger();
            this._SafeStr_18913 = k.readInteger();
        }

        public function get _SafeStr_18906():int
        {
            return this._SafeStr_18912;
        }

        public function get _SafeStr_18905():int
        {
            return this._SafeStr_18913;
        }
    }
}




