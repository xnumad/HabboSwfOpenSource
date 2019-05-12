package com.sulake.habbo.communication.messages.parser.room.layout
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5770 implements IMessageParser 
    {
        private var _x:int;
        private var _y:int;
        private var _dir:uint;


        public function get x():int
        {
            return this._x;
        }

        public function get y():int
        {
            return this._y;
        }

        public function get dir():uint
        {
            return this._dir;
        }

        public function flush():Boolean
        {
            this._x = 0;
            this._y = 0;
            this._dir = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._x = k.readInteger();
            this._y = k.readInteger();
            this._dir = k.readInteger();
            return true;
        }
    }
}
