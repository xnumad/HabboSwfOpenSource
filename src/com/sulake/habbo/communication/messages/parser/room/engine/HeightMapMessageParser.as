package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class HeightMapMessageParser implements IMessageParser 
    {
        private static const STACKING_BLOCKED:int = 0x4000;
        private static const HEIGHT_MASK:int = 16383;

        private var _data:Vector.<int>;
        private var _width:int = 0;
        private var _height:int = 0;


        public static function decodeTileHeight(k:int):Number
        {
            return (k < 0) ? -1 : ((k & HEIGHT_MASK) / 0x0100);
        }

        public static function decodeIsStackingBlocked(k:int):Boolean
        {
            return Boolean((k & STACKING_BLOCKED));
        }

        public static function decodeIsRoomTile(k:int):Boolean
        {
            return k >= 0;
        }


        public function get width():int
        {
            return this._width;
        }

        public function get height():int
        {
            return this._height;
        }

        public function _Str_2754(k:int, _arg_2:int):Number
        {
            if (((((k < 0) || (k >= this._width)) || (_arg_2 < 0)) || (_arg_2 >= this._height)))
            {
                return -1;
            }
            return decodeTileHeight(this._data[((_arg_2 * this._width) + k)]);
        }

        public function getStackingBlocked(k:int, _arg_2:int):Boolean
        {
            if (((((k < 0) || (k >= this._width)) || (_arg_2 < 0)) || (_arg_2 >= this._height)))
            {
                return true;
            }
            return decodeIsStackingBlocked(this._data[((_arg_2 * this._width) + k)]);
        }

        public function _Str_10375(k:int, _arg_2:int):Boolean
        {
            if (((((k < 0) || (k >= this._width)) || (_arg_2 < 0)) || (_arg_2 >= this._height)))
            {
                return false;
            }
            return decodeIsRoomTile(this._data[((_arg_2 * this._width) + k)]);
        }

        public function flush():Boolean
        {
            this._data = null;
            this._width = 0;
            this._height = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._width = k.readInteger();
            var _local_2:int = k.readInteger();
            this._height = (_local_2 / this._width);
            this._data = new Vector.<int>(_local_2);
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._data[_local_3] = k.readShort();
                _local_3++;
            }
            return true;
        }
    }
}
