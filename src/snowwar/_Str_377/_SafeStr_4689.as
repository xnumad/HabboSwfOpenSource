package snowwar._Str_377
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_4689 extends _SafeStr_4677 
    {
        private var _SafeStr_22189:int;
        private var _SafeStr_6268:int;
        private var _SafeStr_6269:int;

        public function _SafeStr_4689(k:int)
        {
            super(k);
        }

        public function get _SafeStr_18991():int
        {
            return this._SafeStr_22189;
        }

        public function get x():int
        {
            return this._SafeStr_6268;
        }

        public function get y():int
        {
            return this._SafeStr_6269;
        }

        override public function parse(k:IMessageDataWrapper):void
        {
            this._SafeStr_22189 = k.readInteger();
            this._SafeStr_6268 = k.readInteger();
            this._SafeStr_6269 = k.readInteger();
        }
    }
}
