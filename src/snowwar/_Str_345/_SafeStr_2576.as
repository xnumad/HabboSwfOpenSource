package snowwar._Str_345
{
	import com.sulake.core.communication.messages.IMessageComposer;
	
    public class _SafeStr_2576 implements IMessageComposer 
    {
        private var _SafeStr_13982:int;
        private var _SafeStr_13983:int;
        private var _SafeStr_13984:int;

        public function _SafeStr_2576(k:int, _arg_2:int, _arg_3:int)
        {
            this._SafeStr_13982 = k;
            this._SafeStr_13983 = _arg_2;
            this._SafeStr_13984 = _arg_3;
        }

        public function getMessageArray():Array
        {
            return [this._SafeStr_13982, this._SafeStr_13983, this._SafeStr_13984];
        }

        public function dispose():void
        {
        }
    }
}
