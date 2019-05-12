package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7700 implements IMessageParser 
    {
        private var _Str_594:IMessageDataWrapper;
        private var _Str_3431:int;
        private var _x:int;
        private var _y:int;
        private var _Str_2196:int;


        public function next():Boolean
        {
            if (this._Str_3431 == 0)
            {
                return false;
            }
            this._Str_3431--;
            this._x = this._Str_594.readByte();
            this._y = this._Str_594.readByte();
            this._Str_2196 = this._Str_594.readShort();
            return true;
        }

        public function get x():int
        {
            return this._x;
        }

        public function get y():int
        {
            return this._y;
        }

        public function get _Str_9852():Number
        {
            return HeightMapMessageParser._Str_15973(this._Str_2196);
        }

        public function get window3():Boolean
        {
            return HeightMapMessageParser._Str_16359(this._Str_2196);
        }

        public function get _Str_10375():Boolean
        {
            return HeightMapMessageParser._Str_18699(this._Str_2196);
        }

        public function flush():Boolean
        {
            this._Str_3431 = 0;
            this._Str_594 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._Str_594 = k;
            this._Str_3431 = k.readByte();
            return true;
        }
    }
}
