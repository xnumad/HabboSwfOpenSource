package snowwar._Str_512
{
    import com.sulake.core.communication.messages.IMessageParser;
    import snowwar._Str_496._SafeStr_4690;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormFullGameStatusParser implements IMessageParser 
    {
        private var _SafeStr_21831:_SafeStr_4690;

        public function get _SafeStr_18977():_SafeStr_4690
        {
            return this._SafeStr_21831;
        }

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_21831 = new _SafeStr_4690(k);
            return true;
        }
    }
}
