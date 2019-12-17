package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormIntializedPlayersParser;

    public class SnowStormIntializedPlayersEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormIntializedPlayersEvent(k:Function)
        {
            super(k, SnowStormIntializedPlayersParser);
        }

        public function getParser():SnowStormIntializedPlayersParser
        {
            return _parser as SnowStormIntializedPlayersParser;
        }
    }
}
