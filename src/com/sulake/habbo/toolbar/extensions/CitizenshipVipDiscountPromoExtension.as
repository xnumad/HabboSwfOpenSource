package com.sulake.habbo.toolbar.extensions
{
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.window.components.IBorderWindow;
    import flash.utils.Timer;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.toolbar.IExtensionView;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_7218;
    import flash.events.TimerEvent;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;

    public class CitizenshipVipDiscountPromoExtension 
    {
        private var _toolbar:HabboToolbar;
        private var _view:IBorderWindow;
        private var _expanded:Boolean = true;
        private var _originalHeight:int = 216;
        private var _expirationTimer:Timer;

        public function CitizenshipVipDiscountPromoExtension(k:HabboToolbar)
        {
            this._toolbar = k;
        }

        private function createWindow():IBorderWindow
        {
            var k:IBorderWindow;
            var _local_2:IAsset = this._toolbar.assets.getAssetByName("vip_discount_promotion_v2_xml");
            if (_local_2)
            {
                k = (this._toolbar.windowManager.buildFromXML((_local_2.content as XML), 1) as IBorderWindow);
                if (k)
                {
                    IButtonWindow(k.findChildByName("extend_button").addEventListener(WindowMouseEvent.CLICK, this._Str_2608));
                    IRegionWindow(k.findChildByName("minimize_region")).addEventListener(WindowMouseEvent.CLICK, this._Str_12174);
                    IRegionWindow(k.findChildByName("maximize_region")).addEventListener(WindowMouseEvent.CLICK, this._Str_12174);
                    this._originalHeight = k.height;
                }
            }
            return k;
        }

        private function _Str_2669():void
        {
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
            this._Str_10712();
        }

        private function get extensionView():IExtensionView
        {
            return this._toolbar.extensionView;
        }

        public function dispose():void
        {
            if (this._toolbar == null)
            {
                return;
            }
            if (this.extensionView != null)
            {
                this.extensionView.detachExtension(ToolbarDisplayExtensionIds.CLUB_PROMO);
            }
            this._Str_2669();
            this._toolbar = null;
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            if (this._toolbar.inventory.clubLevel == HabboClubLevelEnum._Str_2575)
            {
                this._toolbar.connection.send(new EventLogMessageComposer("DiscountPromo", "citizenshipdiscount", "client.club.extend.discount.clicked"));
                this._toolbar.connection.send(new _Str_7218());
            }
        }

        private function _Str_6881():void
        {
            this._view.findChildByName("content_itemlist").visible = this._expanded;
            this._view.findChildByName("promo_img").visible = this._expanded;
            this._view.height = ((this._expanded) ? this._originalHeight : 33);
        }

        public function _Str_5219(k:HabboInventoryHabboClubEvent):void
        {
            if ((((this._toolbar.inventory._Str_8836) && (this._view == null)) && (this._Str_17305())))
            {
                this._view = this.createWindow();
                if (this._expirationTimer != null)
                {
                    this._Str_10712();
                }
                if (((this._toolbar.inventory._Str_6338 < 1440) && (this._toolbar.inventory._Str_6338 > 0)))
                {
                    this._expirationTimer = new Timer(((this._toolbar.inventory._Str_6338 * 60) * 1000), 1);
                    this._expirationTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                    this._expirationTimer.start();
                }
                this._Str_6881();
                if (!this._toolbar.extensionView.hasExtension(ToolbarDisplayExtensionIds.VIP_QUESTS))
                {
                    this._toolbar.extensionView.attachExtension(ToolbarDisplayExtensionIds.CLUB_PROMO, this._view, ExtensionFixedSlotsEnum._Str_8642);
                }
            }
            else
            {
                this._toolbar.extensionView.detachExtension(ToolbarDisplayExtensionIds.VIP_QUESTS);
                this._Str_2669();
            }
        }

        private function _Str_10712():void
        {
            if (this._expirationTimer)
            {
                this._expirationTimer.stop();
                this._expirationTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                this._expirationTimer = null;
            }
        }

        private function onTimerComplete(k:TimerEvent):void
        {
            this._toolbar.extensionView.detachExtension(ToolbarDisplayExtensionIds.CLUB_PROMO);
            this._Str_2669();
        }

        private function _Str_17305():Boolean
        {
            return (this._toolbar.inventory.clubLevel == HabboClubLevelEnum._Str_2575) && (this._toolbar.getBoolean("club.membership.extend.vip.promotion.enabled"));
        }

        private function _Str_12174(k:WindowMouseEvent):void
        {
            this._expanded = (!(this._expanded));
            this._Str_6881();
        }
    }
}




