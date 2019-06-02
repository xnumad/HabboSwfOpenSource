//com.sulake.habbo.session.RoomSession

package com.sulake.habbo.session{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomModerationSettings;

    public class RoomSession implements IRoomSession {

        private const CHAT_LAG_WARNING_LIMIT:int;
        private var _connection:IConnection;
        private var _roomId:int;
        private var _password:String;
        private var _roomResources:String;
        private var _openConnectionComposer:IMessageComposer;
        private var _state:String;
        private var _userDataManager:UserDataManager;
        private var _ownUserRoomId:int;
        private var _isRoomOwner:Boolean;
        private var _roomControllerLevel:int;
        private var _tradeMode:int;
        private var _isGuildRoom:Boolean;
        private var _isSpectatorMode:Boolean;
        private var _arePetsAllowed:Boolean;
        private var _doorMode:int;
        private var _messageLagTrackingMap:Map;
        private var _chatTrackingId:int;
        private var _habboTracking:IHabboTracking;
        private var _isUserDecorating:Boolean;
        private var _isWalkPriority:Boolean;
        private var _isGameSession:Boolean;
        private var _nuxNotComplete:Boolean;
        private var _roomModerationSettings:RoomModerationSettings;

        public function RoomSession();

        public function set connection(k:IConnection):void;

        public function dispose():void;

        public function get roomId():int;

        public function set roomId(k:int):void;

        public function get roomPassword():String;

        public function set roomPassword(k:String):void;

        public function get roomResources():String;

        public function set roomResources(k:String):void;

        public function get openConnectionComposer():IMessageComposer;

        public function set openConnectionComposer(k:IMessageComposer):void;

        public function get state():String;

        public function get habboTracking():IHabboTracking;

        public function set habboTracking(k:IHabboTracking):void;

        public function get isGameSession():Boolean;

        public function set isGameSession(k:Boolean):void;

        public function get roomModerationSettings():RoomModerationSettings;

        public function set roomModerationSettings(k:RoomModerationSettings):void;

        public function start():Boolean;

        public function reset(k:int):void;

        private function sendOpenFlatConnectionMessage():Boolean;

        private function sendPredefinedOpenConnection():Boolean;

        public function sendChatMessage(k:String, _arg_2:int=0):void;

        public function sendChangeMottoMessage(k:String):void;

        public function receivedChatWithTrackingId(k:int):void;

        public function sendShoutMessage(k:String, _arg_2:int=0):void;

        public function sendWhisperMessage(k:String, _arg_2:String, _arg_3:int=0):void;

        public function sendChatTypingMessage(k:Boolean):void;

        public function sendAvatarExpressionMessage(k:int):void;

        public function sendSignMessage(k:int):void;

        public function sendDanceMessage(k:int):void;

        public function sendChangePostureMessage(k:int):void;

        public function sendCreditFurniRedeemMessage(k:int):void;

        public function sendPresentOpenMessage(k:int):void;

        public function sendOpenPetPackageMessage(k:int, _arg_2:String):void;

        public function sendRoomDimmerGetPresetsMessage():void;

        public function sendRoomDimmerSavePresetMessage(k:int, _arg_2:int, _arg_3:uint, _arg_4:int, _arg_5:Boolean):void;

        public function sendRoomDimmerChangeStateMessage():void;

        public function sendConversionPoint(k:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:int=0):void;

        public function sendPollStartMessage(k:int):void;

        public function sendPollRejectMessage(k:int):void;

        public function sendPollAnswerMessage(k:int, _arg_2:int, _arg_3:Array):void;

        public function sendPeerUsersClassificationMessage(k:String):void;

        public function sendRoomUsersClassificationMessage(k:String):void;

        public function kickUser(k:int):void;

        public function banUserWithDuration(k:int, _arg_2:String):void;

        public function muteUser(k:int, _arg_2:int):void;

        public function assignRights(k:int):void;

        public function removeRights(k:int):void;

        public function letUserIn(k:String, _arg_2:Boolean):void;

        public function pickUpPet(k:int):void;

        public function mountPet(k:int):void;

        public function togglePetRidingPermission(k:int):void;

        public function togglePetBreedingPermission(k:int):void;

        public function dismountPet(k:int):void;

        public function removeSaddleFromPet(k:int):void;

        public function harvestPet(k:int):void;

        public function compostPlant(k:int):void;

        public function requestPetCommands(k:int):void;

        public function useProductForPet(k:int, _arg_2:int):void;

        public function plantSeed(k:int):void;

        public function quit():void;

        public function changeQueue(k:int):void;

        public function sendUpdateClothingChangeFurniture(k:int, _arg_2:String, _arg_3:String):void;

        public function get userDataManager():IUserDataManager;

        public function get ownUserRoomId():int;

        public function set ownUserRoomId(k:int):void;

        public function set isRoomOwner(k:Boolean):void;

        public function get isRoomController():Boolean;

        public function get isRoomOwner():Boolean;

        public function set roomControllerLevel(k:int):void;

        public function get roomControllerLevel():int;

        public function get tradeMode():int;

        public function get isPrivateRoom():Boolean;

        public function set tradeMode(k:int):void;

        public function get isGuildRoom():Boolean;

        public function set isGuildRoom(k:Boolean):void;

        public function get isNoobRoom():Boolean;

        public function set doorMode(k:int):void;

        public function get isSpectatorMode():Boolean;

        public function set isSpectatorMode(k:Boolean):void;

        public function get arePetsAllowed():Boolean;

        public function set arePetsAllowed(k:Boolean):void;

        public function get areBotsAllowed():Boolean;

        public function get isUserDecorating():Boolean;

        public function set isUserDecorating(k:Boolean):void;

        public function get isNuxNotComplete():Boolean;

        public function set isNuxNotComplete(k:Boolean):void;

        public function get isWalkPriority():Boolean;

        public function set isWalkPriority(k:Boolean):void;

        public function canBan():Boolean;

        public function canKick():Boolean;

        public function canMute():Boolean;

        private function hasModRights(k:int):Boolean;


    }
}//package com.sulake.habbo.session

