package snowwar.friendfurni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormGameEndedParser implements IMessageParser 
    {
        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            return false;
        }
    }
}
