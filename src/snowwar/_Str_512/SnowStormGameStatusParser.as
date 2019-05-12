package snowwar._Str_512
{
    import com.sulake.core.communication.messages.IMessageParser;
    import snowwar._Str_496._SafeStr_4692;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormGameStatusParser implements IMessageParser 
    {
        private var _status:_SafeStr_4692;

        public function get status():_SafeStr_4692
        {
            return this._status;
        }

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._status = new _SafeStr_4692(k);
            return true;
        }
    }
}
