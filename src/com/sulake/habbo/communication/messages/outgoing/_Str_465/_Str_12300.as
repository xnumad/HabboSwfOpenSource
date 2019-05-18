package com.sulake.habbo.communication.messages.outgoing._Str_465
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12300 implements IMessageComposer 
    {
        private var _Str_17731:String;

        public function _Str_12300(k:String)
        {
            this._Str_17731 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_17731];
        }

        public function dispose():void
        {
            this._Str_17731 = null;
        }
    }
}
