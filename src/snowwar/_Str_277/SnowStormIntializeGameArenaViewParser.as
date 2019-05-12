package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormIntializeGameArenaViewParser implements IMessageParser 
    {
        private var _SafeStr_12655:int;

        public function flush():Boolean
        {
            this._SafeStr_12655 = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_12655 = k.readInteger();
            return true;
        }

        public function get _SafeStr_12658():int
        {
            return this._SafeStr_12655;
        }
    }
}
