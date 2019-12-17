package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormPlayAgainParser;
    import snowwar._Str_451.SnowStormQuePositionParser;

    public class SnowStormPlayAgainEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormPlayAgainEvent(k:Function)
        {
            super(k, SnowStormPlayAgainParser);
        }

        public function getParser():SnowStormQuePositionParser
        {
            return this._parser as SnowStormQuePositionParser;
        }
    }
}
