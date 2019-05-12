package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7691 implements IMessageComposer 
    {
        private var _Str_2388:int;
        private var _Str_19733:Boolean;

        public function _Str_7691(k:int, _arg_2:Boolean)
        {
            this._Str_2388 = k;
            this._Str_19733 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2388, this._Str_19733];
        }
    }
}
