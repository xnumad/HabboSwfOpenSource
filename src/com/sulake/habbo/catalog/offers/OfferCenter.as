package com.sulake.habbo.catalog.offers
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindow;
    import flash.utils.Timer;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_7261;
    import flash.events.TimerEvent;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_7924;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import __AS3__.vec.*;

    public class OfferCenter implements IOfferCenter, IDisposable 
    {
        private static const _Str_16629:int = 1800000;

        private var _disposed:Boolean;
        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _catalog:IHabboCatalog;
        private var _offerExtension:IOfferExtension;
        private var _window:IWindowContainer;
        private var _currentProvider:IOfferProvider;
        private var _providers:Vector.<IOfferProvider>;
        private var _rewards:Vector.<OfferReward>;
        private var _rewardTemplate:IWindow;
        private var _pollTimer:Timer;
        private var _offerRewardDeliveredMessageEvent:_Str_7261;

        public function OfferCenter(k:IHabboWindowManager, _arg_2:IAssetLibrary, _arg_3:IHabboCatalog)
        {
            this._windowManager = k;
            this._assets = _arg_2;
            this._catalog = _arg_3;
            this._offerRewardDeliveredMessageEvent = new _Str_7261(this._Str_22579);
            this._catalog.connection.addMessageEvent(this._offerRewardDeliveredMessageEvent);
            this._providers = new Vector.<IOfferProvider>(0);
            this._providers.push(new SupersonicProvider(this));
            this._providers.push(new SponsorPayProvider(this));
            this._rewards = new Vector.<OfferReward>(0);
            this._pollTimer = new Timer(_Str_16629);
            this._pollTimer.addEventListener(TimerEvent.TIMER, this._Str_10015);
            this._pollTimer.start();
            this._Str_10015(null);
        }

        private function _Str_10015(k:TimerEvent):void
        {
            var _local_2:IOfferProvider;
            if (this._providers == null)
            {
                return;
            }
            for each (_local_2 in this._providers)
            {
                if (_local_2.enabled)
                {
                    _local_2.load();
                }
            }
        }

        private function _Str_24957():IOfferProvider
        {
            var k:IOfferProvider;
            if (this._providers == null)
            {
                return null;
            }
            for each (k in this._providers)
            {
                if (((k.enabled) && (k._Str_15510)))
                {
                    return k;
                }
            }
            return null;
        }

        private function _Str_22579(k:_Str_7261):void
        {
            var _local_2:_Str_7924 = k.getParser();
            this._Str_23174(_local_2.name, _local_2.contentType, _local_2.classId);
        }

        public function dispose():void
        {
            var k:IOfferProvider;
            if (this._disposed)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._providers != null)
            {
                for each (k in this._providers)
                {
                    k.dispose();
                }
                this._providers = null;
            }
            if (this._pollTimer != null)
            {
                this._pollTimer.stop();
                this._pollTimer = null;
            }
            this._catalog.connection.removeMessageEvent(this._offerRewardDeliveredMessageEvent);
            this._offerRewardDeliveredMessageEvent = null;
            this._rewards = null;
            this._offerExtension = null;
            this._windowManager = null;
            this._catalog = null;
            this._assets = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set _Str_24459(k:IOfferExtension):void
        {
            this._offerExtension = k;
        }

        public function _Str_19222():void
        {
            this.hide();
            this._window = (this._windowManager.buildFromXML((this._assets.getAssetByName("offer_center_xml").content as XML)) as IWindowContainer);
            this._window.procedure = this._Str_2533;
            this._window.center();
            this._rewardTemplate = IItemListWindow(this._window.findChildByName("reward_list")).removeListItemAt(0);
            this._Str_22857();
        }

        public function showVideo():void
        {
            if (this._currentProvider != null)
            {
                this._currentProvider.showVideo();
            }
        }

        public function get _Str_16243():Boolean
        {
            return (!(this._currentProvider == null)) && (this._currentProvider._Str_16897);
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k.type == WindowMouseEvent.CLICK)) || (!(this.visible))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this.hide();
                    return;
            }
        }

        private function hide():void
        {
            if (this._window != null)
            {
                this._rewardTemplate.dispose();
                this._rewardTemplate = null;
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_23174(k:String, _arg_2:String, _arg_3:int):void
        {
            var _local_4:OfferReward = new OfferReward(k, _arg_2, _arg_3);
            this._rewards.unshift(_local_4);
            if (this.visible)
            {
                IItemListWindow(this._window.findChildByName("reward_list")).addListItemAt(this._Str_22016(_local_4), 0);
            }
            else
            {
                if (this._offerExtension != null)
                {
                    this._offerExtension._Str_18053();
                }
            }
        }

        public function get configuration():IHabboConfigurationManager
        {
            return this._catalog as IHabboConfigurationManager;
        }

        public function _Str_4988():void
        {
            if (this._offerExtension != null)
            {
                this._currentProvider = this._Str_24957();
                this._offerExtension._Str_14237(((!(this._currentProvider == null)) && (this._currentProvider._Str_15510)));
            }
        }

        private function _Str_22857():void
        {
            var _local_2:OfferReward;
            if (!this.visible)
            {
                return;
            }
            var k:IItemListWindow = (this._window.findChildByName("reward_list") as IItemListWindow);
            k.destroyListItems();
            for each (_local_2 in this._rewards)
            {
                k.addListItem(this._Str_22016(_local_2));
            }
        }

        private function _Str_22016(k:OfferReward):IWindow
        {
            var _local_2:IWindowContainer = (this._rewardTemplate.clone() as IWindowContainer);
            _local_2.findChildByName("reward_date").caption = new Date().toLocaleString();
            _local_2.findChildByName("reward_name").caption = k.name;
            this._catalog.displayProductIcon(k.contentType, k.classId, IBitmapWrapperWindow(_local_2.findChildByName("reward_icon")));
            return _local_2;
        }

        private function get visible():Boolean
        {
            return ((!(this._window == null)) && (!(this._window.disposed))) && (this._window.visible);
        }

        public function _Str_24469():void
        {
        }
    }
}
