package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10596 implements IMessageComposer 
    {
        private var _x:int;
        private var _y:int;

        public function _Str_10596(k:int, _arg_2:int)
        {
            this._x = k;
            this._y = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._x, this._y];
        }
    }
}
