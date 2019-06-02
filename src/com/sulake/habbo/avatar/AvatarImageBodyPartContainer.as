package com.sulake.habbo.avatar
{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class AvatarImageBodyPartContainer 
    {
        private var _image:BitmapData;
        private var _regPoint:Point;
        private var _offset:Point;
        private var _isCacheable:Boolean;

        public function AvatarImageBodyPartContainer(k:BitmapData, _arg_2:Point, _arg_3:Boolean)
        {
            this._offset = new Point(0, 0);
            super();
            this._image = k;
            this._regPoint = _arg_2;
            this._isCacheable = _arg_3;
            this.cleanPoints();
        }

        public function get isCacheable():Boolean
        {
            return this._isCacheable;
        }

        public function dispose():void
        {
            if (this._image)
            {
                this._image.dispose();
            }
            this._image = null;
            this._regPoint = null;
            this._offset = null;
        }

        public function set image(k:BitmapData):void
        {
            if (((this._image) && (!(this._image == k))))
            {
                this._image.dispose();
            }
            this._image = k;
        }

        public function get image():BitmapData
        {
            return this._image;
        }

        public function _Str_1387(k:Point):void
        {
            this._regPoint = k;
            this.cleanPoints();
        }

        public function get _Str_1076():Point
        {
            return this._regPoint.add(this._offset);
        }

        public function set offset(k:Point):void
        {
            this._offset = k;
            this.cleanPoints();
        }

        private function cleanPoints():void
        {
            this._regPoint.x = int(this._regPoint.x);
            this._regPoint.y = int(this._regPoint.y);
            this._offset.x = int(this._offset.x);
            this._offset.y = int(this._offset.y);
        }
    }
}
