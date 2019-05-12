package snowwar._Str_400
{
	import com.sulake.core.communication.messages.IMessageComposer;

    public class _SafeStr_3624 implements IMessageComposer 
    {
        private var _SafeStr_5824:Array;

        public function _SafeStr_3624(k:int)
        {
            this._SafeStr_5824 = [];
            super();
            this._SafeStr_5824.push(k);
        }

        public function getMessageArray():Array
        {
            return this._SafeStr_5824;
        }

        public function dispose():void
        {
        }
    }
}
