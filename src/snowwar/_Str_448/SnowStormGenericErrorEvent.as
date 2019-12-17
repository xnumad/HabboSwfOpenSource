package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormGenericErrorParser;

    public class SnowStormGenericErrorEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormGenericErrorEvent(k:Function)
        {
            super(k, SnowStormGenericErrorParser);
        }

        public function getParser():SnowStormGenericErrorParser
        {
            return this._parser as SnowStormGenericErrorParser;
        }
    }
}
