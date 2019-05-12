package com.sulake.habbo.room.object.visualization.room
{
    import com.sulake.room.object.visualization.IPlaneDrawingData;
    import __AS3__.vec.Vector;
    import flash.geom.Point;

    public class PlaneDrawingData implements IPlaneDrawingData 
    {
        private var _z:Number;
        private var _points:Vector.<Point>;
        private var _color:uint;
        private var _maskAssetNames:Array;
        private var _maskAssetLocations:Array;
        private var _maskAssetFlipHs:Array;
        private var _maskAssetFlipVs:Array;
        private var _alignBottom:Boolean = false;
        private var _assetNames:Array;

        public function PlaneDrawingData(k:PlaneDrawingData=null, _arg_2:uint=0, _arg_3:Boolean=false)
        {
            this._assetNames = [];
            super();
            this._maskAssetNames = [];
            this._maskAssetLocations = [];
            this._maskAssetFlipHs = [];
            this._maskAssetFlipVs = [];
            if (k != null)
            {
                this._maskAssetNames = k._maskAssetNames;
                this._maskAssetLocations = k._maskAssetLocations;
                this._maskAssetFlipHs = k._maskAssetFlipHs;
                this._maskAssetFlipVs = k._maskAssetFlipVs;
            }
            this._color = _arg_2;
            this._alignBottom = _arg_3;
        }

        public function addMask(k:String, _arg_2:Point, _arg_3:Boolean, _arg_4:Boolean):void
        {
            this._maskAssetNames.push(k);
            this._maskAssetLocations.push(_arg_2);
            this._maskAssetFlipHs.push(_arg_3);
            this._maskAssetFlipVs.push(_arg_4);
        }

        public function _Str_22862(k:Array):void
        {
            this._assetNames.push(k);
        }

        public function set z(k:Number):void
        {
            this._z = k;
        }

        public function get z():Number
        {
            return this._z;
        }

        public function set cornerPoints(k:Vector.<Point>):void
        {
            this._points = k;
        }

        public function get cornerPoints():Vector.<Point>
        {
            return this._points;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function get _Str_21807():Array
        {
            return this._maskAssetNames;
        }

        public function get _Str_20731():Array
        {
            return this._maskAssetLocations;
        }

        public function get _Str_21810():Array
        {
            return this._maskAssetFlipHs;
        }

        public function get _Str_19044():Array
        {
            return this._maskAssetFlipVs;
        }

        public function _Str_14945():Boolean
        {
            return this._alignBottom;
        }

        public function get _Str_17636():Array
        {
            return this._assetNames;
        }
    }
}
