package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormQuePlayerRemovedParser implements IMessageParser 
    {
        private var _userId:int;

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._userId = k.readInteger();
            return true;
        }

        public function get userId():int
        {
            return this._userId;
        }
    }
}
