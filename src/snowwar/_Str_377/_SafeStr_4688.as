package snowwar._Str_377
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_4688 extends _SafeStr_4677 
    {
        private var _SafeStr_22189:int;
        private var _SafeStr_20901:int;
        private var _SafeStr_20902:int;
        private var _SafeStr_19035:int;

        public function _SafeStr_4688(k:int)
        {
            super(k);
        }

        public function get _SafeStr_18991():int
        {
            return this._SafeStr_22189;
        }

        public function get targetX():int
        {
            return this._SafeStr_20901;
        }

        public function get _SafeStr_16005():int
        {
            return this._SafeStr_20902;
        }

        public function get _SafeStr_18038():int
        {
            return this._SafeStr_19035;
        }

        override public function parse(k:IMessageDataWrapper):void
        {
            this._SafeStr_22189 = k.readInteger();
            this._SafeStr_20901 = k.readInteger();
            this._SafeStr_20902 = k.readInteger();
            this._SafeStr_19035 = k.readInteger();
        }
    }
}
