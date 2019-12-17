package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormUserRematchedParser;

    public class SnowStormUserRematchedEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormUserRematchedEvent(k:Function)
        {
            super(k, SnowStormUserRematchedParser);
        }

        public function getParser():SnowStormUserRematchedParser
        {
            return _parser as SnowStormUserRematchedParser;
        }
    }
}
