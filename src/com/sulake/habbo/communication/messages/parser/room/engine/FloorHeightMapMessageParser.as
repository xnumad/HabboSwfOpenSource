package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FloorHeightMapMessageParser implements IMessageParser 
    {
        private var _text:String = "";
        private var _heightMap:Array;
        private var _width:int = 0;
        private var _height:int = 0;
        private var _scale:Number = 0;
        private var _fixedWallsHeight:int = -1;

        public function FloorHeightMapMessageParser()
        {
            this._heightMap = [];
            super();
        }

        public function get width():int
        {
            return this._width;
        }

        public function get height():int
        {
            return this._height;
        }

        public function get fixedWallsHeight():int
        {
            return this._fixedWallsHeight;
        }

        public function get scale():Number
        {
            return this._scale;
        }

        public function _Str_2754(k:int, _arg_2:int):int
        {
            if (((((k < 0) || (k >= this.width)) || (_arg_2 < 0)) || (_arg_2 >= this.height)))
            {
                return RoomPlaneParser.TILE_BLOCKED;
            }
            var _local_3:Array = (this._heightMap[_arg_2] as Array);
            return _local_3[k];
        }

        public function flush():Boolean
        {
            this._heightMap = [];
            this._width = 0;
            this._height = 0;
            this._text = "";
            this._fixedWallsHeight = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_11:String;
            if (k == null)
            {
                return false;
            }
            var _local_2:Boolean = k.readBoolean();
            this._fixedWallsHeight = k.readInteger();
            this._text = k.readString();
            var _local_3:Array = this._text.split("\r");
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:Array;
            var _local_8:int = _local_3.length;
            var _local_9:int;
            var _local_10:String;
            _local_5 = 0;
            while (_local_5 < _local_8)
            {
                _local_10 = (_local_3[_local_5] as String);
                if (_local_10.length > _local_9)
                {
                    _local_9 = _local_10.length;
                }
                _local_5++;
            }
            this._heightMap = [];
            _local_5 = 0;
            while (_local_5 < _local_8)
            {
                _local_7 = [];
                _local_4 = 0;
                while (_local_4 < _local_9)
                {
                    _local_7.push(RoomPlaneParser.TILE_BLOCKED);
                    _local_4++;
                }
                this._heightMap.push(_local_7);
                _local_5++;
            }
            this._width = _local_9;
            this._height = _local_8;
            _local_5 = 0;
            while (_local_5 < _local_3.length)
            {
                _local_7 = (this._heightMap[_local_5] as Array);
                _local_10 = (_local_3[_local_5] as String);
                if (_local_10.length > 0)
                {
                    _local_4 = 0;
                    while (_local_4 < _local_10.length)
                    {
                        _local_11 = _local_10.charAt(_local_4);
                        if (((!(_local_11 == "x")) && (!(_local_11 == "X"))))
                        {
                            _local_6 = parseInt(_local_11, 36);
                        }
                        else
                        {
                            _local_6 = RoomPlaneParser.TILE_BLOCKED;
                        }
                        _local_7[_local_4] = _local_6;
                        _local_4++;
                    }
                }
                _local_5++;
            }
            this._scale = ((_local_2) ? 32 : 64);
            return true;
        }

        public function get text():String
        {
            return this._text;
        }
    }
}
