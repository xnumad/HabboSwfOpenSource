//com.sulake.habbo.tablet.catalog.club.ClubExtendController

package com.sulake.habbo.tablet.catalog.club{
    import com.sulake.habbo.tablet.catalog.HabboTabletCatalog;
    import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferExtendData;
    import com.sulake.habbo.communication.messages.incoming.catalog.HabboClubExtendOfferMessageEvent;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ICoreConfiguration;

    public class ClubExtendController {

        private var _catalog:HabboTabletCatalog;
        private var _offer:ClubOfferExtendData;
        private var _disposed:Boolean;

        public function ClubExtendController(k:HabboTabletCatalog);

        public function dispose():void;

        public function onOffer(k:HabboClubExtendOfferMessageEvent):void;

        public function closeConfirmation():void;

        public function showConfirmation():void;

        public function confirmSelection():void;

        public function get localization():IHabboLocalizationManager;

        public function get assets():IAssetLibrary;

        public function get config():ICoreConfiguration;


    }
}//package com.sulake.habbo.tablet.catalog.club

