//com.sulake.habbo.communication.PocketRequest

package com.sulake.habbo.communication{
    import flash.net.URLRequest;
    import flash.events.IEventDispatcher;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;

    public class PocketRequest {

        public static const AUTH_CONNECT:PocketRequest;
        public static const AUTH_CONNECT_FACEBOOK:PocketRequest;
        public static const AUTH_CONNECT_FORGOT_PASSWORD:PocketRequest;
        public static const AUTH_VALIDATE:PocketRequest;
        public static const AUTH_DISCONNECT:PocketRequest;
        public static const AUTH_DEVICE_TOKEN:PocketRequest;
        public static const USER_AVATARS:PocketRequest;
        public static const USER_AVATARS_SELECT:PocketRequest;
        public static const USER_FRIENDS:PocketRequest;
        public static const USER_FRIENDREQUEST_ACCEPT:PocketRequest;
        public static const USER_FRIENDREQUEST_DECLINE:PocketRequest;
        public static const USER_FRIENDREQUEST_MAKE:PocketRequest;
        public static const USER_FRIENDREQUEST_PENDING_RECEIVED:PocketRequest;
        public static const USER_FRIENDREQUEST_PENDING_SENT:PocketRequest;
        public static const USER_SETTINGS_RETRIEVE:PocketRequest;
        public static const USER_SETTINGS_STORE:PocketRequest;
        public static const USER_PROFILE:PocketRequest;
        public static const USER_FIND:PocketRequest;
        public static const MESSENGER_SEND:PocketRequest;
        public static const MESSENGER_DISCUSSION:PocketRequest;
        public static const MESSENGER_DISCUSSIONS_LATEST:PocketRequest;
        public static const MESSENGER:PocketRequest;
        public static const REGISTER_NEW:PocketRequest;
        public static const REGISTER_PARENTEMAIL:PocketRequest;
        public static const AVATAR_NEW:PocketRequest;
        public static const AVATAR_NAME_CHECK:PocketRequest;
        public static const AVATAR_NAME_CHANGE:PocketRequest;
        public static const AVATAR_NAME_ALLOWED:PocketRequest;
        public static const AVATAR_PROMOHABBOS:PocketRequest;
        public static const AVATAR_MOTTO:PocketRequest;
        public static const AVATAR_MOTTO_CHANGE:PocketRequest;
        public static const REGISTER_TOS_URL:PocketRequest;
        public static const STICKER_SETS:PocketRequest;
        public static const STICKER_STICKERS:PocketRequest;
        public static const STICKER_STICKERS_ALL:PocketRequest;
        public static const STICKER_PURCHASE:PocketRequest;
        public static const IAP_VALIDATE_ITUNES_RECEIPT:PocketRequest;
        public static const INFO:PocketRequest;
        public static var _enumCreated:Boolean;

        private var _methodName:String;
        private var _requestType:String;
        private var _listener:IPocketHabboListener;

        public function PocketRequest(k:String, _arg_2:String);

        public function get methodName():String;

        public function get requestType():String;

        public function makeRequest(k:IPocketHabboListener, _arg_2:URLRequest):void;

        private function configureListeners(k:IEventDispatcher):void;

        private function removeListeners(k:IEventDispatcher):void;

        private function completeHandler(k:Event):void;

        private function openHandler(k:Event):void;

        private function progressHandler(k:ProgressEvent):void;

        private function securityErrorHandler(k:SecurityErrorEvent):void;

        private function httpStatusHandler(k:HTTPStatusEvent):void;

        private function ioErrorHandler(k:IOErrorEvent):void;


    }
}//package com.sulake.habbo.communication

