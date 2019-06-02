//com.sulake.habbo.tablet.catalog.club.ClubBuyController

package com.sulake.habbo.tablet.catalog.club{
    import com.sulake.habbo.tablet.catalog.HabboTabletCatalog;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.messages.parser.catalog.HabboClubOffersMessageParser;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.tablet.catalog.purse.IPurse;

    public class ClubBuyController {

        private var _catalog:HabboTabletCatalog;
        private var _offers:Array;
        private var _connection:IConnection;
        private var _disposed:Boolean;

        public function ClubBuyController(k:HabboTabletCatalog, _arg_2:IConnection);

        public function dispose():void;

        public function get catalog():HabboTabletCatalog;

        public function reset():void;

        public function onOffers(k:HabboClubOffersMessageParser):void;

        private function getPromotedMonths(k:Boolean):Array;

        public function requestOffers(k:int):void;

        public function showConfirmation(k:ClubBuyOfferData, _arg_2:int):void;

        public function confirmSelection(k:ClubBuyOfferData, _arg_2:int):void;

        public function closeConfirmation():void;

        public function getClubType():int;

        public function get hasClub():Boolean;

        public function get localization():IHabboLocalizationManager;

        public function get assets():IAssetLibrary;

        public function get roomEngine():IRoomEngine;

        public function getProductData(k:String):IProductData;

        public function getPurse():IPurse;

        private function orderByPrecedence(k:ClubBuyOfferData, _arg_2:ClubBuyOfferData):Number;


    }
}//package com.sulake.habbo.tablet.catalog.club

