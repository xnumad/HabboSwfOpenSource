//com.sulake.habbo.tablet.catalog.club.ClubGiftController

package com.sulake.habbo.tablet.catalog.club{
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.tablet.catalog.HabboTabletCatalog;
    import com.sulake.habbo.tablet.catalog.IPurchasableOffer;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.tablet.catalog.purse.IPurse;

    public class ClubGiftController {

        private var _daysUntilNextGift:int;
        private var _giftsAvailable:int;
        private var _offers:Array;
        private var _giftData:Map;
        private var _catalog:HabboTabletCatalog;

        public function ClubGiftController(k:HabboTabletCatalog);

        public function dispose():void;

        public function get daysUntilNextGift():int;

        public function get giftsAvailable():int;

        public function setInfo(k:int, _arg_2:int, _arg_3:Array, _arg_4:Map):void;

        public function selectGift(k:IPurchasableOffer):void;

        public function confirmSelection(k:String):void;

        public function closeConfirmation():void;

        public function getOffers():Array;

        public function getGiftData():Map;

        public function get hasClub():Boolean;

        public function get localization():IHabboLocalizationManager;

        public function get assets():IAssetLibrary;

        public function get roomEngine():IRoomEngine;

        public function getProductData(k:String):IProductData;

        public function get purse():IPurse;

        public function get catalog():HabboTabletCatalog;


    }
}//package com.sulake.habbo.tablet.catalog.club

