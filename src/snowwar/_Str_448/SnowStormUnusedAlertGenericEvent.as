package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar.friendfurni.SnowStormUnusedAlertGenericParser;

    public class SnowStormUnusedAlertGenericEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormUnusedAlertGenericEvent(k:Function)
        {
            super(k, SnowStormUnusedAlertGenericParser);
        }

        public function getParser():SnowStormUnusedAlertGenericParser
        {
            return this._parser as SnowStormUnusedAlertGenericParser;
        }
    }
}
