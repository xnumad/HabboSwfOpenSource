package snowwar._Str_496
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_4690 
    {
        private var _SafeStr_22196:int;
        private var _SafeStr_22197:int;
        private var _SafeStr_12654:_SafeStr_3610;
        private var _SafeStr_18581:int;
        private var _SafeStr_22198:_SafeStr_4692;

        public function _SafeStr_4690(k:IMessageDataWrapper)
        {
            this.parse(k);
        }

        public function get _SafeStr_22199():int
        {
            return this._SafeStr_22196;
        }

        public function get _SafeStr_22200():int
        {
            return this._SafeStr_22197;
        }

        public function get _SafeStr_7508():_SafeStr_3610
        {
            return this._SafeStr_12654;
        }

        public function get _SafeStr_13274():int
        {
            return this._SafeStr_18581;
        }

        public function get _SafeStr_18978():_SafeStr_4692
        {
            return this._SafeStr_22198;
        }

        public function parse(k:IMessageDataWrapper):void
        {
            k.readInteger();
            this._SafeStr_22196 = k.readInteger();
            this._SafeStr_22197 = k.readInteger();
            this._SafeStr_12654 = new _SafeStr_3610(k);
            k.readInteger();
            this._SafeStr_18581 = k.readInteger();
            this._SafeStr_22198 = new _SafeStr_4692(k);
        }
    }
}













