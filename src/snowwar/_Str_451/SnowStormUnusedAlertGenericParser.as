package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormUnusedAlertGenericParser implements IMessageParser 
    {
        public static const _SafeStr_21851:int = 1;
        public static const _SafeStr_21852:int = 2;

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
