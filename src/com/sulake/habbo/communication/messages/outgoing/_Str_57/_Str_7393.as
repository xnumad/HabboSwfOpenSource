package com.sulake.habbo.communication.messages.outgoing._Str_57
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7393 implements IMessageComposer 
    {
        private var _Str_578:String;

        public function _Str_7393(k:String):void
        {
            this._Str_578 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_578];
        }

        public function dispose():void
        {
            this._Str_578 = null;
        }
    }
}
