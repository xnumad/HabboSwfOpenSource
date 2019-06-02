//com.sulake.room.object.visualization.utils.GraphicAssetCollection

package com.sulake.room.object.visualization.utils{
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;

    public class GraphicAssetCollection implements IGraphicAssetCollection {

        private static const PALETTE_ASSET_DISPOSE_THRESHOLD:int;
        private static const PALETTE_ATTRIBUTES:Array;
        private static const USE_LAZY_ASSETS:Boolean;

        private var _assets:Map;
        private var _library:IAssetLibrary;
        private var _palettes:Map;
        private var _paletteAssetNames:Array;
        private var _paletteXMLs:Map;
        private var _referenceCount:int;
        private var _referenceTimeStamp:int;
        private var _lazyAssetTable:Dictionary;

        public function GraphicAssetCollection();

        public function dispose():void;

        public function set assetLibrary(k:IAssetLibrary):void;

        public function addReference():void;

        public function removeReference():void;

        public function getReferenceCount():int;

        public function getLastReferenceTimeStamp():int;

        public function define(k:XML):Boolean;

        private function defineAssetsLazy(k:XMLList):void;

        private function defineAssets(k:XMLList):void;

        private function definePalettes(k:XMLList):void;

        protected function createAsset(k:String, _arg_2:String, _arg_3:IAsset, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Number, _arg_7:Number, _arg_8:Boolean):Boolean;

        protected function replaceAsset(k:String, _arg_2:String, _arg_3:IAsset, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Number, _arg_7:Number, _arg_8:Boolean):Boolean;

        public function getAsset(k:String):IGraphicAsset;

        public function getAssetWithPalette(k:String, _arg_2:String):IGraphicAsset;

        public function getPaletteNames():Array;

        public function getPaletteColors(k:String):Array;

        public function getPaletteXML(k:String):XML;

        private function getPalette(k:String):GraphicAssetPalette;

        public function addAsset(k:String, _arg_2:BitmapData, _arg_3:Boolean, _arg_4:int=0, _arg_5:int=0, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Boolean=true):Boolean;

        public function disposeAsset(k:String):void;

        private function getLibraryAsset(k:String):BitmapDataAsset;

        private function addLibraryAsset(k:String, _arg_2:BitmapData):BitmapDataAsset;

        private function disposePaletteAssets(k:Boolean=true):void;


    }
}//package com.sulake.room.object.visualization.utils

