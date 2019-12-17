package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormLongDataParser;

    public class SnowStormLongDataEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormLongDataEvent(k:Function)
        {
            super(k, SnowStormLongDataParser);
        }

        public function getParser():SnowStormLongDataParser
        {
            return this._parser as SnowStormLongDataParser;
        }
    }
}
