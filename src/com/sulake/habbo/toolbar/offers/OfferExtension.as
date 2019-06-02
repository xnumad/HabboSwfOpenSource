package com.sulake.habbo.toolbar.offers
{
    import com.sulake.habbo.catalog.offers.IOfferExtension;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.habbo.catalog.offers.IOfferCenter;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class OfferExtension implements IOfferExtension, IDisposable 
    {
        private var _disposed:Boolean;
        private var _window:IWindowContainer;
        private var _toolbar:HabboToolbar;
        private var _offerCenter:IOfferCenter;
        private var _list:IItemListWindow;

        public function OfferExtension(k:HabboToolbar, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboCatalog)
        {
            this._toolbar = k;
            this._window = (_arg_2.buildFromXML((_arg_3.getAssetByName("offer_extension_xml").content as XML)) as IWindowContainer);
            this._window.procedure = this._Str_2533;
            this._window.visible = false;
            this._list = (this._window.findChildByName("list") as IItemListWindow);
            this._offerCenter = _arg_4._Str_17606(this);
            k.extensionView.attachExtension(ToolbarDisplayExtensionIds.VIDEO_OFFERS, this.window, ExtensionFixedSlotsEnum._Str_17982);
            this.refresh();
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "start_video":
                    this._offerCenter.showVideo();
                    return;
                case "check_rewards":
                    this._offerCenter._Str_19222();
                    return;
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._list = null;
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._toolbar = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function _Str_18053():void
        {
            if (this._window != null)
            {
                this._window.visible = true;
                this._window.findChildByName("check_rewards").visible = true;
                this.refresh();
            }
        }

        public function _Str_14237(k:Boolean):void
        {
            var _local_2:IWindow;
            if (this._window != null)
            {
                this._window.visible = ((this._window.visible) || (k));
                _local_2 = this._window.findChildByName("start_video");
                _local_2.visible = k;
                if (this._offerCenter._Str_16243)
                {
                    _local_2.disable();
                    _local_2.color = 0x999999;
                }
                else
                {
                    _local_2.enable();
                    _local_2.color = 12932417;
                }
                this.refresh();
            }
        }

        private function refresh():void
        {
            this._list.arrangeListItems();
            this._window.visible = ((this._list.getListItemAt(0).visible) || (this._list.getListItemAt(1).visible));
            this._toolbar.extensionView.refreshItemWindow();
        }
    }
}
