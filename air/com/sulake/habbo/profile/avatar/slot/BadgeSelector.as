//com.sulake.habbo.profile.avatar.slot.BadgeSelector

package com.sulake.habbo.profile.avatar.slot{
    import com.sulake.habbo.session.ISessionDataManager;
    import feathers.controls.List;
    import com.sulake.core.utils.Map;
    import feathers.controls.ImageLoader;
    import feathers.controls.Callout;
    import starling.events.Event;
    import flash.display.BitmapData;
    import starling.textures.Texture;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;

    public class BadgeSelector {

        private static const REMOVE_BADGE_ID:String;

        private var _badgesSlot:BadgesSlot;
        private var _sessionDataManager:ISessionDataManager;
        private var _list:List;
        private var _badgeTextures:Array;
        private var _requireSaving:Boolean;
        private var _disposed:Boolean;
        private var _badgeIds:Map;
        private var _badgeCodes:Array;
        private var _activeBadgeCodes:Array;
        private var _targetLoader:ImageLoader;
        private var _targetIndex:int;

        public function BadgeSelector(k:BadgesSlot, _arg_2:ISessionDataManager);

        public function dispose():void;

        public function updateOwnBadges(k:Map, _arg_2:Array, _arg_3:Array):void;

        public function updateActiveBadgeCodes(k:Array):void;

        public function getActiveBadgeCodes():Array;

        public function showForLoader(k:ImageLoader, _arg_2:int):void;

        private function calloutFactory():Callout;

        private function onCalloutClosed(k:Event):void;

        public function disposeBadgeTextures():void;

        private function createBadgeTexture(k:BitmapData):Texture;

        private function onBadgeReady(k:BadgeImageReadyEvent):void;

        private function onListChanged(k:Event):void;


    }
}//package com.sulake.habbo.profile.avatar.slot

