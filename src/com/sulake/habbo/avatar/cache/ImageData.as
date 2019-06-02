package com.sulake.habbo.avatar.cache
{
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.geom.ColorTransform;

    public class ImageData 
    {
        private var _bitmap:BitmapData;
        private var _rect:Rectangle;
        private var _regPoint:Point;
        private var _flipH:Boolean;
        private var _colorTransform:ColorTransform;

        public function ImageData(k:BitmapData, _arg_2:Rectangle, _arg_3:Point, _arg_4:Boolean, _arg_5:ColorTransform)
        {
            this._bitmap = k;
            this._rect = _arg_2;
            this._regPoint = _arg_3;
            this._flipH = _arg_4;
            this._colorTransform = _arg_5;
            if (_arg_4)
            {
                this._regPoint.x = (-(this._regPoint.x) + _arg_2.width);
            }
        }

        public function dispose():void
        {
            this._bitmap = null;
            this._regPoint = null;
            this._colorTransform = null;
        }

        public function get bitmap():BitmapData
        {
            return this._bitmap;
        }

        public function get rect():Rectangle
        {
            return this._rect;
        }

        public function get _Str_1076():Point
        {
            return this._regPoint;
        }

        public function get flipH():Boolean
        {
            return this._flipH;
        }

        public function get colorTransform():ColorTransform
        {
            return this._colorTransform;
        }

        public function get offsetRect():Rectangle
        {
            var k:Rectangle = new Rectangle(0, 0, this._rect.width, this._rect.height);
            k.offset(-(this._regPoint.x), -(this._regPoint.y));
            return k;
        }
    }
}
