package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
    import snowwar._Str_496._SafeStr_4018;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormLongDataParser implements IMessageParser 
    {
        private var _SafeStr_21881:_SafeStr_4018;

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_21881 = new _SafeStr_4018(k);
            return true;
        }

        public function get _SafeStr_18970():_SafeStr_4018
        {
            return this._SafeStr_21881;
        }
    }
}
