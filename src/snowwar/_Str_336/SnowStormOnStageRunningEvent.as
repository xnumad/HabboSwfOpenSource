package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormOnStageRunningParser;

    public class SnowStormOnStageRunningEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormOnStageRunningEvent(k:Function)
        {
            super(k, SnowStormOnStageRunningParser);
        }

        public function getParser():SnowStormOnStageRunningParser
        {
            return _parser as SnowStormOnStageRunningParser;
        }
    }
}
