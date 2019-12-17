package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormOnPlayerExitedArenaParser;

    public class SnowStormOnPlayerExitedArenaEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormOnPlayerExitedArenaEvent(k:Function)
        {
            super(k, SnowStormOnPlayerExitedArenaParser);
        }

        public function getParser():SnowStormOnPlayerExitedArenaParser
        {
            return _parser as SnowStormOnPlayerExitedArenaParser;
        }
    }
}
