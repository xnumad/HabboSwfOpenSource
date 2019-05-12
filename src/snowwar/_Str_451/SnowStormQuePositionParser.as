package snowwar._Str_451
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormQuePositionParser implements IMessageParser 
    {
        private var _position:int;

        public function get position():int
        {
            return this._position;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._position = k.readInteger();
            return true;
        }
    }
}
