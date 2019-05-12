package snowwar._Str_373
{
	import com.sulake.core.communication.messages.IMessageComposer;

    public class _SafeStr_3665 implements IMessageComposer 
    {
        private var _SafeStr_18269:Boolean;

        public function _SafeStr_3665(k:Boolean=true)
        {
            this._SafeStr_18269 = k;
        }

        public function getMessageArray():Array
        {
            return [this._SafeStr_18269];
        }

        public function dispose():void
        {
        }
    }
}
