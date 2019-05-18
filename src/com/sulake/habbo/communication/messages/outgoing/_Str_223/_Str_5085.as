package com.sulake.habbo.communication.messages.outgoing._Str_223
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_5085 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_5085(k:Boolean, _arg_2:int)
        {
            this._Str_594 = [];
            super();
            this._Str_594.push(k);
            this._Str_594.push(_arg_2);
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
