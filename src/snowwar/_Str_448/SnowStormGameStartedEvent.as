package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormGameStartedParser;

    public class SnowStormGameStartedEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormGameStartedEvent(k:Function)
        {
            super(k, SnowStormGameStartedParser);
        }

        public function getParser():SnowStormGameStartedParser
        {
            return this._parser as SnowStormGameStartedParser;
        }
    }
}
