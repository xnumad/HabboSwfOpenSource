package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12401 implements IMessageComposer 
    {
        private var _objectId:int;
        private var _Str_2487:int = 0;

        public function _Str_12401(k:int, _arg_2:int=0)
        {
            this._objectId = k;
            this._Str_2487 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._objectId, this._Str_2487];
        }
    }
}
