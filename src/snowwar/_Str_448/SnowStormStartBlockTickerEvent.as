package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormStartBlockTickerParser;

    public class SnowStormStartBlockTickerEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormStartBlockTickerEvent(k:Function)
        {
            super(k, SnowStormStartBlockTickerParser);
        }

        public function getParser():SnowStormStartBlockTickerParser
        {
            return this._parser as SnowStormStartBlockTickerParser;
        }
    }
}
