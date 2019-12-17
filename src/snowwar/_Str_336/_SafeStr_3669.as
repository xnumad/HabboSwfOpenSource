package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277._SafeStr_4568;

    public class _SafeStr_3669 extends MessageEvent implements IMessageEvent 
    {
        public function _SafeStr_3669(k:Function)
        {
            super(k, _SafeStr_4568);
        }

        public function getParser():_SafeStr_4568
        {
            return _parser as _SafeStr_4568;
        }
    }
}
