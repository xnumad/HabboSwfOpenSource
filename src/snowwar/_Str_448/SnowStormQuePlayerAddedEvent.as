package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormQuePlayerAddedParser;

    public class SnowStormQuePlayerAddedEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormQuePlayerAddedEvent(k:Function)
        {
            super(k, SnowStormQuePlayerAddedParser);
        }

        public function getParser():SnowStormQuePlayerAddedParser
        {
            return this._parser as SnowStormQuePlayerAddedParser;
        }
    }
}
