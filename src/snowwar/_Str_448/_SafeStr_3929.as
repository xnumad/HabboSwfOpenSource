package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451._SafeStr_4642;

    public class _SafeStr_3929 extends MessageEvent implements IMessageEvent 
    {
        public function _SafeStr_3929(k:Function)
        {
            super(k, _SafeStr_4642);
        }

        public function getParser():_SafeStr_4642
        {
            return this._parser as _SafeStr_4642;
        }
    }
}
