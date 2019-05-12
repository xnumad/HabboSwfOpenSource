package _Str_434
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7318 implements IMessageParser 
    {
        private var _Str_16336:int = -1;
        private var _Str_16519:int = 0;


        public function get _Str_24457():int
        {
            return this._Str_16336;
        }

        public function get _Str_24666():int
        {
            return this._Str_16519;
        }

        public function flush():Boolean
        {
            this._Str_16336 = -1;
            this._Str_16519 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_16336 = k.readInteger();
            this._Str_16519 = k.readInteger();
            return true;
        }
    }
}
