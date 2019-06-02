package snowwar._Str_267
{
	import com.sulake.core.communication.messages.IMessageComposer;
    import snowwar.SnowWarEngine;
    import snowwar._Str_477._SafeStr_3836;

    public class _SafeStr_4663 extends LeaderboardTable 
    {
        private var _offset:int = 0;
        private var _SafeStr_21823:int = 0;

        public function _SafeStr_4663(k:SnowWarEngine)
        {
            super(k);
        }

        public function get offset():int
        {
            return this._offset;
        }

        public function set offset(k:int):void
        {
            if (((k >= 0) && (k <= this._SafeStr_21823)))
            {
                this._offset = k;
            }
        }

        public function get maxOffset():int
        {
            return this._SafeStr_21823;
        }

        public function set maxOffset(k:int):void
        {
            this._SafeStr_21823 = k;
        }

        override protected function getMessageComposer(k:int, _arg_2:int, _arg_3:int):IMessageComposer
        {
            return new _SafeStr_3836(k, this._offset, _arg_2, _arg_3, _SafeStr_22049, _SafeStr_22050);
        }
    }
}
