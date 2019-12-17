package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormOnStageStartParser;

    public class SnowStormOnStageStartEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormOnStageStartEvent(k:Function)
        {
            super(k, SnowStormOnStageStartParser);
        }

        public function getParser():SnowStormOnStageStartParser
        {
            return _parser as SnowStormOnStageStartParser;
        }
    }
}
