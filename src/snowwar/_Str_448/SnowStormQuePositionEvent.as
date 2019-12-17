package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormQuePositionParser;

    public class SnowStormQuePositionEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormQuePositionEvent(k:Function)
        {
            super(k, SnowStormQuePositionParser);
        }

        public function getParser():SnowStormQuePositionParser
        {
            return this._parser as SnowStormQuePositionParser;
        }
    }
}
