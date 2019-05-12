package snowwar._Str_345
{
	import com.sulake.core.communication.messages.IMessageComposer;

    public class _SafeStr_2577 implements IMessageComposer 
    {
        private var _SafeStr_6000:int = 0;

        public function _SafeStr_2577(k:int)
        {
            this._SafeStr_6000 = k;
        }

        public function getMessageArray():Array
        {
            return [this._SafeStr_6000];
        }

        public function dispose():void
        {
        }
    }
}
