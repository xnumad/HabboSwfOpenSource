//com.sulake.habbo.chat.discussion.viewer.visualization.style.ChatStyle

package com.sulake.habbo.chat.discussion.viewer.visualization.style{
    import feathers.textures.Scale3Textures;
    import flash.geom.Rectangle;
    import starling.textures.Texture;
    import flash.text.TextFormat;
    import flash.geom.Point;
    import flash.display.BitmapData;

    public class ChatStyle {

        private var _id:String;
        private var _height:int;
        private var _background:Scale3Textures;
        private var _bgScale9Grid:Rectangle;
        private var _pointer:Texture;
        private var _pointerY:int;
        private var _textFieldMargins:Rectangle;
        private var _textFormat:TextFormat;
        private var _faceOffset:Point;
        private var _selectorPreview:Texture;
        private var _color:BitmapData;
        private var _colorOffset:Point;
        private var _overlap:Rectangle;
        private var _isSystemStyle:Boolean;
        private var _isHcOnly:Boolean;
        private var _isStaffOverrideable:Boolean;
        private var _bgBD:BitmapData;
        private var _pointerBD:BitmapData;
        private var _selectorBD:BitmapData;

        public function ChatStyle(k:String, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:BitmapData, _arg_5:int, _arg_6:Rectangle, _arg_7:TextFormat, _arg_8:Point, _arg_9:BitmapData, k0:Boolean, k1:Boolean, k2:Boolean, k3:BitmapData=null, k4:Point=null, k5:Rectangle=null);

        public function get id():String;

        public function get height():int;

        public function get textFormat():TextFormat;

        public function get pointerY():int;

        public function get background():Scale3Textures;

        public function get selectorPreview():Texture;

        public function get pointer():Texture;

        public function get pointerOffsetToBubbleBottom():int;

        public function get faceOffset():Point;

        public function get textFieldMargins():Rectangle;

        public function get overlap():Rectangle;

        public function get isSystemStyle():Boolean;

        public function get isHcOnly():Boolean;

        public function get isStaffOverrideable():Boolean;

        public function updateTextures():void;

        private function updateBgTex(k:BitmapData=null):void;

        private function updatePointerTex(k:BitmapData=null):void;

        private function updateSelectorTex(k:BitmapData=null):void;

        private function getTexture(k:String, _arg_2:BitmapData=null):Texture;


    }
}//package com.sulake.habbo.chat.discussion.viewer.visualization.style

