//com.sulake.room.renderer.RoomSpriteFactory

package com.sulake.room.renderer{
    import flash.utils.Dictionary;
    import starling.display.Sprite;
    import starling.display.QuadBatch;
    import com.sulake.habbo.room.ITileObjectMap;
    import com.sulake.habbo.room.IFurniStackingHeightMap;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
    import com.sulake.room.object.image.ISortableImage;
    import starling.events.Event;

    public class RoomSpriteFactory {

        private static const OBJECT_CATEGORY_FURNITURE:int;
        private static const OBJECT_CATEGORY_WALLITEM:int;
        private static const OBJECT_CATEGORY_USER:int;
        private static const FLOOR_TYPES:Array;

        private var _canvas3d:RoomSpriteCanvas3d;
        private var _roomTopImages:Dictionary;
        private var _roomBottomImages:Dictionary;
        private var _roomTop:Sprite;
        private var _roomBottom:QuadBatch;
        private var _objectMap:ITileObjectMap;
        private var _roomMap:IFurniStackingHeightMap;
        private var _bottomImageCreated:Boolean;
        private var _sessionDM:ISessionDataManager;

        public function RoomSpriteFactory(k:RoomSpriteCanvas3d);

        public function dispose():void;

        public function resetBottomImageCreationFlag():void;

        public function hasCreatedBottomImage():Boolean;

        public function createImage(k:IRoomObject, _arg_2:IRoomObjectSprite, _arg_3:IRoomObjectSpriteVisualization, _arg_4:int, _arg_5:int, _arg_6:Number, _arg_7:Number, _arg_8:Number, _arg_9:Boolean):ISortableImage;

        private function addToRoomBottom(k:ISortableImage, _arg_2:int):void;

        private function onRoomBottomImageDisposed(k:Event):void;

        private function hasSittableFurniOnTopOfStack(k:int, _arg_2:int):Boolean;

        private function isRoomEdgeBg(k:IRoomObject):Boolean;

        private function isKnownFloorType(k:String):Boolean;


    }
}//package com.sulake.room.renderer

