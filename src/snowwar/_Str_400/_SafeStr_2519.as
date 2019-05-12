package snowwar._Str_400
{
	import com.sulake.core.communication.messages.IMessageComposer;

    public class _SafeStr_2519 implements IMessageComposer 
    {
        private var _SafeStr_5824:Array;

        public function _SafeStr_2519()
        {
            this._SafeStr_5824 = [];
            super();
        }

        public function getMessageArray():Array
        {
            return this._SafeStr_5824;
        }

        public function dispose():void
        {
            this._SafeStr_5824 = [];
        }
    }
}
