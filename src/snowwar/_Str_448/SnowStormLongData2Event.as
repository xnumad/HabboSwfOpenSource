package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormLongData2Parser;

    public class SnowStormLongData2Event extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormLongData2Event(k:Function)
        {
            super(k, SnowStormLongData2Parser);
        }

        public function getParser():SnowStormLongData2Parser
        {
            return this._parser as SnowStormLongData2Parser;
        }
    }
}
