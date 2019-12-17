package com.sulake.habbo.catalog.club
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5335;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7148;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_6375;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.IHabboConfigurationManager;

    public class ClubExtendController 
    {
        private var _catalog:HabboCatalog;
        private var _confirmationDialog:ClubExtendConfirmationDialog;
        private var _offer:_Str_5335;
        private var _disposed:Boolean = false;

        public function ClubExtendController(k:HabboCatalog)
        {
            this._catalog = k;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._Str_4504();
            this._offer = null;
            this._catalog = null;
            this._disposed = true;
        }

        public function _Str_24854(k:_Str_6375):void
        {
            if (this._disposed)
            {
                return;
            }
            var _local_2:_Str_7148 = k.getParser();
            this._offer = _local_2.offer();
            this.showConfirmation();
            if (this._catalog.connection)
            {
                if (this._offer.vip)
                {
                    this._catalog.connection.send(new EventLogMessageComposer("Catalog", "dialog_show", "vip.membership.extension.purchase"));
                }
                else
                {
                    this._catalog.connection.send(new EventLogMessageComposer("Catalog", "dialog_show", "basic.membership.extension.purchase"));
                }
            }
        }

        public function _Str_4504():void
        {
            if (this._confirmationDialog)
            {
                this._confirmationDialog.dispose();
                this._confirmationDialog = null;
            }
        }

        public function showConfirmation():void
        {
            this._Str_4504();
            this._confirmationDialog = new ClubExtendConfirmationDialog(this, this._offer);
            this._confirmationDialog.showConfirmation();
        }

        public function _Str_11237():void
        {
            if ((((!(this._catalog)) || (!(this._catalog.connection))) || (!(this._offer))))
            {
                return;
            }
            if (this._catalog.getPurse().credits < this._offer.priceCredits)
            {
                this._catalog.showNotEnoughCreditsAlert();
                return;
            }
            if (this._offer.vip)
            {
                this._catalog._Str_23708(this._offer.offerId);
            }
            else
            {
                this._catalog._Str_24571(this._offer.offerId);
            }
            this._Str_4504();
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

        public function get config():IHabboConfigurationManager
        {
            return this._catalog;
        }
    }
}
