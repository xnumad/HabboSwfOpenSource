package snowwar._Str_448
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import snowwar._Str_451.SnowStormGamesInformationParser;

    public class SnowStormGamesInformationEvent extends MessageEvent implements IMessageEvent 
    {
        public function SnowStormGamesInformationEvent(k:Function)
        {
            super(k, SnowStormGamesInformationParser);
        }

        public function getParser():SnowStormGamesInformationParser
        {
            return this._parser as SnowStormGamesInformationParser;
        }
    }
}
