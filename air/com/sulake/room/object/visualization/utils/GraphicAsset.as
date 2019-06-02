//com.sulake.room.object.visualization.utils.GraphicAsset

package com.sulake.room.object.visualization.utils{
    import __AS3__.vec.Vector;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.IAsset;

    public class GraphicAsset implements IGraphicAsset {

        private static const _POOL:Vector.<GraphicAsset>;

        private var _assetName:String;
        private var _libraryAssetName:String;
        private var _asset:BitmapDataAsset;
        private var _flipH:Boolean;
        private var _flipV:Boolean;
        private var _usesPalette:Boolean;
        private var _offsetX:int;
        private var _offsetY:int;
        private var _width:int;
        private var _height:int;
        private var _initialized:Boolean;

        public function GraphicAsset();

        public static function allocate(k:String, _arg_2:String, _arg_3:IAsset, _arg_4:Boolean, _arg_5:Boolean, _arg_6:int, _arg_7:int, _arg_8:Boolean=false):GraphicAsset;


        public function recycle():void;

        private function initialize():void;

        public function get flipV():Boolean;

        public function get flipH():Boolean;

        public function get width():int;

        public function get height():int;

        public function get assetName():String;

        public function get libraryAssetName():String;

        public function get asset():IAsset;

        public function get usesPalette():Boolean;

        public function get offsetX():int;

        public function get offsetY():int;

        public function get originalOffsetX():int;

        public function get originalOffsetY():int;


    }
}//package com.sulake.room.object.visualization.utils

