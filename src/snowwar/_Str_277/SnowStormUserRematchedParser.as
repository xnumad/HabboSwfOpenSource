package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormUserRematchedParser implements IMessageParser 
    {
        private var _SafeStr_9687:int;

        public function get userId():int
        {
            return this._SafeStr_9687;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_9687 = k.readInteger();
            return true;
        }
    }
}
