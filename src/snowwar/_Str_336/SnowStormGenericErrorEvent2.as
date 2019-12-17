package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormGenericErrorParser2;

    public class SnowStormGenericErrorEvent2 extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormGenericErrorEvent2(k:Function)
        {
            super(k, SnowStormGenericErrorParser2);
        }

        public function getParser():SnowStormGenericErrorParser2
        {
            return _parser as SnowStormGenericErrorParser2;
        }
    }
}
