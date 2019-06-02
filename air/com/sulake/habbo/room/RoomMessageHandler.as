//com.sulake.habbo.room.RoomMessageHandler

package com.sulake.habbo.room{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectMessageData;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemMessageData;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetExperienceEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.YouArePlayingGameMessageEvent;

    public class RoomMessageHandler {

        private var _connection:IConnection;
        private var _roomCreator:IRoomCreator;
        private var _planeParser:RoomPlaneParser;
        private var _ownUserId:int;
        private var _initialConnection:Boolean;
        private var _passiveObjectRunningId:int;
        private var _currentRoomId:int;
        private var _tempViralHolder:Object;
        private var _guideId:int;
        private var _requesterId:int;

        public function RoomMessageHandler(k:IRoomCreator);

        public function dispose():void;

        public function setCurrentRoom(k:int):void;

        public function resetCurrentRoom():void;

        private function getRoomId(k:int):int;

        public function set connection(k:IConnection):void;

        private function onOwnUserEvent(k:IMessageEvent):void;

        private function onRoomReady(k:IMessageEvent):void;

        private function onFurnitureAliases(k:IMessageEvent):void;

        private function onHeightMap(k:IMessageEvent):void;

        private function onHeightMapUpdate(k:IMessageEvent):void;

        private function onRoomVisualizationSettings(k:IMessageEvent):void;

        private function onRoomProperty(k:IMessageEvent):void;

        private function onFloorHeightMap(k:IMessageEvent):void;

        private function onObjects(k:IMessageEvent):void;

        private function onObjectAdd(k:IMessageEvent):void;

        private function onObjectUpdate(k:IMessageEvent):void;

        private function onObjectDataUpdate(k:IMessageEvent):void;

        private function onObjectsDataUpdate(k:IMessageEvent):void;

        private function onObjectRemove(event:IMessageEvent):void{
        }
        private function addActiveObject(k:int, _arg_2:ObjectMessageData):void;

        private function onItems(k:IMessageEvent):void;

        private function onItemAdd(k:IMessageEvent):void;

        private function onItemRemove(k:IMessageEvent):void;

        private function onItemUpdate(k:IMessageEvent):void;

        private function onItemDataUpdate(k:IMessageEvent):void;

        private function addWallItem(k:int, _arg_2:ItemMessageData):void;

        private function onUsers(k:IMessageEvent):void;

        private function onUserUpdate(k:IMessageEvent):void;

        private function onUserRemove(k:IMessageEvent):void;

        private function onUserChange(k:IMessageEvent):void;

        private function onPetFigureUpdate(k:IMessageEvent):void;

        private function onExpression(k:IMessageEvent):void;

        private function onDance(k:IMessageEvent):void;

        private function onAvatarEffect(k:IMessageEvent):void;

        private function onAvatarSleep(k:IMessageEvent):void;

        private function onCarryObject(k:IMessageEvent):void;

        private function onUseObject(k:IMessageEvent):void;

        private function onSlideUpdate(k:IMessageEvent):void;

        private function onChat(k:IMessageEvent):void;

        private function onTypingStatus(k:IMessageEvent):void;

        private function onPetExperience(k:PetExperienceEvent):void;

        private function onDiceValue(k:IMessageEvent):void;

        private function onOneWayDoorStatus(k:IMessageEvent):void;

        private function onPlayingGame(k:YouArePlayingGameMessageEvent):void;

        private function onGamePlayerNumberValue(k:IMessageEvent):void;

        private function onIgnoreResult(k:IMessageEvent):void;

        private function onGuideSessionStarted(k:IMessageEvent):void;

        private function onGuideSessionEnded(k:IMessageEvent):void;

        private function onGuideSessionError(k:IMessageEvent):void;

        private function updateGuideMarker():void;

        private function removeGuideMarker():void;

        private function setUserGuideStatus(k:int, _arg_2:int):void;


    }
}//package com.sulake.habbo.room

