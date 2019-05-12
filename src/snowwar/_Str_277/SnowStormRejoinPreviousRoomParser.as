package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormRejoinPreviousRoomParser implements IMessageParser 
    {
        private var _SafeStr_13167:int;

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_13167 = k.readInteger();
            return true;
        }

        public function get rejoinRoom():int
        {
            return this._SafeStr_13167;
        }
    }
}
