package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7684 implements IMessageComposer 
    {
        private var _Str_2319:int;
        private var _x:int;
        private var _y:int;
        private var _direction:int;

        public function _Str_7684(k:int, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            this._Str_2319 = k;
            this._x = _arg_2;
            this._y = _arg_3;
            this._direction = _arg_4;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2319, this._x, this._y, this._direction];
        }
    }
}
