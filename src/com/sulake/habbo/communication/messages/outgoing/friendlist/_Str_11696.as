package com.sulake.habbo.communication.messages.outgoing.friendlist
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11696 implements IMessageComposer 
    {
        private var _Str_5045:int;
        private var _Str_19532:int;

        public function _Str_11696(k:int, _arg_2:int)
        {
            this._Str_5045 = k;
            this._Str_19532 = _arg_2;
        }

        public function getMessageArray():Array
        {
            return [this._Str_5045, this._Str_19532];
        }

        public function dispose():void
        {
        }
    }
}
