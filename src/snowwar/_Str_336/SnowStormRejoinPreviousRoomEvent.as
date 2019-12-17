package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormRejoinPreviousRoomParser;

    public class SnowStormRejoinPreviousRoomEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormRejoinPreviousRoomEvent(k:Function)
        {
            super(k, SnowStormRejoinPreviousRoomParser);
        }

        public function getParser():SnowStormRejoinPreviousRoomParser
        {
            return _parser as SnowStormRejoinPreviousRoomParser;
        }
    }
}
