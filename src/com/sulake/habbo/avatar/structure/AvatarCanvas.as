package com.sulake.habbo.avatar.structure
{
    import flash.geom.Point;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;

    public class AvatarCanvas 
    {
        private var _id:String;
        private var _width:int;
        private var _height:int;
        private var _offset:Point;
        private var _regPoint:Point;

        public function AvatarCanvas(k:XML, _arg_2:String)
        {
            this._id = String(k.@id);
            this._width = parseInt(k.@width);
            this._height = parseInt(k.@height);
            this._offset = new Point(parseInt(k.@dx), parseInt(k.@dy));
            if (_arg_2 == AvatarScaleType.LARGE)
            {
                this._regPoint = new Point(((this._width - 64) / 2), 0);
            }
            else
            {
                this._regPoint = new Point(((this._width - 32) / 2), 0);
            }
        }

        public function get width():int
        {
            return this._width;
        }

        public function get height():int
        {
            return this._height;
        }

        public function get offset():Point
        {
            return this._offset;
        }

        public function get id():String
        {
            return this._id;
        }

        public function get _Str_1076():Point
        {
            return this._regPoint;
        }
    }
}
