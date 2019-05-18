package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11905 implements IMessageComposer 
    {
        private var _Str_2507:int;

        public function _Str_11905(k:int)
        {
            this._Str_2507 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2507];
        }

        public function dispose():void
        {
        }
    }
}
