package snowwar.outgoing
{
	import com.sulake.core.communication.messages.IMessageComposer;

    public class _SafeStr_3969 implements IMessageComposer 
    {
        private var _SafeStr_5824:Array;

        public function _SafeStr_3969(k:int, _arg_2:int)
        {
            this._SafeStr_5824 = [];
            super();
            this._SafeStr_5824.push(k);
            this._SafeStr_5824.push(_arg_2);
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
