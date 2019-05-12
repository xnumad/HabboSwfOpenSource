package snowwar._Str_277
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowStormIntializedPlayersParser implements IMessageParser 
    {
        private var _SafeStr_21868:int;
        private var _SafeStr_21869:Array;

        public function get _SafeStr_18960():int
        {
            return this._SafeStr_21868;
        }

        public function get _SafeStr_18961():Array
        {
            return this._SafeStr_21869;
        }

        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._SafeStr_21868 = k.readInteger();
            this._SafeStr_21869 = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._SafeStr_21869.push(k.readInteger());
                _local_3++;
            }
            return true;
        }
    }
}
