package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_8042 implements IMessageComposer 
    {
        private var _Str_2388:int;
        private var _x:int;
        private var _y:int;

        public function _Str_8042(k:int, _arg_2:int, _arg_3:int)
        {
            this._Str_2388 = k;
            this._x = _arg_2;
            this._y = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2388, this._x, this._y];
        }
    }
}
