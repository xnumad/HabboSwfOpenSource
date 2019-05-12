package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormStartBlockTickerParser implements IMessageParser 
    {
        private var _SafeStr_21835:int;

        public function flush():Boolean
        {
            this._SafeStr_21835 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_21835 = k.readInteger();
            return true;
        }

        public function get _SafeStr_18976():int
        {
            return this._SafeStr_21835;
        }
    }
}
