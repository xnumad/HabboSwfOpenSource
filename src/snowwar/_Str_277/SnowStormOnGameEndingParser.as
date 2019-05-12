package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import snowwar._Str_496.Game2SnowWarGameStats;
    import snowwar._Str_496.Game2GameResult;
    import snowwar._Str_496.Game2TeamScoreData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormOnGameEndingParser implements IMessageParser 
    {
        private var _SafeStr_21840:int;
        private var _SafeStr_18880:Array;
        private var _SafeStr_19006:Array;
        private var _SafeStr_21841:Game2SnowWarGameStats;
        private var _SafeStr_18872:Game2GameResult;

        public function flush():Boolean
        {
            this._SafeStr_21840 = -1;
            this._SafeStr_18880 = [];
            this._SafeStr_19006 = [];
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            this._SafeStr_21840 = k.readInteger();
            this._SafeStr_18872 = new Game2GameResult(k);
            var _local_3:int = k.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                this._SafeStr_18880.push(new Game2TeamScoreData(k));
                _local_2++;
            }
            this._SafeStr_21841 = new Game2SnowWarGameStats(k);
            return true;
        }

        public function get _SafeStr_18963():int
        {
            return this._SafeStr_21840;
        }

        public function get _SafeStr_18964():Array
        {
            return this._SafeStr_18880;
        }

        public function get _SafeStr_21842():Array
        {
            return this._SafeStr_19006;
        }

        public function get _SafeStr_18966():Game2GameResult
        {
            return this._SafeStr_18872;
        }

        public function get _SafeStr_18965():Game2SnowWarGameStats
        {
            return this._SafeStr_21841;
        }
    }
}
