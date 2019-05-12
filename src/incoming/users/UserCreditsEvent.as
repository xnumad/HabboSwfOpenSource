package incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.purse.UserCreditsMessageParser;

    public class UserCreditsEvent extends MessageEvent implements IMessageEvent 
    {
        public function UserCreditsEvent(k:Function)
        {
            super(k, UserCreditsMessageParser);
        }

        public function _Str_2273():UserCreditsMessageParser
        {
            return this._parser as UserCreditsMessageParser;
        }
    }
}
