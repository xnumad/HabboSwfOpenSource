package snowwar._Str_345
{
	import com.sulake.core.communication.messages.IMessageComposer;
	
    public class _SafeStr_2573 implements IMessageComposer 
    {
        private var _SafeStr_7917:int;

        public function _SafeStr_2573(k:int)
        {
            this._SafeStr_7917 = k;
        }

        public function getMessageArray():Array
        {
            return [this._SafeStr_7917];
        }

        public function dispose():void
        {
        }
    }
}
