//com.sulake.habbo.tablet.catalog.club.DirectVipBuyController

package com.sulake.habbo.tablet.catalog.club{
    import com.sulake.habbo.tablet.catalog.HabboTabletCatalog;
    import com.sulake.habbo.tablet.catalog.purse.Purse;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.HabboClubOffersMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.DirectSMSClubBuyAvailableMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent;

    public class DirectVipBuyController {

        private var _catalog:HabboTabletCatalog;
        private var _purse:Purse;
        private var _directSmsBuyAvailableForUser:Boolean;
        private var _directSmsBuyPricePointUrl:String;
        private var _directSmsBuyMarket:String;
        private var _directSmsBuyLengthInDays:int;
        private var _directSmsBuyInProcess:Boolean;
        private var _disposed:Boolean;
        private var _sourceEvent:String;
        private var _source:int;
        private var _quickBuyEnabled:Boolean;
        private var _directSmsBuyEnabled:Boolean;
        private var _directSmsBuyEnabledListener:IMessageEvent;
        private var _sendUserInfoEventListener:IMessageEvent;

        public function DirectVipBuyController(k:HabboTabletCatalog, _arg_2:Purse);

        public function dispose():void;

        public function showDialog(k:String):void;

        private function createQuickBuyDialog():void;

        private function createDirectSmsBuyDialog():void;

        public function hideQuickBuyDialog():void;

        public function hideDirectSmsBuyDialog():void;

        public function hideBenefits():void;

        public function onOffers(k:HabboClubOffersMessageParser):void;

        public function getOffers():void;

        public function get catalog():HabboTabletCatalog;

        public function get sourceEvent():String;

        public function openDirectBuy():void;

        private function onDirectSMSClubBuyAvailable(k:DirectSMSClubBuyAvailableMessageEvent):void;

        private function onSubscriptionInfoMessage(k:ScrSendUserInfoEvent):void;

        private function showSuccessDialog():void;


    }
}//package com.sulake.habbo.tablet.catalog.club

