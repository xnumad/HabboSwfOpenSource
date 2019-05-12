package com.sulake.habbo.communication.messages.outgoing.camera.json
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class JsonPlaneDrawingData 
    {
        private var _z:Number;
        private var _points:Vector.<JsonPoint>;
        private var _color:uint;
        private var _masks:Array;
        private var _isBottomAligned:Boolean;
        private var _texCols:Array;

        public function JsonPlaneDrawingData()
        {
            this._points = new Vector.<JsonPoint>();
            this._masks = [];
            this._texCols = [];
            super();
        }

        public function get z():Number
        {
            return this._z;
        }

        public function set z(k:Number):void
        {
            this._z = k;
        }

        public function get cornerPoints():Vector.<JsonPoint>
        {
            return this._points;
        }

        public function addCornerPoint(k:int, _arg_2:int):void
        {
            this._points.push(new JsonPoint(k, _arg_2));
        }

        public function get masks():Array
        {
            return this._masks;
        }

        public function addMask(k:JsonMaskDrawingData):void
        {
            this._masks.push(k);
        }

        public function get color():uint
        {
            return this._color;
        }

        public function set color(k:uint):void
        {
            this._color = k;
        }

        public function get bottomAligned():Boolean
        {
            return this._isBottomAligned;
        }

        public function setBottomAligned(k:Boolean):void
        {
            this._isBottomAligned = k;
        }

        public function get texCols():Array
        {
            return this._texCols;
        }

        public function addTexCol(k:JsonTextureColumnData):void
        {
            this._texCols.push(k);
        }
    }
}
