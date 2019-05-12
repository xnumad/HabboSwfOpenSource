package snowwar._Str_345
{
	import com.sulake.core.communication.messages.IMessageComposer;
	
    public class _SafeStr_2571 implements IMessageComposer 
    {
        private var _SafeStr_5584:Array;

        public function _SafeStr_2571(k:int, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:Boolean, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int, _arg_11:int)
        {
            this._SafeStr_5584 = [k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11];
        }

        public function dispose():void
        {
            this._SafeStr_5584 = null;
        }

        public function getMessageArray():Array
        {
            return this._SafeStr_5584;
        }
    }
}
