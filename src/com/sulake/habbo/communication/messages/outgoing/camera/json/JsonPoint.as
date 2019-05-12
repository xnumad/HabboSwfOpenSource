package com.sulake.habbo.communication.messages.outgoing.camera.json
{
    public class JsonPoint 
    {
        private var _x:int;
        private var _y:int;

        public function JsonPoint(k:int, _arg_2:int)
        {
            this._x = k;
            this._y = _arg_2;
        }

        public function get x():int
        {
            return this._x;
        }

        public function get y():int
        {
            return this._y;
        }
    }
}
