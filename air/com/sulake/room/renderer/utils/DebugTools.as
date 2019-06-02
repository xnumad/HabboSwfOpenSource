//com.sulake.room.renderer.utils.DebugTools

package com.sulake.room.renderer.utils{
    import starling.display.Sprite;
    import starling.display.Image;
    import com.sulake.room.renderer.RoomSpriteCanvas3d;
    import starling.textures.Texture;
    import starling.events.TouchEvent;

    public class DebugTools extends Sprite {

        private var _toggleBtnsCanvas:Sprite;
        private var _toggleButtons:Array;
        private var _avatarAtlasDebug:Image;
        private var _roomSpriteCanvas:RoomSpriteCanvas3d;
        private var _visibilityBtn:Image;
        private var _btnTex:Texture;
        private var _disposed:Boolean;
        private var _scale:Number;

        public function DebugTools(k:RoomSpriteCanvas3d);

        override public function dispose():void;

        private function onVisibilityBtn(k:TouchEvent):void;

        private function onToggleBtn(k:TouchEvent):void;

        private function toggleRoomBottom():void;

        private function sortRoomBottom():void;

        private function createVisibilityToggleBtn(k:Texture):void;

        private function createAtlasDebug():void;

        private function createDebugButtons(k:Texture):void;


    }
}//package com.sulake.room.renderer.utils

