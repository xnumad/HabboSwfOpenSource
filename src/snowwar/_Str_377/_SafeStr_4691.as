package snowwar._Str_377
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_4691 extends _SafeStr_4677 
    {
        private var _SafeStr_22189:int;
        private var _SafeStr_22201:int;
        private var _SafeStr_19035:int;

        public function _SafeStr_4691(k:int)
        {
            super(k);
        }

        public function get _SafeStr_18991():int
        {
            return this._SafeStr_22189;
        }

        public function get _SafeStr_18993():int
        {
            return this._SafeStr_22201;
        }

        public function get _SafeStr_18038():int
        {
            return this._SafeStr_19035;
        }

        override public function parse(k:IMessageDataWrapper):void
        {
            this._SafeStr_22189 = k.readInteger();
            this._SafeStr_22201 = k.readInteger();
            this._SafeStr_19035 = k.readInteger();
        }
    }
}
