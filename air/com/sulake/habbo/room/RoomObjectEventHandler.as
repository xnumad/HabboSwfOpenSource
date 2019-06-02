//com.sulake.habbo.room.RoomObjectEventHandler

package com.sulake.habbo.room{
    import com.sulake.room.renderer.IRoomRenderingCanvasMouseListener;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.room.utils.SelectedRoomObjectData;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
    import com.sulake.habbo.room.messages.RoomObjectTileCursorUpdateMessage;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
    import com.sulake.habbo.room.events.RoomObjectPlaySoundIdEvent;
    import com.sulake.habbo.room.events.RoomObjectSamplePlaybackEvent;
    import com.sulake.habbo.room.events.RoomObjectHSLColorEnableEvent;
    import com.sulake.habbo.room.utils.FurniStackingHeightMap;
    import com.sulake.habbo.room.utils.LegacyWallGeometry;

    public class RoomObjectEventHandler implements IRoomRenderingCanvasMouseListener, IRoomObjectMouseClickHandler {

        private static const MODIFIED_OBJECT_ALPHA:Number;
        private static const UNMODIFIED_OBJECT_ALPHA:Number;

        private var _roomEngine:IRoomEngineServices;
        private var _eventIds:Map;
        private var _selectedAvatarId:int;
        private var _selectedObjectId:int;
        private var _selectedObjectCategory:int;
        private var _isInsertingObject:Boolean;
        private var _whereYouClickIsWhereYouGo:Boolean;
        private var _objectPlacementSource:String;

        public function RoomObjectEventHandler(k:IRoomEngineServices);

        protected function get roomEngine():IRoomEngineServices;

        public function dispose():void;

        public function initializeRoomObjectInsert(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:String=null, _arg_7:IStuffData=null, _arg_8:int=-1, _arg_9:int=-1, k0:String=null):Boolean;

        public function cancelRoomObjectInsert(k:int):Boolean;

        public function isInsertingObject():Boolean;

        private function getSelectedObjectData(k:int):SelectedRoomObjectData;

        private function setSelectedObjectData(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:String, _arg_7:int=0, _arg_8:String=null, _arg_9:IStuffData=null, k0:int=-1, k1:int=-1, k2:String=null):void;

        private function updateSelectedObjectData(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:String, _arg_7:int=0, _arg_8:String=null, _arg_9:IStuffData=null, k0:int=-1, k1:int=-1, k2:String=null):void;

        private function resetSelectedObjectData(k:int):void;

        public function setSelectedObject(k:int, _arg_2:int, _arg_3:int):void;

        private function deselectObject(k:int):void;

        public function processRoomCanvasMouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomObject, _arg_3:IRoomGeometry):void;

        public function handleRoomObjectEvent(k:RoomObjectEvent, _arg_2:int):Boolean;

        private function setMouseEventId(k:int, _arg_2:String, _arg_3:String):void;

        private function getMouseEventId(k:int, _arg_2:String):String;

        private function handleRoomObjectMouseEvent(k:RoomObjectMouseEvent, _arg_2:int):Boolean;

        public function handleRoomObjectMouseClick(k:RoomObjectMouseEvent, _arg_2:int):Boolean;

        private function handleRoomObjectMouseMove(k:RoomObjectMouseEvent, _arg_2:int):void;

        private function handleMouseOverTile(k:RoomObjectTileMouseEvent, _arg_2:int):RoomObjectTileCursorUpdateMessage;

        private function handleMouseOverObject(k:int, _arg_2:int, _arg_3:RoomObjectMouseEvent):RoomObjectTileCursorUpdateMessage;

        private function handleRoomObjectMouseEnter(k:RoomObjectMouseEvent, _arg_2:int):void;

        private function handleRoomObjectMouseLeave(k:RoomObjectMouseEvent, _arg_2:int):void;

        private function handleRoomObjectMouseDown(k:RoomObjectMouseEvent, _arg_2:int):void;

        private function decorateModeMove(k:RoomObjectMouseEvent):Boolean;

        private function handleObjectMove(k:RoomObjectMouseEvent, _arg_2:int):void;

        private function handleObjectPlace(k:RoomObjectMouseEvent, _arg_2:int):void;

        public function placeTemporaryObjectToRoom(k:int, _arg_2:SelectedRoomObjectData):IRoomObjectController;

        private function handleMoveTargetFurni(k:int, _arg_2:RoomObjectEvent):Boolean;

        private function getActiveSurfaceLocation(k:IRoomObject, _arg_2:RoomObjectMouseEvent):Vector3d;

        protected function handleObjectStateChange(k:RoomObjectStateChangeEvent, _arg_2:int):void;

        private function handleObjectRandomStateChange(k:RoomObjectStateChangeEvent, _arg_2:int):void;

        private function handleObjectWidgetRequestEvent(k:RoomObjectEvent, _arg_2:int):void;

        private function handleObjectRoomAdEvent(k:RoomObjectEvent, _arg_2:int):void;

        private function handleObjectActionEvent(k:RoomObjectEvent, _arg_2:int):void;

        private function handleObjectSoundMachineEvent(k:RoomObjectEvent, _arg_2:int):void;

        private function handleObjectJukeboxEvent(k:RoomObjectEvent, _arg_2:int):void;

        private function handleObjectGroupBadgeEvent(k:RoomObjectEvent, _arg_2:int):void;

        private function handleObjectFloorHoleEvent(k:RoomObjectEvent, _arg_2:int):void;

        private function handleRoomActionMouseRequestEvent(k:RoomObjectEvent, _arg_2:int):void;

        private function handleObjectDimmerStateEvent(k:RoomObjectEvent, _arg_2:int):void;

        private function handleRoomObjectPlaySoundEvent(k:RoomObjectPlaySoundIdEvent, _arg_2:int):void;

        private function handleRoomObjectSamplePlaybackEvent(k:RoomObjectSamplePlaybackEvent, _arg_2:int):void;

        private function handleRoomObjectHSLColorEnableEvent(k:RoomObjectHSLColorEnableEvent, _arg_2:int):void;

        private function handleRoomObjectDataRequestEvent(k:RoomObjectEvent, _arg_2:int):void;

        private function handleSelectedObjectMove(k:RoomObjectEvent, _arg_2:int):void;

        private function handleSelectedObjectRemove(k:RoomObjectEvent, _arg_2:int):void;

        private function handleFurnitureMove(k:IRoomObjectController, _arg_2:SelectedRoomObjectData, _arg_3:int, _arg_4:int, _arg_5:FurniStackingHeightMap):Boolean;

        private function handleWallItemMove(k:IRoomObjectController, _arg_2:SelectedRoomObjectData, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:Number, _arg_7:Number, _arg_8:Number):Boolean;

        private function handleUserPlace(k:IRoomObjectController, _arg_2:int, _arg_3:int, _arg_4:LegacyWallGeometry):Boolean;

        private function setObjectAlphaMultiplier(k:IRoomObjectController, _arg_2:Number):void;

        public function setSelectedAvatar(k:int, _arg_2:int, _arg_3:Boolean):void;

        public function getSelectedAvatarId():int;

        private function getValidRoomObjectDirection(k:IRoomObjectController, _arg_2:Boolean):int;

        public function modifyRoomObjectData(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Map):Boolean;

        public function modifyRoomObject(k:int, _arg_2:int, _arg_3:int, _arg_4:String):Boolean;

        private function placeObjectOnUser(k:int, _arg_2:int, _arg_3:int):void;

        public function placeObject(k:int):void;

        private function changeObjectState(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:Boolean):void;

        private function changeRoomObjectState(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean):Boolean;

        private function useObject(k:int, _arg_2:int, _arg_3:String, _arg_4:String):void;

        public function modifyWallItemData(k:int, _arg_2:int, _arg_3:String, _arg_4:String):Boolean;

        public function deleteWallItem(k:int, _arg_2:int):Boolean;

        private function handleClickOnTile(k:int, _arg_2:RoomObjectTileMouseEvent):void;

        private function walkTo(k:int, _arg_2:int):void;

        private function handleClickOnAvatar(k:int, _arg_2:RoomObjectMouseEvent):void;

        private function handleMouseEnterAvatar(k:int, _arg_2:RoomObjectMouseEvent, _arg_3:int):void;


    }
}//package com.sulake.habbo.room

