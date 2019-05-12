package snowwar._Str_62
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_3585 extends SnowWarGameObjectData 
    {
        public static const _SafeStr_12576:int = 8;

        public function _SafeStr_3585(k:int, _arg_2:int)
        {
            super(k, _arg_2);
        }

        override public function parse(k:IMessageDataWrapper):void
        {
            _SafeStr_12575(k, _SafeStr_12576);
        }

        public function get x():int
        {
            return getVariable(2);
        }

        public function get y():int
        {
            return getVariable(3);
        }

        public function get direction():int
        {
            return getVariable(4);
        }

        public function get _SafeStr_18034():int
        {
            return getVariable(5);
        }

        public function get _SafeStr_18035():int
        {
            return getVariable(6);
        }

        public function get _SafeStr_18032():int
        {
            return getVariable(7);
        }
    }
}
