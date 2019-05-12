package com.sulake.habbo.catalog.club
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5335;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import flash.utils.Timer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.window.enum._Str_8057;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import flash.events.TimerEvent;
    import flash.geom.Point;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.assets.XmlAsset;
    import __AS3__.vec.*;

    public class ClubExtendConfirmationDialog 
    {
        private static const _Str_7770:int = 7;
        private static const YOUR_PRICE_ICON_LEFT:String = "your_price_icon_left";
        private static const _Str_17882:String = "${image.library.catalogue.url}catalogue/vip_extend_tsr.png";
        private static const _Str_17088:String = "image/png";
        private static const _Str_17359:int = 2000;
        private static const _Str_17942:int = 75;
        private static const _Str_17537:uint = 0;
        private static const _Str_16843:uint = 9552639;

        private var _controller:ClubExtendController;
        private var _view:IFrameWindow;
        private var _offer:_Str_5335;
        private var _maybeLaterRegion:IRegionWindow;
        private var _maybeLaterLink:ITextWindow;
        private var _creditImageElement:IBitmapWrapperWindow;
        private var _creditImages:Vector.<BitmapData>;
        private var _animationTriggerTimer:Timer;
        private var _animationFrameTimer:Timer;
        private var _animationFrame:int = 0;
        private var _animationLoop:int = 0;
        private var _disposed:Boolean = false;
        private var _localizationKey:String = "catalog.club.extend.";

        public function ClubExtendConfirmationDialog(k:ClubExtendController, _arg_2:_Str_5335)
        {
            this._controller = k;
            this._offer = _arg_2;
            this._creditImages = new Vector.<BitmapData>(_Str_7770);
        }

        public function dispose():void
        {
            var k:int;
            if (this._disposed)
            {
                return;
            }
            this._offer = null;
            this._controller = null;
            this._Str_9128();
            if (this._maybeLaterRegion)
            {
                this._maybeLaterRegion.removeEventListener(WindowMouseEvent.OUT, this._Str_21389);
                this._maybeLaterRegion.removeEventListener(WindowMouseEvent.OVER, this._Str_21154);
                this._maybeLaterRegion = null;
            }
            if (this._maybeLaterLink)
            {
                this._maybeLaterLink = null;
            }
            if (this._creditImageElement)
            {
                this._creditImageElement = null;
            }
            if (this._creditImages)
            {
                while (k < _Str_7770)
                {
                    this._creditImages[k].dispose();
                    this._creditImages[k] = null;
                    k++;
                }
                this._creditImages = null;
            }
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
            this._disposed = true;
        }

        public function showConfirmation():void
        {
            var _local_2:String;
            var _local_10:IIconWindow;
            var _local_11:BitmapDataAsset;
            var _local_12:BitmapData;
            if ((((!(this._offer)) || (!(this._controller))) || (this._disposed)))
            {
                return;
            }
            this._view = (this.createWindow("club_extend_confirmation") as IFrameWindow);
            if (!this._view)
            {
                return;
            }
            this._view.procedure = this._Str_3545;
            this._view.center();
            if (!this._offer.vip)
            {
                this._localizationKey = (this._localizationKey + "basic.");
                _local_10 = (this._view.findChildByName("club_level_icon") as IIconWindow);
                if (_local_10)
                {
                    _local_10.style = _Str_8057._Str_18852;
                    _local_10.x = (_local_10.x + 15);
                }
            }
            var k:IHabboLocalizationManager = this._controller.localization;
            this._view.findChildByName("normal_price_price_left").caption = this._offer._Str_23477.toString();
            this._view.findChildByName("normal_price_price_right").caption = this._offer._Str_21585.toString();
            this._view.findChildByName("you_save_price_left").caption = this._offer._Str_24050.toString();
            this._view.findChildByName("you_save_price_right").caption = this._offer._Str_22280.toString();
            this._view.findChildByName("your_price_price_left").caption = this._offer.priceCredits.toString();
            this._view.findChildByName("your_price_price_right").caption = this._offer.priceActivityPoints.toString();
            this._view.title.caption = k.getLocalization((this._localizationKey + "confirm.caption"));
            this._view.findChildByName("extend_title").caption = k.getLocalization((this._localizationKey + "confirm.title"));
            this._view.findChildByName("normal_price_label").caption = k.getLocalization((this._localizationKey + "normal.label"));
            this._view.findChildByName("you_save_label").caption = k.getLocalization((this._localizationKey + "save.label"));
            this._view.findChildByName("your_price_label").caption = k.getLocalization((this._localizationKey + "price.label"));
            this._view.findChildByName("buy_now_button").caption = k.getLocalization((this._localizationKey + "buy.button"));
            this._view.findChildByName("maybe_later_link").caption = k.getLocalization((this._localizationKey + "later.link"));
            if (this._offer._Str_21229 > 1)
            {
                k.registerParameter((this._localizationKey + "expiration_days_left"), "day", this._offer._Str_21229.toString());
                k.registerParameter((this._localizationKey + "expiration_days_left"), "duration", (31 * this._offer.months).toString());
                _local_2 = k.getLocalization((this._localizationKey + "expiration_days_left"));
            }
            else
            {
                _local_2 = k.getLocalization((this._localizationKey + "expires_today"));
            }
            this._view.findChildByName("offer_expiration").caption = _local_2;
            this._maybeLaterRegion = (this._view.findChildByName("maybe_later_region") as IRegionWindow);
            this._maybeLaterLink = (this._view.findChildByName("maybe_later_link") as ITextWindow);
            if (((!(this._maybeLaterRegion)) || (!(this._maybeLaterLink))))
            {
                return;
            }
            this._maybeLaterRegion.addEventListener(WindowMouseEvent.OUT, this._Str_21389);
            this._maybeLaterRegion.addEventListener(WindowMouseEvent.OVER, this._Str_21154);
            var _local_3:BitmapData = this._Str_16777("icon_credit_0");
            this._Str_14412("normal_price_icon_left", _local_3);
            this._Str_14412("you_save_icon_left", _local_3);
            this._Str_9646("normal_price_icon_right");
            this._Str_9646("you_save_icon_right");
            this._Str_9646("your_price_icon_right");
            var _local_4:IBitmapWrapperWindow = (this._view.findChildByName("club_teaser") as IBitmapWrapperWindow);
            _local_4.x = 1;
            _local_4.y = (this._view.height - 144);
            _local_4.height = 144;
            _local_4.width = 133;
            var _local_5:String = this._controller.config.interpolate(_Str_17882);
            if (this._controller.config)
            {
                _local_5 = this._controller.config.updateUrlProtocol(_local_5);
            }
            this._Str_22657("club_teaser", "club_teaser", _local_5, _Str_17088, this._Str_25165);
            var _local_6:IItemListWindow = (this._view.findChildByName("itemlist_vertical") as IItemListWindow);
            if (!_local_6)
            {
                return;
            }
            var _local_7:IWindowContainer = (this._view.findChildByName("total_amount_line") as IWindowContainer);
            if (!_local_7)
            {
                return;
            }
            var _local_8:IWindowContainer = (this._view.findChildByName("background_container") as IWindowContainer);
            if (!_local_8)
            {
                return;
            }
            _local_8.height = ((_local_6.y + _local_7.height) + _local_7.y);
            this._creditImageElement = (this._view.findChildByName(YOUR_PRICE_ICON_LEFT) as IBitmapWrapperWindow);
            if (this._creditImageElement == null)
            {
                return;
            }
            var _local_9:int;
            while (_local_9 < _Str_7770)
            {
                _local_11 = (this._controller.assets.getAssetByName(("icon_credit_" + _local_9)) as BitmapDataAsset);
                _local_12 = (_local_11.content as BitmapData);
                this._creditImages[_local_9] = _local_12.clone();
                _local_9++;
            }
            this._Str_1480();
        }

        private function _Str_9646(k:String):void
        {
            var _local_2:IWindow = this._view.findChildByName(k);
            _local_2.style = ActivityPointTypeEnum._Str_5251(this._offer._Str_22469, this._controller.config, true);
        }

        private function _Str_21389(k:WindowMouseEvent):void
        {
            if (this._maybeLaterLink)
            {
                this._maybeLaterLink.textColor = _Str_17537;
            }
        }

        private function _Str_21154(k:WindowMouseEvent):void
        {
            if (this._maybeLaterLink)
            {
                this._maybeLaterLink.textColor = _Str_16843;
            }
        }

        private function _Str_1480():void
        {
            if (this._animationTriggerTimer)
            {
                this._Str_9128();
            }
            this._Str_9300();
            this._animationTriggerTimer = new Timer(_Str_17359);
            this._animationTriggerTimer.addEventListener(TimerEvent.TIMER, this._Str_24007);
            this._animationTriggerTimer.start();
        }

        private function _Str_9128():void
        {
            this._animationFrame = 0;
            this._animationLoop = 0;
            if (this._animationFrameTimer)
            {
                this._animationFrameTimer.stop();
                this._animationFrameTimer = null;
            }
            if (this._animationTriggerTimer)
            {
                this._animationTriggerTimer.stop();
                this._animationTriggerTimer = null;
            }
        }

        private function _Str_9300():void
        {
            if (!this._creditImageElement)
            {
                return;
            }
            if (this._creditImageElement.bitmap)
            {
                this._creditImageElement.bitmap.dispose();
            }
            if (this._animationFrame < _Str_7770)
            {
                this._creditImageElement.bitmap = new BitmapData(this._creditImageElement.width, this._creditImageElement.height, true, 0);
                this._creditImageElement.bitmap.copyPixels(this._creditImages[this._animationFrame], this._creditImages[this._animationFrame].rect, new Point(0, 0));
            }
            else
            {
                Logger.log(("Animation frame " + this._animationFrame));
            }
        }

        private function _Str_21014():void
        {
            this._animationFrameTimer = new Timer(_Str_17942, (_Str_7770 - 1));
            this._animationFrameTimer.addEventListener(TimerEvent.TIMER, this.onTimer);
            this._animationFrameTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
            this._animationFrameTimer.start();
        }

        private function _Str_24007(k:TimerEvent):void
        {
            this._Str_21014();
        }

        private function onTimer(k:TimerEvent):void
        {
            this._animationFrame = (this._animationFrame + 1);
            this._Str_9300();
        }

        private function onTimerComplete(k:TimerEvent):void
        {
            if (this._animationFrameTimer)
            {
                this._animationFrameTimer.stop();
                this._animationFrameTimer = null;
            }
            this._animationFrame = 0;
            this._Str_9300();
            if (this._animationLoop == 0)
            {
                this._animationLoop = 1;
                this._Str_21014();
            }
            else
            {
                this._animationLoop = 0;
            }
        }

        private function _Str_16777(k:String):BitmapData
        {
            var _local_2:BitmapDataAsset = (this._controller.assets.getAssetByName(k) as BitmapDataAsset);
            if (_local_2 != null)
            {
                return _local_2.content as BitmapData;
            }
            return null;
        }

        private function _Str_14412(k:String, _arg_2:BitmapData):void
        {
            var _local_3:IBitmapWrapperWindow = (this._view.findChildByName(k) as IBitmapWrapperWindow);
            if (_local_3.bitmap != null)
            {
                _local_3.bitmap.dispose();
            }
            if (((!(_arg_2 == null)) && (!(_local_3 == null))))
            {
                if (_local_3.width != _arg_2.width)
                {
                    _local_3.width = _arg_2.width;
                }
                if (_local_3.height != _arg_2.height)
                {
                    _local_3.height = _arg_2.height;
                }
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
                _local_3.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(0, 0));
            }
        }

        private function _Str_22657(k:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Function):Boolean
        {
            var _local_6:BitmapData = this._Str_16777(_arg_2);
            if (_local_6 != null)
            {
                this._Str_14412(k, _local_6);
                return true;
            }
            var _local_7:URLRequest = new URLRequest(_arg_3);
            var _local_8:AssetLoaderStruct = this._controller.assets.loadAssetFromFile(_arg_2, _local_7, _arg_4);
            if (!_local_8)
            {
                return false;
            }
            _local_8.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, _arg_5);
            return true;
        }

        private function _Str_25165(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct;
            var _local_3:BitmapData;
            if (!this._disposed)
            {
                _local_2 = (k.target as AssetLoaderStruct);
                if (_local_2 != null)
                {
                    _local_3 = this._Str_16777(_local_2.assetName);
                    this._Str_14412("club_teaser", _local_3);
                }
            }
        }

        private function _Str_3545(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((((!(k)) || (!(_arg_2))) || (!(this._controller))) || (!(this._offer))) || (this._disposed)))
            {
                return;
            }
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "buy_now_button":
                    this._controller._Str_11237();
                    return;
                case "header_button_close":
                case "maybe_later_region":
                    this._controller._Str_4504();
                    return;
            }
        }

        private function createWindow(k:String):IWindow
        {
            if (((((!(this._controller)) || (!(this._controller.assets))) || (!(this._controller.windowManager))) || (this._disposed)))
            {
                return null;
            }
            var _local_2:XmlAsset = (this._controller.assets.getAssetByName(k) as XmlAsset);
            if (((!(_local_2)) || (!(_local_2.content))))
            {
                return null;
            }
            var _local_3:XML = (_local_2.content as XML);
            if (!_local_3)
            {
                return null;
            }
            return this._controller.windowManager.buildFromXML(_local_3);
        }
    }
}
