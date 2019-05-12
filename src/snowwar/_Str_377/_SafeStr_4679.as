package snowwar._Str_377
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_4679 extends _SafeStr_4677 
    {
        private var _SafeStr_22188:int;

        public function _SafeStr_4679(k:int)
        {
            super(k);
        }

        public function get _SafeStr_18992():int
        {
            return this._SafeStr_22188;
        }

        override public function parse(k:IMessageDataWrapper):void
        {
            this._SafeStr_22188 = k.readInteger();
        }
    }
}
