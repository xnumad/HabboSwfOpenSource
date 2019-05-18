package com.sulake.habbo.catalog.club
{
    import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_7373;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_10037;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.catalog.purse.IPurse;

    public class ClubGiftController 
    {
        private var _widget:ClubGiftWidget;
        private var _daysUntilNextGift:int;
        private var _giftsAvailable:int;
        private var _offers:Array;
        private var _giftData:Map;
        private var _catalog:HabboCatalog;
        private var _confirmationDialog:ClubGiftConfirmationDialog;

        public function ClubGiftController(k:HabboCatalog)
        {
            this._catalog = k;
        }

        public function dispose():void
        {
            this._catalog = null;
            if (this._confirmationDialog)
            {
                this._confirmationDialog.dispose();
                this._confirmationDialog = null;
            }
        }

        public function set widget(k:ClubGiftWidget):void
        {
            this._widget = k;
            this._catalog.connection.send(new _Str_7373());
        }

        public function get _Str_12860():int
        {
            return this._daysUntilNextGift;
        }

        public function get _Str_7574():int
        {
            return this._giftsAvailable;
        }

        public function _Str_24745(k:int, _arg_2:int, _arg_3:Array, _arg_4:Map):void
        {
            this._daysUntilNextGift = k;
            this._giftsAvailable = _arg_2;
            this._offers = _arg_3;
            this._giftData = _arg_4;
            if (this._widget)
            {
                this._widget.update();
            }
        }

        public function _Str_24080(k:IPurchasableOffer):void
        {
            this._Str_4504();
            this._confirmationDialog = new ClubGiftConfirmationDialog(this, k);
        }

        public function _Str_11237(k:String):void
        {
            if ((((!(k)) || (!(this._catalog))) || (!(this._catalog.connection))))
            {
                return;
            }
            this._catalog.connection.send(new _Str_10037(k));
            this._giftsAvailable--;
            this._widget.update();
            this._Str_4504();
        }

        public function _Str_4504():void
        {
            if (this._confirmationDialog)
            {
                this._confirmationDialog.dispose();
                this._confirmationDialog = null;
            }
        }

        public function _Str_16489():Array
        {
            return this._offers;
        }

        public function _Str_23509():Map
        {
            return this._giftData;
        }

        public function get _Str_6454():Boolean
        {
            if (((!(this._catalog)) || (!(this._catalog.getPurse()))))
            {
                return false;
            }
            return this._catalog.getPurse().clubDays > 0;
        }

        public function get windowManager():IHabboWindowManager
        {
            if (!this._catalog)
            {
                return null;
            }
            return this._catalog.windowManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            if (!this._catalog)
            {
                return null;
            }
            return this._catalog.localization;
        }

        public function get assets():IAssetLibrary
        {
            if (!this._catalog)
            {
                return null;
            }
            return this._catalog.assets;
        }

        public function get roomEngine():IRoomEngine
        {
            if (!this._catalog)
            {
                return null;
            }
            return this._catalog.roomEngine;
        }

        public function getProductData(k:String):IProductData
        {
            if (!this._catalog)
            {
                return null;
            }
            return this._catalog.getProductData(k);
        }

        public function get purse():IPurse
        {
            if (!this._catalog)
            {
                return null;
            }
            return this._catalog.getPurse();
        }

        public function get catalog():HabboCatalog
        {
            return this._catalog;
        }
    }
}
