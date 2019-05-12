package snowwar._Str_477
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _SafeStr_3776 implements IMessageComposer 
    {
        private var _SafeStr_5824:Array;

        public function _SafeStr_3776(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            this._SafeStr_5824 = [];
            super();
            this._SafeStr_5824.push(k);
            this._SafeStr_5824.push(_arg_2);
            this._SafeStr_5824.push(_arg_3);
            this._SafeStr_5824.push(_arg_4);
            this._SafeStr_5824.push(_arg_5);
        }

        public function getMessageArray():Array
        {
            return this._SafeStr_5824;
        }

        public function dispose():void
        {
            this._SafeStr_5824 = null;
        }
    }
}
