package com.sulake.habbo.toolbar.extensions
{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.IEventDispatcher;
    import com.sulake.core.localization.ICoreLocalizationManager;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.toolbar.IExtensionView;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.perk._Str_12157;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_7568;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;

    public class CitizenshipVipQuestsPromoExtension 
    {
        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _events:IEventDispatcher;
        private var _localization:ICoreLocalizationManager;
        private var _connection:IConnection;
        private var _extensionView:IExtensionView;
        private var _view:IBorderWindow;
        private var _disposed:Boolean = false;
        private var _expanded:Boolean = true;
        private var _originalHeight:int = 216;
        private var _vipQuestsCampaignName:String;
        private var _promoEnabledListener:IMessageEvent = null;

        public function CitizenshipVipQuestsPromoExtension(k:HabboToolbar, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IEventDispatcher, _arg_5:ICoreLocalizationManager, _arg_6:IConnection)
        {
            this._windowManager = _arg_2;
            this._assets = _arg_3;
            this._events = _arg_4;
            this._localization = _arg_5;
            this._connection = _arg_6;
            this._extensionView = k.extensionView;
            this._promoEnabledListener = new _Str_12157(this._Str_24787);
            this._connection.addMessageEvent(this._promoEnabledListener);
            this._vipQuestsCampaignName = k.getProperty("citizenship.vip.tutorial.quest.campaign.name");
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (((this._connection) && (this._promoEnabledListener)))
            {
                this._connection.removeMessageEvent(this._promoEnabledListener);
                this._promoEnabledListener = null;
            }
            this._Str_2669();
            this._localization = null;
            this._assets = null;
            this._events = null;
            this._windowManager = null;
            this._connection = null;
            this._extensionView = null;
            this._disposed = true;
        }

        private function createWindow():IBorderWindow
        {
            var k:IBorderWindow;
            var _local_2:IAsset = this._assets.getAssetByName("vip_quests_promo_xml");
            if (_local_2)
            {
                k = (this._windowManager.buildFromXML((_local_2.content as XML), 1) as IBorderWindow);
                if (k)
                {
                    IButtonWindow(k.findChildByName("quests_button").addEventListener(WindowMouseEvent.CLICK, this._Str_2608));
                    IRegionWindow(k.findChildByName("minimize_region")).addEventListener(WindowMouseEvent.CLICK, this._Str_12174);
                    IRegionWindow(k.findChildByName("maximize_region")).addEventListener(WindowMouseEvent.CLICK, this._Str_12174);
                    this._originalHeight = k.height;
                }
            }
            return k;
        }

        private function _Str_2669():void
        {
            if (this._extensionView)
            {
                this._extensionView.detachExtension(ToolbarDisplayExtensionIds.VIP_QUESTS);
            }
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            if (this._connection)
            {
                this._connection.send(new _Str_7568(this._vipQuestsCampaignName));
            }
            this._Str_2669();
        }

        private function _Str_12174(k:WindowMouseEvent):void
        {
            this._expanded = (!(this._expanded));
            this._Str_6881();
        }

        private function _Str_6881():void
        {
            IItemListWindow(this._view.findChildByName("content_itemlist")).visible = this._expanded;
            IStaticBitmapWrapperWindow(this._view.findChildByName("promo_img")).visible = this._expanded;
            this._view.height = ((this._expanded) ? this._originalHeight : 33);
        }

        private function _Str_24787(k:IMessageEvent):void
        {
            if (this._view == null)
            {
                this._view = this.createWindow();
            }
            this._Str_6881();
            this._extensionView.detachExtension(ToolbarDisplayExtensionIds.CLUB_PROMO);
            this._extensionView.attachExtension(ToolbarDisplayExtensionIds.VIP_QUESTS, this._view, ExtensionFixedSlotsEnum._Str_8642);
        }
    }
}
