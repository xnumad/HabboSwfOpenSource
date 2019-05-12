package snowwar._Str_231
{
    import snowwar._Str_496.SnowWarGameStageMessageParser;

    public class _SafeStr_4025 implements _SafeStr_4024 
    {
        protected var _synchronizedGameArena:SynchronizedGameArena;
        protected var _SafeStr_18702:SnowWarGameStageMessageParser;
        private var _SafeStr_5041:Boolean = false;


        public function dispose():void
        {
            this._SafeStr_5041 = true;
            this._synchronizedGameArena = null;
            this._SafeStr_18702 = null;
        }

        public function get disposed():Boolean
        {
            return this._SafeStr_5041;
        }

        public function initialize(k:SynchronizedGameArena, _arg_2:SnowWarGameStageMessageParser):void
        {
            this._synchronizedGameArena = k;
            this._SafeStr_18702 = _arg_2;
        }

        public function get synchronizedGameArena():SynchronizedGameArena
        {
            return this._synchronizedGameArena;
        }

        public function get _SafeStr_18703():SnowWarGameStageMessageParser
        {
            return this._SafeStr_18702;
        }

        public function get roomType():String
        {
            return "";
        }
    }
}



