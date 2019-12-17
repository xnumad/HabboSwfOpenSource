package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormGamesLeftParser;

    public class SnowStormGamesLeftEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormGamesLeftEvent(k:Function)
        {
            super(k, SnowStormGamesLeftParser);
        }

        public function getParser():SnowStormGamesLeftParser
        {
            return this._parser as SnowStormGamesLeftParser;
        }
    }
}
