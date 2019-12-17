package snowwar._Str_336
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_277.SnowStormUserChatMessageParser;

    public class SnowStormUserChatMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormUserChatMessageEvent(k:Function)
        {
            super(k, SnowStormUserChatMessageParser);
        }

        public function getParser():SnowStormUserChatMessageParser
        {
            return _parser as SnowStormUserChatMessageParser;
        }
    }
}
