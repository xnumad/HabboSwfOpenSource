package _Str_356
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_5198 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_5198(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            this._Str_594 = [];
            super();
            this._Str_594.push(k);
            this._Str_594.push(_arg_2);
            this._Str_594.push(_arg_3);
            this._Str_594.push(_arg_4);
            this._Str_594.push(_arg_5);
            this._Str_594.push(_arg_6);
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
