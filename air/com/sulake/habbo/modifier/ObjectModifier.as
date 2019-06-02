//com.sulake.habbo.modifier.ObjectModifier

package com.sulake.habbo.modifier{
    import feathers.controls.LayoutGroup;
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.room.renderer.IRoomRenderingCanvas;
    import starling.display.Sprite;
    import com.sulake.room.object.IRoomObject;
    import feathers.controls.ScrollContainer;
    import starling.display.Image;
    import feathers.controls.Label;
    import feathers.controls.Button;
    import __AS3__.vec.Vector;
    import starling.textures.Texture;
    import flash.geom.Point;
    import starling.events.Event;
    import starling.events.TouchEvent;
    import starling.events.Touch;
    import starling.display.DisplayObjectContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.room.object.IRoomObjectModel;

    public class ObjectModifier extends LayoutGroup {

        private static const ORG_PANEL_WIDTH:int;
        private static const ORG_PANEL_HEIGHT:int;
        private static const ORG_BUTTON_DIMENSION:int;
        private static const ORG_MARGIN:int;
        private static var DRAG_AREA_WIDTH:int;
        private static var DRAG_AREA_HEIGHT:int;
        private static var BUTTON_DIMENSION:int;
        private static var MARGIN:int;

        private var _desktop:RoomDesktop;
        private var _roomEngine:IRoomEngine;
        private var _canvas:IRoomRenderingCanvas;
        private var _roomContainer:Sprite;
        private var _object:IRoomObject;
        private var _dragContainer:ScrollContainer;
        private var _icon:Image;
        private var _nameLabel:Label;
        private var _leftButtonContainer:LayoutGroup;
        private var _rightButtonContainer:LayoutGroup;
        private var _bottomButtonContainer:LayoutGroup;
        private var _pickUpButton:Button;
        private var _useButton:Button;
        private var _okButton:Button;
        private var _textures:Vector.<Texture>;
        private var _dragBeginLocalLoc:Point;
        private var _lastOpenedLocation:Point;
        private var _isInserting:Boolean;

        public function ObjectModifier(k:RoomDesktop, _arg_2:IRoomRenderingCanvas);

        override public function dispose():void;

        public function get object():IRoomObject;

        private function disposeTextures():void;

        public function hide():void;

        public function hideAnimated():void;

        private function onHideAnimComplete():void;

        public function setObject(k:IRoomObject, _arg_2:String):void;

        public function setFurniture(k:IRoomObject):void;

        private function setAvatar(k:IRoomObject):void;

        public function setWallItem(k:IRoomObject):void;

        private function updateToolbarExtension():void;

        private function hideToolbarExtension():void;

        private function onCancelButton(k:Event):void;

        private function onOkButton(k:Event):void;

        private function onRotateButton(k:Event):void;

        private function onPickUpButton(k:Event):void;

        private function onUseFurniButton(k:Event):void;

        private function isFurniUsableByAll():Boolean;

        private function isUserRoomController():Boolean;

        private function onDragContainerTouch(k:TouchEvent):void;

        private function startTouch(k:Touch):void;

        private function touchMoved(k:Touch):void;

        private function endTouch(k:Touch):void;

        public function moveToInsertLocation():void;

        private function moveViewToObjectLocation():void;

        private function triggerMouseEventToTargetPoint():void;

        private function updateIcon(k:Texture):void;

        private function updateButtons():void;

        private function createView():void;

        private function createButton(k:String, _arg_2:Function, _arg_3:DisplayObjectContainer, _arg_4:String=null):Button;

        private function updateNameLabel(k:String):void;

        private function getTexture(k:BitmapData):Texture;

        private function getFurniName(k:String, _arg_2:IFurnitureData):String;

        private function isFurniSelectable(k:IRoomObjectModel):Boolean;


    }
}//package com.sulake.habbo.modifier

