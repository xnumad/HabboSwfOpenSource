//com.sulake.habbo.selector.ObjectSelector

package com.sulake.habbo.selector{
    import starling.display.Sprite;
    import feathers.controls.List;
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import __AS3__.vec.Vector;
    import starling.textures.Texture;
    import com.sulake.room.object.IRoomObject;
    import flash.geom.Point;
    import flash.display.BitmapData;
    import starling.events.Event;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.room.object.IRoomObjectModel;
    import feathers.data.ListCollection;

    public class ObjectSelector extends Sprite {

        private static const ORG_ICON_WIDTH:int;
        private static const ORG_ICON_HEIGHT:int;
        private static const ORG_LIST_WIDTH:int;
        private static const ORG_MARGIN:int;
        private static var MAX_ICON_WIDTH:int;
        private static var MAX_ICON_HEIGHT:int;
        private static var MAX_LIST_WIDTH:int;
        private static var MARGIN:int;

        private var _list:List;
        private var _desktop:RoomDesktop;
        private var _roomEngine:IRoomEngine;
        private var _avatarsRenderer:IAvatarRenderManager;
        private var _textures:Vector.<Texture>;

        public function ObjectSelector(k:RoomDesktop, _arg_2:IRoomEngine, _arg_3:IAvatarRenderManager);

        override public function dispose():void;

        private function disposeTextures():void;

        public function hide():void;

        public function showObjects(k:Vector.<IRoomObject>, _arg_2:Point):void;

        private function getAvatarImage(k:IRoomObject):BitmapData;

        private function getPetImage(k:IRoomObject):BitmapData;

        private function onItemTouch(k:Event):void;

        private function activateObject(k:IRoomObject):void;

        private function activateFurni(k:IRoomObject):void;

        public function activateUser(k:IRoomObject):void;

        private function useObject(k:IRoomObject):void;

        private function showObjectModifier(k:IRoomObject):void;

        private function getFurniTexture(k:ImageResult):Texture;

        private function getFittedTexture(k:BitmapData):Texture;

        private function scaleBitmapData(k:BitmapData, _arg_2:Number):BitmapData;

        private function getFurniName(k:String, _arg_2:IFurnitureData):String;

        private function isFurniSelectable(k:IRoomObjectModel):Boolean;

        private function isUserRoomController():Boolean;

        private function isFurniUsableByAll(k:IRoomObject):Boolean;

        private function populateList(k:ListCollection):void;

        private function animateViewFrom(k:Point):void;


    }
}//package com.sulake.habbo.selector

