package _Str_411
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7177 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_7177(k:int, _arg_2:String, _arg_3:String)
        {
            this._Str_594 = [];
            super();
            this._Str_594.push(k);
            this._Str_594.push(_arg_2);
            this._Str_594.push(_arg_3);
        }

        public function dispose():void
        {
            this._Str_594 = null;
        }

        public function getMessageArray():Array
        {
            return this._Str_594;
        }
    }
}
