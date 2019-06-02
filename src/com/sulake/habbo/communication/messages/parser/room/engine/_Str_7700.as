package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7700 implements IMessageParser 
    {
        private var _data:IMessageDataWrapper;
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
            this._x = this._data.readByte();
            this._y = this._data.readByte();
            this._Str_2196 = this._data.readShort();
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
            return HeightMapMessageParser.decodeTileHeight(this._Str_2196);
        }

        public function get window3():Boolean
        {
            return HeightMapMessageParser.decodeIsStackingBlocked(this._Str_2196);
        }

        public function get _Str_10375():Boolean
        {
            return HeightMapMessageParser.decodeIsRoomTile(this._Str_2196);
        }

        public function flush():Boolean
        {
            this._Str_3431 = 0;
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._data = k;
            this._Str_3431 = k.readByte();
            return true;
        }
    }
}
