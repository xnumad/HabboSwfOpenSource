package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormOnPlayerExitedArenaParser implements IMessageParser 
    {
        private var _SafeStr_9687:int;
        private var _SafeStr_21883:int;

        public function flush():Boolean
        {
            this._SafeStr_9687 = NaN;
            this._SafeStr_21883 = NaN;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_9687 = k.readInteger();
            this._SafeStr_21883 = k.readInteger();
            return true;
        }

        public function get userId():int
        {
            return this._SafeStr_9687;
        }

        public function get _SafeStr_18967():int
        {
            return this._SafeStr_21883;
        }
    }
}
