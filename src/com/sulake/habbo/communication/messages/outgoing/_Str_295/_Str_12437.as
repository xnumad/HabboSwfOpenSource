package com.sulake.habbo.communication.messages.outgoing._Str_295
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12437 implements IMessageComposer 
    {
        private var _Str_2634:int;

        public function _Str_12437(k:int)
        {
            this._Str_2634 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2634];
        }

        public function dispose():void
        {
        }
    }
}
