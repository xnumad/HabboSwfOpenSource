package com.sulake.habbo.communication.messages.outgoing._Str_461
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12104 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_12104(k:int, _arg_2:String, _arg_3:int, _arg_4:int)
        {
            this._Str_594 = [];
            super();
            this._Str_594.push(k);
            this._Str_594.push(_arg_2);
            this._Str_594.push(_arg_3);
            this._Str_594.push(_arg_4);
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
