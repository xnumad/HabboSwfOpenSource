package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.StartLobbyCounterParser;

    public class StartLobbyCounterEvent extends MessageEvent implements IMessageEvent 
    {
        public function StartLobbyCounterEvent(k:Function)
        {
            super(k, StartLobbyCounterParser);
        }

        public function _Str_2273():StartLobbyCounterParser
        {
            return this._parser as StartLobbyCounterParser;
        }
    }
}
