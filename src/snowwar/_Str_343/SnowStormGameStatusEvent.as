package snowwar._Str_343
{
    import com.sulake.core.communication.messages.MessageEvent;
	import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_512.SnowStormGameStatusParser;

    public class SnowStormGameStatusEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormGameStatusEvent(k:Function)
        {
            super(k, SnowStormGameStatusParser);
        }

        public function getParser():SnowStormGameStatusParser
        {
            return this._parser as SnowStormGameStatusParser;
        }
    }
}
