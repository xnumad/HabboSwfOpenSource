package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12242 implements IMessageComposer 
    {
        private var _name:String;
        private var _Str_578:int;

        public function _Str_12242(k:String, _arg_2:int)
        {
            this._name = k;
            this._Str_578 = _arg_2;
        }

        public function getMessageArray():Array
        {
            return [this._name, this._Str_578];
        }

        public function dispose():void
        {
        }
    }
}
