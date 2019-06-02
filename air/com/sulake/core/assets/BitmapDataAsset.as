//com.sulake.core.assets.BitmapDataAsset

package com.sulake.core.assets{
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.display.Loader;
    import flash.events.Event;

    public class BitmapDataAsset implements ILazyAsset {

        protected static var _instances:uint;
        protected static var _allocatedByteCount:uint;
        private static const CLONE_BITMAP_DATA:Boolean;
        private static const USE_ASYNC_LOADER:Boolean;
        private static const IMMEDIATE_PREPARE:Boolean;

        public var name:String;
        private var _disposed:Boolean;
        private var _rectangle:Rectangle;
        private var _unknown:Object;
        private var _bitmap:BitmapData;
        private var _offset:Point;
        private var _flipH:Boolean;
        private var _flipV:Boolean;
        private var _decl:AssetTypeDeclaration;
        private var _url:String;
        private var _loader:Loader;
        private var _swapId:int;
        private var _ownsData:Boolean;

        public function BitmapDataAsset(k:AssetTypeDeclaration, _arg_2:String=null);

        public static function get instances():uint;

        public static function get allocatedByteCount():uint;


        public function get url():String;

        public function get flipH():Boolean;

        public function get flipV():Boolean;

        public function get offset():Point;

        public function get content():Object;

        public function get disposed():Boolean;

        public function get rectangle():Rectangle;

        public function get declaration():AssetTypeDeclaration;

        public function dispose():void;

        public function setUnknownContent(k:Object):void;

        public function prepareLazyContent():void;

        private function onLoaderComplete(k:Event):void;

        public function setFromOtherAsset(k:IAsset):void;

        public function setParamsDesc(k:XMLList):void;

        public function compress():void;

        public function swapToDisk():void;

        public function set ownsData(k:Boolean):void;


    }
}//package com.sulake.core.assets

