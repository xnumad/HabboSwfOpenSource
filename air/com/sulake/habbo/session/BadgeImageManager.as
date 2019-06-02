//com.sulake.habbo.session.BadgeImageManager

package com.sulake.habbo.session{
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.IEventDispatcher;
    import com.sulake.core.runtime.ICoreConfiguration;
    import flash.utils.Dictionary;
    import flash.display.BitmapData;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class BadgeImageManager {

        public static const TYPE_GROUP:String;
        public static const TYPE_NORMAL:String;

        private const ASSET_PREFIX:String;
        private const ASSET_SMALL_POSTFIX:String;
        private var _assets:IAssetLibrary;
        private var _events:IEventDispatcher;
        private var _configuration:ICoreConfiguration;
        private var _requestedGroupBadges:Dictionary;

        public function BadgeImageManager(k:IAssetLibrary, _arg_2:IEventDispatcher, _arg_3:ICoreConfiguration);

        public function dispose():void;

        public function getBadgeImage(k:String, _arg_2:String="normal_badge", _arg_3:Boolean=true, _arg_4:Boolean=false):BitmapData;

        public function getSmallBadgeImage(k:String, _arg_2:String="normal_badge"):BitmapData;

        public function getBadgeImageWithInfo(k:String):BadgeInfo;

        public function getBadgeImageAssetName(k:String, _arg_2:String="normal_badge", _arg_3:Boolean=false):String;

        public function getSmallScaleBadgeAssetName(k:String, _arg_2:String="normal_badge"):String;

        private function getBadgeImageInternal(k:String, _arg_2:String="normal_badge", _arg_3:Boolean=false):BitmapData;

        private function getPlaceholder():BitmapData;

        private function onBadgeImageReady(k:AssetLoaderEvent):void;

        private function createSmallBadgeBitmap(k:String, _arg_2:String):void;

        private function renderSmallScaleBadgeBitmap(k:String):BitmapData;


    }
}//package com.sulake.habbo.session

