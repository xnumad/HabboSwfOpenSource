package com.sulake.habbo.catalog.club
{
    import com.sulake.habbo.catalog.viewer.widgets.IVipBuyCatalogWidget;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5442;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_6792;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.catalog.purse.IPurse;

    public class ClubOfferHandler 
    {
        private var _visualization:IVipBuyCatalogWidget;
        private var _habboCatalog:HabboCatalog;
        private var _Str_2397:Array;
        private var _Str_2635:ClubBuyConfirmationDialog;
        private var _Str_2310:IConnection;
        private var _disposed:Boolean = false;

        public function ClubOfferHandler(k:HabboCatalog, _arg_2:IConnection)
        {
            this._habboCatalog = k;
            this._Str_2310 = _arg_2;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._visualization != null)
            {
                this._visualization.dispose();
                this._visualization = null;
            }
            this.reset();
            this._Str_4504();
            this._habboCatalog = null;
            this._disposed = true;
        }

        public function get catalog():HabboCatalog
        {
            return this._habboCatalog;
        }

        public function reset():void
        {
            var k:ClubBuyOfferData;
            for each (k in this._Str_2397)
            {
                k.dispose();
            }
            this._Str_2397 = [];
        }

        public function onOffers(k:_Str_6792):void
        {
            var _local_3:ClubBuyOfferData;
            var _local_4:_Str_5442;
            var _local_5:ClubBuyOfferData;
            var _local_6:Boolean;
            var _local_7:Array;
            var _local_8:ClubBuyOfferData;
            var _local_9:int;
            if (this._disposed)
            {
                return;
            }
            this.reset();
            var _local_2:int;
            for each (_local_4 in k.offers)
            {
                _local_5 = new ClubBuyOfferData(_local_4.offerId, _local_4.productCode, _local_4.priceCredits, _local_4.priceActivityPoints, _local_4._Str_23501, _local_4.vip, _local_4.months, _local_4._Str_15178, _local_4._Str_11224, _local_4.year, _local_4.month, _local_4.day, _local_4._Str_18028);
                this._Str_2397.push(_local_5);
                if (_local_4.vip)
                {
                    _local_2++;
                    _local_3 = _local_5;
                }
            }
            if (_local_2 == 1)
            {
                _local_3._Str_10047 = true;
            }
            this._Str_2397.sort(this.orderByPrecedence);
            if (this._visualization != null)
            {
                this._visualization.reset();
                this._visualization._Str_15013(this._Str_25808());
                _local_6 = this._visualization.isGift;
                _local_7 = this._Str_23878(_local_6);
                for each (_local_8 in this._Str_2397)
                {
                    if (_local_8.months > 0)
                    {
                        if (_local_7.length > 0)
                        {
                            _local_9 = _local_8.months;
                            if (_local_7.indexOf(_local_9) == -1)
                            {
                                continue;
                            }
                        }
                        this._visualization._Str_6059(_local_8);
                    }
                }
            }
        }

        private function _Str_23878(k:Boolean):Array
        {
            var _local_4:String;
            var _local_5:Array;
            var _local_6:String;
            var _local_7:Number;
            var _local_2:Array = new Array();
            var _local_3:String = ((k) ? "catalog.vip.gift.promo" : "catalog.vip.buy.promo");
            if (this._habboCatalog.propertyExists(_local_3))
            {
                _local_4 = this._habboCatalog.getProperty(_local_3, null);
                if (((!(_local_4 == null)) && (_local_4.length > 0)))
                {
                    _local_5 = _local_4.split(",");
                    if (_local_5.length > 0)
                    {
                        for each (_local_6 in _local_5)
                        {
                            _local_7 = parseInt(_local_6);
                            if (((!(isNaN(_local_7))) && (_local_7 > 0)))
                            {
                                _local_2.push(_local_7);
                            }
                        }
                    }
                }
            }
            return _local_2;
        }

        public function _Str_18073(k:IVipBuyCatalogWidget):void
        {
            if (this._visualization == k)
            {
                this._visualization = null;
            }
        }

        public function registerVisualization(k:IVipBuyCatalogWidget):void
        {
            this._visualization = k;
        }

        public function requestOffers(k:int):void
        {
            this._habboCatalog._Str_17905(k);
        }

        public function showConfirmation(k:ClubBuyOfferData, _arg_2:int):void
        {
            this._Str_4504();
            this._Str_2635 = new ClubBuyConfirmationDialog(this, k, _arg_2);
        }

        public function _Str_11237(k:ClubBuyOfferData, _arg_2:int):void
        {
            if (((!(this._habboCatalog)) || (!(this._habboCatalog.connection))))
            {
                return;
            }
            this._habboCatalog._Str_18074(_arg_2, k.offerId);
            this._Str_4504();
        }

        public function _Str_4504():void
        {
            if (this._Str_2635)
            {
                this._Str_2635.dispose();
                this._Str_2635 = null;
            }
        }

        public function _Str_25808():int
        {
            var k:int = HabboClubLevelEnum._Str_3159;
            if (this._habboCatalog.getPurse().hasClubLeft)
            {
                k = ((this._habboCatalog.getPurse().isVIP) ? HabboClubLevelEnum._Str_2575 : HabboClubLevelEnum._Str_2964);
            }
            return k;
        }

        public function get _Str_6454():Boolean
        {
            if (((!(this._habboCatalog)) || (!(this._habboCatalog.getPurse()))))
            {
                return false;
            }
            return this._habboCatalog.getPurse().clubDays > 0;
        }

        public function get windowManager():IHabboWindowManager
        {
            if (!this._habboCatalog)
            {
                return null;
            }
            return this._habboCatalog.windowManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            if (!this._habboCatalog)
            {
                return null;
            }
            return this._habboCatalog.localization;
        }

        public function get assets():IAssetLibrary
        {
            if (!this._habboCatalog)
            {
                return null;
            }
            return this._habboCatalog.assets;
        }

        public function get roomEngine():IRoomEngine
        {
            if (!this._habboCatalog)
            {
                return null;
            }
            return this._habboCatalog.roomEngine;
        }

        public function getProductData(k:String):IProductData
        {
            if (!this._habboCatalog)
            {
                return null;
            }
            return this._habboCatalog.getProductData(k);
        }

        public function getPurse():IPurse
        {
            if (!this._habboCatalog)
            {
                return null;
            }
            return this._habboCatalog.getPurse();
        }

        private function orderByPrecedence(k:ClubBuyOfferData, _arg_2:ClubBuyOfferData):Number
        {
            var _local_3:Number = k.months;
            var _local_4:Number = _arg_2.months;
            if (_local_3 < _local_4)
            {
                return -1;
            }
            if (_local_3 > _local_4)
            {
                return 1;
            }
            return 0;
        }
    }
}
