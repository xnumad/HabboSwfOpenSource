//com.sulake.habbo.communication.PocketHabboSession

package com.sulake.habbo.communication{
    import __AS3__.vec.Vector;
    import flash.net.URLRequest;
    import flash.net.URLVariables;

    public class PocketHabboSession implements IPocketHabboSession, IPocketHabboListener {

        private static var SALT:String;
        private static const API_SIGNATURE:String;
        private static const API_VERSION:int;
        private static const APPLICATION_ID:String;
        private static const APPLICATION_SECRET:String;
        private static const APPLICATION_NAME:String;
        private static const APPLICATION_VERSION:String;
        private static const DEVICE_TYPE:String;

        private var _isDisposed:Boolean;
        private var _server:String;
        private var _listeners:Vector.<IPocketHabboListener>;
        private var _authenticationToken:String;
        private var _authenticated:Boolean;
        private var _deviceId:String;
        private var _messageMaxLength:int;
        private var _imageServerUrl:String;
        private var _registrationEnabled:Boolean;
        private var _serverVersion:String;

        public function PocketHabboSession(k:String);

        public function resetSession():void;

        private function generateDeviceId(k:String):String;

        public function dispose():void;

        public function pocketHabboRawResponse(k:String, _arg_2:Object):void;

        public function pocketHabboResponse(k:String, _arg_2:Object):void;

        public function pocketHabboError(k:String, _arg_2:Object):void;

        public function addListener(k:IPocketHabboListener):Boolean;

        public function removeListener(k:IPocketHabboListener):void;

        public function get disposed():Boolean;

        private function getURI(k:String):String;

        private function getURL(k:String):String;

        private function addHeaders(k:URLRequest, _arg_2:String):void;

        private function calculateChecksum(k:String, _arg_2:URLVariables):String;

        private function executeRequest(k:PocketRequest, _arg_2:URLVariables):void;

        private function getParams(k:Array):String;

        public function getInfo():void;

        public function connect(k:String, _arg_2:String):void;

        public function connectWithFacebook(k:String):void;

        public function forgotPassword(k:String):void;

        public function validate():void;

        public function disconnect():void;

        public function setDeviceToken(k:String):void;

        public function getAvatars():void;

        public function selectAvatar(k:int):void;

        public function getFriends(k:int):void;

        public function accepFriendRequest(k:int):void;

        public function declineFriendRequest(k:int):void;

        public function makeFriendRequest(k:int):void;

        public function getPendingFriendRequests():void;

        public function getSentFriendRequests():void;

        public function getSettings():void;

        public function saveSettings(k:Boolean, _arg_2:Boolean):void;

        public function getProfile(k:int):void;

        public function findUser(k:String):void;

        public function sendMessage(k:int, _arg_2:String):void;

        public function getMessengerDiscussion(k:int):void;

        public function getMessengerDiscussions():void;

        public function getMessenger():void;

        public function register(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String, _arg_6:Boolean, _arg_7:String=""):void;

        public function isParentEmailRequired(k:int, _arg_2:int, _arg_3:int):void;

        public function registerAvatar(k:String, _arg_2:String, _arg_3:String):void;

        public function checkName(k:String):void;

        public function changeName(k:String):void;

        public function isNameChangeAllowed():void;

        public function getPromoHabbos(k:String):void;

        public function getMotto():void;

        public function setMotto(k:String):void;

        public function getTOSURL():void;

        public function getStickerSets():void;

        public function getStickers(k:String):void;

        public function getStickersAll():void;

        public function purchaseSticker(k:String):void;

        public function validateItunesIAP(k:String, _arg_2:String, _arg_3:int, _arg_4:String):void;


    }
}//package com.sulake.habbo.communication

