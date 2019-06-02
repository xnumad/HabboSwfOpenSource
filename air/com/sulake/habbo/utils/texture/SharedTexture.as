//com.sulake.habbo.utils.texture.SharedTexture

package com.sulake.habbo.utils.texture{
    import starling.events.EventDispatcher;
    import starling.textures.RenderTexture;
    import starling.display.Image;
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;
    import org.villekoskela.utils.RectanglePacker;
    import flash.display.BitmapData;
    import starling.textures.Texture;

    public class SharedTexture extends EventDispatcher {

        public static const EMPTY_TEXTURE:String;
        public static const TEXTURE_COMPRESSED_EVENT:String;
        public static const TEXTURE_ALMOST_FULL_EVENT:String;
        private static const DIRTYNESS_LIMIT:int;
        private static var sharedInstance:SharedTexture;

        private var _maxDimension:int;
        private var _atlas:RenderTexture;
        private var _buffer:RenderTexture;
        private var _bufferImage:Image;
        private var _textureCache:Dictionary;
        private var _ids:Dictionary;
        private var _rectangles:Map;
        private var _packer:RectanglePacker;
        private var _atlasX:int;
        private var _atlasY:int;
        private var _freeX:int;
        private var _freeY:int;
        private var _id:int;
        private var _emptyTextureId:int;
        private var _dirtyness:int;

        public function SharedTexture(k:int);

        public static function get instance():SharedTexture;


        _namespace_2 function get atlas():RenderTexture;

        public function reset():void;

        public function hasTexture(k:String):Boolean;

        public function injectSubTexture(k:String, _arg_2:BitmapData):Texture;

        public function forgetSubTextures(k:Array):void;

        public function forgetSubTexture(k:String):void;

        private function checkFitting(k:int, _arg_2:int):Boolean;

        private function addToAtlas(name:String, bmp:BitmapData):Texture{
        }
        public function getSubTexture(k:String):Texture;

        public function getEmpty():Texture;

        public function optimizeAtlas():void;

        private function drawTexturesToBuffer():void;


    }
}//package com.sulake.habbo.utils.texture

// _namespace_2 = "shared_texture_gpu_debug"


