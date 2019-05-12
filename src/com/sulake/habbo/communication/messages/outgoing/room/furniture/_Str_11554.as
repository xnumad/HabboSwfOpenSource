package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11554 implements IMessageComposer 
    {
        private var _Str_2502:int;
        private var _name:String;

        public function _Str_11554(k:int, _arg_2:String)
        {
            this._Str_2502 = k;
            this._name = _arg_2;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2502, this._name];
        }

        public function dispose():void
        {
        }
    }
}
