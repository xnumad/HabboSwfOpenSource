package com.sulake.habbo.communication.messages.outgoing._Str_84
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10314 implements IMessageComposer 
    {
        private var _Str_19441:int;

        public function _Str_10314(k:int)
        {
            this._Str_19441 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_19441];
        }

        public function dispose():void
        {
        }

        public function get disposed():Boolean
        {
            return true;
        }
    }
}
