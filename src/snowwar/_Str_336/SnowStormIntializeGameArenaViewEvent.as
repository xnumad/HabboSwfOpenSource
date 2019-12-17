package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormIntializeGameArenaViewParser;

    public class SnowStormIntializeGameArenaViewEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormIntializeGameArenaViewEvent(k:Function)
        {
            super(k, SnowStormIntializeGameArenaViewParser);
        }

        public function getParser():SnowStormIntializeGameArenaViewParser
        {
            return _parser as SnowStormIntializeGameArenaViewParser;
        }
    }
}
