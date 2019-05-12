package _Str_381
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_4844 implements IMessageComposer 
    {
        public static const _Str_17533:int = 0;
        public static const _Str_8664:int = 1;
        public static const _Str_9186:int = 2;

        private var _Str_594:Array;

        public function _Str_4844(k:int, _arg_2:int, _arg_3:int)
        {
            this._Str_594 = [];
            super();
            this._Str_594.push(k);
            this._Str_594.push(_arg_2);
            this._Str_594.push(_arg_3);
        }

        public function getMessageArray():Array
        {
            return this._Str_594;
        }

        public function dispose():void
        {
            this._Str_594 = null;
        }
    }
}
