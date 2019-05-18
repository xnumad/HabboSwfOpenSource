package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_17078 implements IMessageComposer 
    {
        private var _Str_20608:int;

        public function _Str_17078(k:int)
        {
            this._Str_20608 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_20608];
        }

        public function dispose():void
        {
        }
    }
}
