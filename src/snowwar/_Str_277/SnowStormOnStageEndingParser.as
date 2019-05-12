package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormOnStageEndingParser implements IMessageParser 
    {
        private var _SafeStr_21840:int;

        public function flush():Boolean
        {
            this._SafeStr_21840 = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_21840 = k.readInteger();
            return true;
        }

        public function get _SafeStr_18963():int
        {
            return this._SafeStr_21840;
        }
    }
}
