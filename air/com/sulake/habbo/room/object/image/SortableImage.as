//com.sulake.habbo.room.object.image.SortableImage

package com.sulake.habbo.room.object.image{
    import starling.display.Image;
    import com.sulake.room.object.image.ISortableImage;
    import starling.textures.Texture;
    import flash.display.BitmapData;

    public class SortableImage extends Image implements ISortableImage {

        private var _z:Number;
        private var _rawZ:Number;
        private var _blendModeOffsetZ:int;
        private var _currBlendmode:String;
        private var _currTexture:Texture;
        private var _spriteOffsetX:int;
        private var _spriteOffsetY:int;
        private var _objectInstanceId:int;
        private var _spriteId:int;
        private var _asset:BitmapData;
        private var _disposed:Boolean;
        private var _alphaTolerance:int;
        private var _width:Number;
        private var _height:Number;
        private var _updateId:uint;
        private var _allowVisible:Boolean;

        public function SortableImage(k:Texture);

        private static function blendModeOffsetZ(k:String):int;

        private static function mapBlendModeFromFlashToStarling(k:String):String;


        override public function dispose():void;

        public function get disposed():Boolean;

        private function checkSize():void;

        public function set flashBlendMode(k:String):void;

        override public function set blendMode(k:String):void;

        public function get z():Number;

        public function set z(k:Number):void;

        public function setAlphaFrom256(k:int):void;

        override public function set alpha(k:Number):void;

        private function updateZ():void;

        public function get objectInstanceId():int;

        public function set objectInstanceId(k:int):void;

        public function get spriteId():int;

        public function set spriteId(k:int):void;

        public function get spriteOffsetX():int;

        public function set spriteOffsetX(k:int):void;

        public function get spriteOffsetY():int;

        public function set spriteOffsetY(k:int):void;

        public function get asset():BitmapData;

        public function set asset(k:BitmapData):void;

        override public function set texture(k:Texture):void;

        public function get alphaTolerance():int;

        public function set alphaTolerance(k:int):void;

        override public function get width():Number;

        override public function get height():Number;

        override public function readjustSize():void;

        public function get updateId():int;

        public function set updateId(k:int):void;

        override public function set visible(k:Boolean):void;


    }
}//package com.sulake.habbo.room.object.image

