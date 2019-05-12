package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormGenericErrorParser implements IMessageParser 
    {
        public static const _SafeStr_21887:int = 1;
        public static const _SafeStr_13125:int = 2;
        public static const _SafeStr_21888:int = 3;
        public static const _SafeStr_21889:int = 4;
        public static const _SafeStr_21890:int = 5;
        public static const _SafeStr_18973:int = 6;
        public static const _SafeStr_18974:int = 7;
        public static const _SafeStr_18975:int = 8;

        private var _reason:int;

        public function get reason():int
        {
            return this._reason;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._reason = k.readInteger();
            return true;
        }
    }
}
