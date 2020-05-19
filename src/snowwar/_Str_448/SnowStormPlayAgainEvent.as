package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar.friendfurni.SnowStormPlayAgainParser;
    import snowwar.friendfurni.SnowStormQuePositionParser;

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
