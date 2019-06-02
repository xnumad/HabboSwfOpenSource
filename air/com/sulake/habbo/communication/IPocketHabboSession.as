//com.sulake.habbo.communication.IPocketHabboSession

package com.sulake.habbo.communication{
    import com.sulake.core.runtime.IDisposable;

    public /*dynamic*/ interface IPocketHabboSession extends IDisposable {

        function addListener(k:IPocketHabboListener):Boolean;
        function removeListener(k:IPocketHabboListener):void;
        function resetSession():void;
        function getInfo():void;
        function connect(k:String, _arg_2:String):void;
        function connectWithFacebook(k:String):void;
        function forgotPassword(k:String):void;
        function validate():void;
        function disconnect():void;
        function setDeviceToken(k:String):void;
        function getAvatars():void;
        function selectAvatar(k:int):void;
        function getFriends(k:int):void;
        function accepFriendRequest(k:int):void;
        function declineFriendRequest(k:int):void;
        function makeFriendRequest(k:int):void;
        function getPendingFriendRequests():void;
        function getSentFriendRequests():void;
        function getSettings():void;
        function saveSettings(k:Boolean, _arg_2:Boolean):void;
        function getProfile(k:int):void;
        function findUser(k:String):void;
        function sendMessage(k:int, _arg_2:String):void;
        function getMessengerDiscussion(k:int):void;
        function getMessengerDiscussions():void;
        function getMessenger():void;
        function register(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String, _arg_6:Boolean, _arg_7:String=""):void;
        function isParentEmailRequired(k:int, _arg_2:int, _arg_3:int):void;
        function registerAvatar(k:String, _arg_2:String, _arg_3:String):void;
        function checkName(k:String):void;
        function changeName(k:String):void;
        function isNameChangeAllowed():void;
        function getPromoHabbos(k:String):void;
        function getMotto():void;
        function setMotto(k:String):void;
        function getTOSURL():void;
        function getStickerSets():void;
        function getStickers(k:String):void;
        function getStickersAll():void;
        function purchaseSticker(k:String):void;
        function validateItunesIAP(k:String, _arg_2:String, _arg_3:int, _arg_4:String):void;

    }
}//package com.sulake.habbo.communication

