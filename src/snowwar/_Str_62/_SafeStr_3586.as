package snowwar._Str_62
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_3586 extends SnowWarGameObjectData 
    {
        public static const NUM_OF_VARIABLES:int = 7;

        public function _SafeStr_3586(k:int, _arg_2:int)
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

        public function get _SafeStr_18034():int
        {
            return getVariable(4);
        }

        public function get _SafeStr_18035():int
        {
            return getVariable(5);
        }

        public function get _SafeStr_18032():int
        {
            return getVariable(6);
        }
    }
}
