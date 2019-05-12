package snowwar._Str_496
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2PlayerStatsData 
    {
        private var _SafeStr_10146:int;
        private var _SafeStr_23369:int;
        private var _SafeStr_23370:int;
        private var _SafeStr_23371:int;
        private var _SafeStr_23372:int;
        private var _SafeStr_23373:int;
        private var _SafeStr_23374:int;
        private var _SafeStr_23375:int;
        private var _SafeStr_23376:int;
        private var _SafeStr_23377:int;

        public function Game2PlayerStatsData(k:IMessageDataWrapper)
        {
            this._SafeStr_10146 = k.readInteger();
            this._SafeStr_23369 = k.readInteger();
            this._SafeStr_23370 = k.readInteger();
            this._SafeStr_23371 = k.readInteger();
            this._SafeStr_23372 = k.readInteger();
            this._SafeStr_23373 = k.readInteger();
            this._SafeStr_23374 = k.readInteger();
            this._SafeStr_23375 = k.readInteger();
            this._SafeStr_23376 = k.readInteger();
            this._SafeStr_23377 = k.readInteger();
        }

        public function get score():int
        {
            return this._SafeStr_10146;
        }

        public function get _SafeStr_18909():int
        {
            return this._SafeStr_23369;
        }

        public function get _SafeStr_23378():int
        {
            return this._SafeStr_23370;
        }

        public function get _SafeStr_18908():int
        {
            return this._SafeStr_23371;
        }

        public function get _SafeStr_23379():int
        {
            return this._SafeStr_23372;
        }

        public function get _SafeStr_23380():int
        {
            return this._SafeStr_23373;
        }

        public function get _SafeStr_23381():int
        {
            return this._SafeStr_23374;
        }

        public function get _SafeStr_23382():int
        {
            return this._SafeStr_23375;
        }

        public function get _SafeStr_23383():int
        {
            return this._SafeStr_23376;
        }

        public function get _SafeStr_23384():int
        {
            return this._SafeStr_23377;
        }
    }
}



















