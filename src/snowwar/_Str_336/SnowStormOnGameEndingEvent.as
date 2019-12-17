package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormOnGameEndingParser;

    public class SnowStormOnGameEndingEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormOnGameEndingEvent(k:Function)
        {
            super(k, SnowStormOnGameEndingParser);
        }

        public function getParser():SnowStormOnGameEndingParser
        {
            return _parser as SnowStormOnGameEndingParser;
        }
    }
}
