//com.sulake.habbo.profile.avatar.slot.BadgesSlot

package com.sulake.habbo.profile.avatar.slot{
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import feathers.controls.LayoutGroup;
    import feathers.controls.Callout;
    import feathers.controls.ImageLoader;
    import com.sulake.core.utils.Map;
    import flash.display.BitmapData;
    import starling.textures.Texture;
    import starling.events.TouchEvent;
    import starling.events.Event;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;

    public class BadgesSlot {

        private static const MAX_BADGE_AMOUNT:int;

        private var _sessionDataManager:ISessionDataManager;
        private var _communication:IHabboCommunicationManager;
        private var _view:LayoutGroup;
        private var _badges:LayoutGroup;
        private var _callout:Callout;
        private var _lastCalloutBadgeId:String;
        private var _lastSelectedLoader:ImageLoader;
        private var _loaderMap:Map;
        private var _disposed:Boolean;
        private var _isOwnUser:Boolean;
        private var _badgeSelector:BadgeSelector;
        private var _badgeTextures:Map;

        public function BadgesSlot(k:ISessionDataManager, _arg_2:IHabboCommunicationManager);

        private function createView():void;

        public function dispose():void;

        public function saveBadges():void;

        public function updateOwnBadges(k:Map, _arg_2:Array, _arg_3:Array):void;

        public function get view():LayoutGroup;

        public function updateBadges(k:Array, _arg_2:Boolean):void;

        public function setBadge(k:String, _arg_2:ImageLoader, _arg_3:Boolean):void;

        private function createBadgeTexture(k:String, _arg_2:BitmapData):Texture;

        private function onBadgeTouch(k:TouchEvent):void;

        private function toggleCallout(k:String, _arg_2:ImageLoader, _arg_3:Boolean):void;

        private function onModifyBadgeButton(k:Event):void;

        private function onBadgeReady(k:BadgeImageReadyEvent):void;

        public function setLoaderId(k:ImageLoader, _arg_2:String):void;

        private function getBadgeId(k:ImageLoader):String;

        private function getLoader(k:String):ImageLoader;

        private function alphaTweenBadge(k:ImageLoader):void;

        private function get badgeSelector():BadgeSelector;


    }
}//package com.sulake.habbo.profile.avatar.slot

