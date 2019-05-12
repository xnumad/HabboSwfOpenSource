package _Str_471
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7007 implements IMessageParser 
    {
        private var _errorCode:int = 0;
        private var _Str_21433:String;


        public function get errorCode():int
        {
            return this._errorCode;
        }

        public function get _Str_20676():String
        {
            return this._Str_21433;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._errorCode = k.readInteger();
            this._Str_21433 = k.readString();
            return true;
        }
    }
}
