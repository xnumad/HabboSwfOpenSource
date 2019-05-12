package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormOnStageRunningParser implements IMessageParser 
    {
        private var _time:int;

        public function flush():Boolean
        {
            this._time = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._time = k.readInteger();
            return true;
        }

        public function get time():int
        {
            return this._time;
        }
    }
}
