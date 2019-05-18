package com.sulake.habbo.communication.messages.outgoing._Str_495
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_9928 implements IMessageComposer 
    {
        private var _Str_7397:String;

        public function _Str_9928(k:String)
        {
            this._Str_7397 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_7397];
        }

        public function dispose():void
        {
            this._Str_7397 = null;
        }
    }
}
