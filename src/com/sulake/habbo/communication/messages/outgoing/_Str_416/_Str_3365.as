package com.sulake.habbo.communication.messages.outgoing._Str_416
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_3365 implements IMessageComposer 
    {
        private var _Str_2753:int;
        private var _Str_12385:int;
        private var _Str_21366:String;

        public function _Str_3365(k:int, _arg_2:int, _arg_3:String)
        {
            this._Str_2753 = k;
            this._Str_12385 = _arg_2;
            this._Str_21366 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2753, this._Str_12385, this._Str_21366];
        }
    }
}
