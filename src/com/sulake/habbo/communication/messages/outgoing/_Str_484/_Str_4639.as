package com.sulake.habbo.communication.messages.outgoing._Str_484
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_4639 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_4639(k:String, _arg_2:String)
        {
            this._Str_594 = [];
            super();
            this._Str_594.push(_arg_2);
            this._Str_594.push(k);
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
