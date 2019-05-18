package com.sulake.habbo.communication.messages.outgoing._Str_79
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10078 implements IMessageComposer 
    {
        private var _Str_3147:int;

        public function _Str_10078(k:int)
        {
            this._Str_3147 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_3147];
        }

        public function dispose():void
        {
        }
    }
}
