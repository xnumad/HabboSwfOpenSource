package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class HeightMapMessageParser implements IMessageParser 
    {
        private static const _Str_17076:int = 0x4000;
        private static const _Str_16556:int = 16383;

        private var _data:Vector.<int>;
        private var _width:int = 0;
        private var _height:int = 0;


        public static function _Str_15973(k:int):Number
        {
            return (k < 0) ? -1 : ((k & _Str_16556) / 0x0100);
        }

        public static function _Str_16359(k:int):Boolean
        {
            return Boolean((k & _Str_17076));
        }

        public static function _Str_18699(k:int):Boolean
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
            return _Str_15973(this._data[((_arg_2 * this._width) + k)]);
        }

        public function _Str_25759(k:int, _arg_2:int):Boolean
        {
            if (((((k < 0) || (k >= this._width)) || (_arg_2 < 0)) || (_arg_2 >= this._height)))
            {
                return true;
            }
            return _Str_16359(this._data[((_arg_2 * this._width) + k)]);
        }

        public function _Str_10375(k:int, _arg_2:int):Boolean
        {
            if (((((k < 0) || (k >= this._width)) || (_arg_2 < 0)) || (_arg_2 >= this._height)))
            {
                return false;
            }
            return _Str_18699(this._data[((_arg_2 * this._width) + k)]);
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
