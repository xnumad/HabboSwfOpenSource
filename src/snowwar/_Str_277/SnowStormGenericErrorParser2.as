package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormGenericErrorParser2 implements IMessageParser 
    {
        public static const _SafeStr_18959:int = 1;
        public static const _SafeStr_21884:int = 2;
        public static const _SafeStr_21885:int = 3;
        public static const _SafeStr_21886:int = 4;

        private var _SafeStr_15636:int;

        public function get reason():int
        {
            return this._SafeStr_15636;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_15636 = k.readInteger();
            return true;
        }
    }
}
