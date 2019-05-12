package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class StartLobbyCounterParser implements IMessageParser 
    {
        private var _SafeStr_21848:int;

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_21848 = k.readInteger();
            return true;
        }

        public function get _SafeStr_18972():int
        {
            return this._SafeStr_21848;
        }
    }
}
