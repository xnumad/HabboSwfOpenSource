package com.sulake.habbo.communication.messages.outgoing._Str_416
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12054 implements IMessageComposer 
    {
        private var _Str_2753:int;
        private var _Str_12385:int;

        public function _Str_12054(k:int, _arg_2:int)
        {
            this._Str_2753 = k;
            this._Str_12385 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2753, this._Str_12385];
        }
    }
}
