package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10037 implements IMessageComposer 
    {
        private var _Str_2570:String;

        public function _Str_10037(k:String)
        {
            this._Str_2570 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2570];
        }

        public function dispose():void
        {
            this._Str_2570 = null;
        }
    }
}
