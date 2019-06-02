package com.sulake.habbo.communication.messages.outgoing._Str_57
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7393 implements IMessageComposer 
    {
        private var _type:String;

        public function _Str_7393(k:String):void
        {
            this._type = k;
        }

        public function getMessageArray():Array
        {
            return [this._type];
        }

        public function dispose():void
        {
            this._type = null;
        }
    }
}
