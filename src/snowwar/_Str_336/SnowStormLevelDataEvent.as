package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormLevelDataParser;

    public class SnowStormLevelDataEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormLevelDataEvent(k:Function)
        {
            super(k, SnowStormLevelDataParser);
        }

        public function getParser():SnowStormLevelDataParser
        {
            return _parser as SnowStormLevelDataParser;
        }
    }
}
