package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
    import snowwar._Str_496._SafeStr_4032;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormQuePlayerAddedParser implements IMessageParser 
    {
        private var _user:_SafeStr_4032;
        private var _SafeStr_21892:Boolean;

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._user = new _SafeStr_4032(k);
            this._SafeStr_21892 = k.readBoolean();
            return true;
        }

        public function get user():_SafeStr_4032
        {
            return this._user;
        }

        public function get _SafeStr_21893():Boolean
        {
            return this._SafeStr_21892;
        }
    }
}
