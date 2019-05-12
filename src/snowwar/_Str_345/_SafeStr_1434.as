package snowwar._Str_345
{
	import com.sulake.core.communication.messages.IMessageComposer;

    public class _SafeStr_1434 implements IMessageComposer 
    {
        private var _SafeStr_6182:String;
        private var _SafeStr_5817:String;
        private var _SafeStr_5072:String;
        private var _SafeStr_7863:String;
        private var _SafeStr_7864:int;

        public function _SafeStr_1434(k:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0)
        {
            if ((((k == null) || (_arg_2 == null)) || (_arg_3 == null)))
            {
                Logger.log("Missing parameter!");
            }
            this._SafeStr_6182 = ((k) ? k : "");
            this._SafeStr_5817 = ((_arg_2) ? _arg_2 : "");
            this._SafeStr_5072 = ((_arg_3) ? _arg_3 : "");
            this._SafeStr_7863 = ((_arg_4) ? _arg_4 : "");
            this._SafeStr_7864 = ((_arg_5) ? _arg_5 : 0);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._SafeStr_6182, this._SafeStr_5817, this._SafeStr_5072, this._SafeStr_7863, this._SafeStr_7864];
        }
    }
}
