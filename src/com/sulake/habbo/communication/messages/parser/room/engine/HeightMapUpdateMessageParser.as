package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HeightMapUpdateMessageParser implements IMessageParser
    {
        private var _data:IMessageDataWrapper;
        private var _count:int;
        private var _x:int;
        private var _y:int;
        private var _value:int;


        public function next():Boolean
        {
            if (this._count == 0)
            {
                return false;
            }
            this._count--;
            this._x = this._data.readByte();
            this._y = this._data.readByte();
            this._value = this._data.readShort();
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

        public function get tileHeight():Number
        {
            return HeightMapMessageParser.decodeTileHeight(this._value);
        }

        public function get isStackingBlocked():Boolean
        {
            return HeightMapMessageParser.decodeIsStackingBlocked(this._value);
        }

        public function get isRoomTile():Boolean
        {
            return HeightMapMessageParser.decodeIsRoomTile(this._value);
        }

        public function flush():Boolean
        {
            this._count = 0;
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
            this._count = k.readByte();
            return true;
        }
    }
}
