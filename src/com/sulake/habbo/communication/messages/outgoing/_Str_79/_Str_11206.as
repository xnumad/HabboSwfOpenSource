package com.sulake.habbo.communication.messages.outgoing._Str_79
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11206 implements IMessageComposer 
    {
        private var _style:int;

        public function _Str_11206(k:int)
        {
            this._style = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._style];
        }
    }
}
