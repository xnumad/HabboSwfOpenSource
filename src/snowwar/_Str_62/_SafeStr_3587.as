package snowwar._Str_62
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_3587 extends SnowWarGameObjectData 
    {
        public static const NUM_OF_VARIABLES:int = 11;
        public static const _SafeStr_13247:int = 0;
        public static const _SafeStr_13245:int = 1;
        public static const _SafeStr_13243:int = 2;

        public function _SafeStr_3587(k:int, _arg_2:int)
        {
            super(k, _arg_2);
        }

        override public function parse(k:IMessageDataWrapper):void
        {
            parseVariables(k, NUM_OF_VARIABLES);
        }

        public function get x():int
        {
            return getVariable(2);
        }

        public function get y():int
        {
            return getVariable(3);
        }

        public function get _SafeStr_18036():int
        {
            return getVariable(4);
        }

        public function get _SafeStr_18037():int
        {
            return getVariable(5);
        }

        public function get _SafeStr_18038():int
        {
            return getVariable(6);
        }

        public function get _SafeStr_18039():int
        {
            return getVariable(7);
        }

        public function get _SafeStr_18040():int
        {
            return getVariable(8);
        }

        public function get _SafeStr_18041():int
        {
            return getVariable(9);
        }

        public function get _SafeStr_18042():int
        {
            return getVariable(10);
        }
    }
}
