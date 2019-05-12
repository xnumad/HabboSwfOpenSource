package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
    import snowwar._Str_496._SafeStr_4018;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormGameStartedParser implements IMessageParser 
    {
        private var _SafeStr_18794:_SafeStr_4018;

        public function get _SafeStr_18971():_SafeStr_4018
        {
            return this._SafeStr_18794;
        }

        public function flush():Boolean
        {
            this._SafeStr_18794 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_18794 = new _SafeStr_4018(k);
            return true;
        }
    }
}
