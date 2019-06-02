//com.sulake.habbo.session.IRoomSession

package com.sulake.habbo.session{
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomModerationSettings;

    public /*dynamic*/ interface IRoomSession {

        function get roomId():int;
        function get roomResources():String;
        function get state():String;
        function start():Boolean;
        function sendChatMessage(k:String, _arg_2:int=0):void;
        function sendChangeMottoMessage(k:String):void;
        function sendShoutMessage(k:String, _arg_2:int=0):void;
        function sendWhisperMessage(k:String, _arg_2:String, _arg_3:int=0):void;
        function sendChatTypingMessage(k:Boolean):void;
        function sendAvatarExpressionMessage(k:int):void;
        function sendSignMessage(k:int):void;
        function sendDanceMessage(k:int):void;
        function sendChangePostureMessage(k:int):void;
        function sendCreditFurniRedeemMessage(k:int):void;
        function sendPresentOpenMessage(k:int):void;
        function sendOpenPetPackageMessage(k:int, _arg_2:String):void;
        function sendRoomDimmerGetPresetsMessage():void;
        function sendRoomDimmerSavePresetMessage(k:int, _arg_2:int, _arg_3:uint, _arg_4:int, _arg_5:Boolean):void;
        function sendRoomDimmerChangeStateMessage():void;
        function sendConversionPoint(k:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:int=0):void;
        function sendPollStartMessage(k:int):void;
        function sendPollRejectMessage(k:int):void;
        function sendPollAnswerMessage(k:int, _arg_2:int, _arg_3:Array):void;
        function sendPeerUsersClassificationMessage(k:String):void;
        function sendRoomUsersClassificationMessage(k:String):void;
        function kickUser(k:int):void;
        function banUserWithDuration(k:int, _arg_2:String):void;
        function muteUser(k:int, _arg_2:int):void;
        function assignRights(k:int):void;
        function removeRights(k:int):void;
        function letUserIn(k:String, _arg_2:Boolean):void;
        function pickUpPet(k:int):void;
        function mountPet(k:int):void;
        function togglePetRidingPermission(k:int):void;
        function dismountPet(k:int):void;
        function removeSaddleFromPet(k:int):void;
        function requestPetCommands(k:int):void;
        function useProductForPet(k:int, _arg_2:int):void;
        function plantSeed(k:int):void;
        function quit():void;
        function changeQueue(k:int):void;
        function sendUpdateClothingChangeFurniture(k:int, _arg_2:String, _arg_3:String):void;
        function receivedChatWithTrackingId(k:int):void;
        function get ownUserRoomId():int;
        function set ownUserRoomId(k:int):void;
        function get isRoomOwner():Boolean;
        function set isRoomOwner(k:Boolean):void;
        function get isRoomController():Boolean;
        function set roomControllerLevel(k:int):void;
        function get roomControllerLevel():int;
        function get isGuildRoom():Boolean;
        function set isGuildRoom(k:Boolean):void;
        function get isNoobRoom():Boolean;
        function set doorMode(k:int):void;
        function get tradeMode():int;
        function get isPrivateRoom():Boolean;
        function set tradeMode(k:int):void;
        function get userDataManager():IUserDataManager;
        function get isSpectatorMode():Boolean;
        function set isSpectatorMode(k:Boolean):void;
        function get arePetsAllowed():Boolean;
        function set arePetsAllowed(k:Boolean):void;
        function get areBotsAllowed():Boolean;
        function get isUserDecorating():Boolean;
        function set isUserDecorating(k:Boolean):void;
        function get isGameSession():Boolean;
        function get roomModerationSettings():RoomModerationSettings;
        function set roomModerationSettings(k:RoomModerationSettings):void;
        function get isNuxNotComplete():Boolean;
        function set isNuxNotComplete(k:Boolean):void;
        function harvestPet(k:int):void;
        function togglePetBreedingPermission(k:int):void;
        function compostPlant(k:int):void;
        function set isWalkPriority(k:Boolean):void;
        function get isWalkPriority():Boolean;
        function canBan():Boolean;
        function canKick():Boolean;
        function canMute():Boolean;

    }
}//package com.sulake.habbo.session

