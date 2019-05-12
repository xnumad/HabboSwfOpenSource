package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormOnStageEndingParser;

    public class SnowStormOnStageEndingEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormOnStageEndingEvent(k:Function)
        {
            super(k, SnowStormOnStageEndingParser);
        }

        public function _Str_2273():SnowStormOnStageEndingParser
        {
            return _parser as SnowStormOnStageEndingParser;
        }
    }
}
