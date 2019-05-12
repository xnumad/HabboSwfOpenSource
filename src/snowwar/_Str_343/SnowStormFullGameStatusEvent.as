package snowwar._Str_343
{
	import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.communication.messages.MessageEvent;
    import snowwar._Str_512.SnowStormFullGameStatusParser;

    public class SnowStormFullGameStatusEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormFullGameStatusEvent(k:Function)
        {
            super(k, SnowStormFullGameStatusParser);
        }

        public function _Str_2273():SnowStormFullGameStatusParser
        {
            return this._parser as SnowStormFullGameStatusParser;
        }
    }
}
