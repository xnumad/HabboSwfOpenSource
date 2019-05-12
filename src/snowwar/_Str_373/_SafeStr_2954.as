package snowwar._Str_373
{
	import com.sulake.core.communication.messages.IMessageComposer;

    public class _SafeStr_2954 implements IMessageComposer 
    {
        private var _SafeStr_16356:String;

        public function _SafeStr_2954(k:String)
        {
            this._SafeStr_16356 = k;
        }

        public function getMessageArray():Array
        {
            return [this._SafeStr_16356];
        }

        public function dispose():void
        {
            this._SafeStr_16356 = null;
        }
    }
}
