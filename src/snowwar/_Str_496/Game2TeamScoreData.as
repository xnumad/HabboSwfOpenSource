package snowwar._Str_496
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2TeamScoreData 
    {
        private var _SafeStr_10146:int;
        private var _SafeStr_22182:int;
        private var _SafeStr_13149:Array;

        public function Game2TeamScoreData(k:IMessageDataWrapper)
        {
            this._SafeStr_22182 = k.readInteger();
            this._SafeStr_10146 = k.readInteger();
            this._SafeStr_13149 = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._SafeStr_13149.push(new Game2TeamPlayerData(this._SafeStr_22182, k));
                _local_3++;
            }
        }

        public function get score():int
        {
            return this._SafeStr_10146;
        }

        public function get _SafeStr_18907():int
        {
            return this._SafeStr_22182;
        }

        public function get _SafeStr_13266():Array
        {
            return this._SafeStr_13149;
        }
    }
}





