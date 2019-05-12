package _Str_434
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6542 implements IMessageParser 
    {
        private var _Str_16445:int = -1;
        private var _prizeId:int = 0;


        public function get _Str_19919():int
        {
            return this._Str_16445;
        }

        public function get prizeId():int
        {
            return this._prizeId;
        }

        public function flush():Boolean
        {
            this._Str_16445 = -1;
            this._prizeId = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_16445 = k.readInteger();
            this._prizeId = k.readInteger();
            return true;
        }
    }
}
