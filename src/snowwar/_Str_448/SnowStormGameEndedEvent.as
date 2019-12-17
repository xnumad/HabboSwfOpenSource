package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormGameEndedParser;

    public class SnowStormGameEndedEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormGameEndedEvent(k:Function)
        {
            super(k, SnowStormGameEndedParser);
        }

        public function getParser():SnowStormGameEndedParser
        {
            return this._parser as SnowStormGameEndedParser;
        }
    }
}
