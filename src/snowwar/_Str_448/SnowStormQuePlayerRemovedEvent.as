package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar.friendfurni.SnowStormQuePlayerRemovedParser;

    public class SnowStormQuePlayerRemovedEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormQuePlayerRemovedEvent(k:Function)
        {
            super(k, SnowStormQuePlayerRemovedParser);
        }

        public function getParser():SnowStormQuePlayerRemovedParser
        {
            return this._parser as SnowStormQuePlayerRemovedParser;
        }
    }
}
