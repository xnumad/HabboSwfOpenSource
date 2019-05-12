package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import snowwar._Str_496.SnowWarGameStageMessageParser;
    import snowwar._Str_496.Game2PlayerData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormLevelDataParser implements IMessageParser 
    {
        private var _SafeStr_12655:int;
        private var _SafeStr_18595:int;
        private var _SafeStr_18581:int;
        private var _SafeStr_13149:Array;
        private var _SafeStr_18702:SnowWarGameStageMessageParser;

        public function SnowStormLevelDataParser()
        {
            this._SafeStr_13149 = [];
        }

        public function flush():Boolean
        {
            var k:Game2PlayerData;
            this._SafeStr_12655 = -1;
            this._SafeStr_18595 = -1;
            this._SafeStr_18581 = -1;
            for each (k in this._SafeStr_13149)
            {
                k.dispose();
            }
            this._SafeStr_13149 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:Game2PlayerData;
            this._SafeStr_12655 = k.readInteger();
            this._SafeStr_18595 = k.readInteger();
            this._SafeStr_18581 = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new Game2PlayerData();
                _local_4.parse(k);
                this._SafeStr_13149.push(_local_4);
                _local_3++;
            }
            this._SafeStr_18702 = new SnowWarGameStageMessageParser(k);
            return true;
        }

        public function get _SafeStr_12658():int
        {
            return this._SafeStr_12655;
        }

        public function get fieldName():int
        {
            return this._SafeStr_18595;
        }

        public function get _SafeStr_13274():int
        {
            return this._SafeStr_18581;
        }

        public function get _SafeStr_13266():Array
        {
            return this._SafeStr_13149;
        }

        public function get _SafeStr_18958():SnowWarGameStageMessageParser
        {
            return this._SafeStr_18702;
        }
    }
}
