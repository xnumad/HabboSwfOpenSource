//com.sulake.habbo.tablet.catalog.VideoOfferManager

package com.sulake.habbo.tablet.catalog{
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.tablet.catalog.enum.VideoOfferTypeEnum;

    public class VideoOfferManager implements IVideoOfferManager, IDisposable {

        private static const CAMPAIGN_READY_CALLBACK:String;
        private static const CAMPAIGN_COMPLETE_CALLBACK:String;
        private static const CAMPAIGN_OPEN_CALLBACK:String;
        private static const CAMPAIGN_CLOSE_CALLBACK:String;
        private static const OFFERS_LOAD_FUNCTION:String;
        private static const OFFERS_LAUNCH_FUNCTION:String;

        private var _disposed:Boolean;
        private var _catalog:HabboTabletCatalog;
        private var _enabled:Boolean;
        private var _offersAvailable:int;
        private var _offersViewed:int;
        private var _offersRequested:Boolean;
        private var _offersReceived:Boolean;
        private var _launchers:Vector.<IVideoOfferLauncher>;
        private var _callbacksAdded:Boolean;

        public function VideoOfferManager(k:HabboTabletCatalog);

        public function get disposed():Boolean;

        public function get enabled():Boolean;

        public function dispose():void;

        private function addCallbacks():void;

        private function onUserRights(k:UserRightsMessageEvent):void;

        public function load(k:IVideoOfferLauncher):void;

        public function launch(k:VideoOfferTypeEnum):Boolean;

        private function onCampaignsReady(k:String):void;

        private function onCampaignOpen():void;

        private function onCampaignClose():void;

        private function onCampaignComplete():void;

        private function turnVolumeDown():void;

        private function turnVolumeUp():void;


    }
}//package com.sulake.habbo.tablet.catalog

