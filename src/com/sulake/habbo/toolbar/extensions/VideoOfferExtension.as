package com.sulake.habbo.toolbar.extensions
{
    import com.sulake.habbo.catalog.IVideoOfferLauncher;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.XmlAsset;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.catalog.enum.VideoOfferTypeEnum;

    public class VideoOfferExtension implements IVideoOfferLauncher 
    {
        private static const VIDEO_OFFER:String = "video_offer";
        private static const _Str_4086:uint = 0xFFFFFF;
        private static const _Str_4030:uint = 12247545;
        private static const _Str_16248:uint = 0x666666;
        private static const _Str_17848:uint = 0xCCCCCC;

        private var _toolbar:HabboToolbar;
        private var _view:IWindowContainer;
        private var _textRegion:IRegionWindow;
        private var _closeButton:IIconWindow;
        private var _promoClosed:Boolean = false;

        public function VideoOfferExtension(k:HabboToolbar)
        {
            this._toolbar = k;
        }

        public function get window():IWindow
        {
            return this._view;
        }

        public function _Str_5219(k:HabboInventoryHabboClubEvent):void
        {
            if ((((this._toolbar.inventory._Str_6682) && (!(this._view))) && (this._Str_20377())))
            {
                this._toolbar.extensionView.detachExtension(VIDEO_OFFER);
                this._Str_2669();
                return;
            }
            if (((!(this._promoClosed)) && (!(this._view))))
            {
                this._toolbar.catalog.videoOffers.load(this);
            }
        }

        private function _Str_20377():Boolean
        {
            return (this._toolbar.inventory.clubLevel == HabboClubLevelEnum._Str_2575) && (this._toolbar.getBoolean("club.membership.extend.vip.promotion.enabled"));
        }

        public function offersAvailable(k:int):void
        {
            if (this._toolbar == null)
            {
                return;
            }
            if ((((k <= 0) || (this._promoClosed)) || ((this._toolbar.inventory._Str_6682) && (this._Str_20377()))))
            {
                if (this._view)
                {
                    this._Str_2669();
                }
                return;
            }
            if (!this._view)
            {
                this._view = this.createWindow();
            }
        }

        private function createWindow():IWindowContainer
        {
            var _local_3:String;
            var _local_4:ITextWindow;
            var _local_5:ITextWindow;
            var _local_6:BitmapDataAsset;
            var _local_7:BitmapData;
            var _local_8:IBitmapWrapperWindow;
            var k:IWindowContainer;
            var _local_2:XmlAsset = (this._toolbar.assets.getAssetByName("video_offer_promotion_xml") as XmlAsset);
            if (_local_2)
            {
                k = (this._toolbar.windowManager.buildFromXML((_local_2.content as XML), 1) as IWindowContainer);
                if (k)
                {
                    _local_3 = this._toolbar.localization.getLocalization("supersaverads.video.promo.offer", "Watch a video and earn a credit!");
                    _local_4 = (k.findChildByName("promo_text") as ITextWindow);
                    _local_5 = (k.findChildByName("promo_text_shadow") as ITextWindow);
                    if (_local_4)
                    {
                        _local_4.text = _local_3;
                    }
                    if (_local_5)
                    {
                        _local_5.text = _local_3;
                    }
                    _local_6 = (this._toolbar.assets.getAssetByName("offer_icon_png") as BitmapDataAsset);
                    if (_local_6 != null)
                    {
                        _local_7 = (_local_6.content as BitmapData);
                        _local_8 = (k.findChildByName("promo_icon") as IBitmapWrapperWindow);
                        if (((!(_local_7 == null)) && (!(_local_8 == null))))
                        {
                            _local_8.bitmap = new BitmapData(_local_8.width, _local_8.height, true, 0);
                            _local_8.bitmap.copyPixels(_local_7, _local_7.rect, new Point(0, 0));
                        }
                    }
                    this._textRegion = (k.findChildByName("text_region") as IRegionWindow);
                    if (this._textRegion)
                    {
                        this._textRegion.addEventListener(WindowMouseEvent.CLICK, this._Str_13315);
                        this._textRegion.addEventListener(WindowMouseEvent.OVER, this._Str_14217);
                        this._textRegion.addEventListener(WindowMouseEvent.OUT, this._Str_13749);
                    }
                    this._closeButton = (k.findChildByName("promo_close_icon") as IIconWindow);
                    if (this._closeButton)
                    {
                        this._closeButton.addEventListener(WindowMouseEvent.CLICK, this._Str_14359);
                        this._closeButton.addEventListener(WindowMouseEvent.OVER, this._Str_19522);
                        this._closeButton.addEventListener(WindowMouseEvent.OUT, this._Str_21414);
                    }
                    this._toolbar.extensionView.attachExtension(VIDEO_OFFER, k, ExtensionFixedSlotsEnum._Str_8642);
                }
            }
            return k;
        }

        private function _Str_2669():void
        {
            if (this._view)
            {
                if (this._textRegion)
                {
                    this._textRegion.removeEventListener(WindowMouseEvent.CLICK, this._Str_13315);
                    this._textRegion.removeEventListener(WindowMouseEvent.OVER, this._Str_14217);
                    this._textRegion.removeEventListener(WindowMouseEvent.OUT, this._Str_13749);
                    this._textRegion = null;
                }
                if (this._closeButton)
                {
                    this._closeButton.removeEventListener(WindowMouseEvent.CLICK, this._Str_14359);
                    this._closeButton.removeEventListener(WindowMouseEvent.OVER, this._Str_19522);
                    this._closeButton.removeEventListener(WindowMouseEvent.OUT, this._Str_21414);
                    this._closeButton = null;
                }
                this._view.dispose();
                this._view = null;
            }
        }

        public function dispose():void
        {
            if (this._toolbar == null)
            {
                return;
            }
            this._toolbar.extensionView.detachExtension(VIDEO_OFFER);
            this._Str_2669();
            this._toolbar = null;
        }

        private function _Str_14359(k:WindowMouseEvent):void
        {
            this._promoClosed = true;
            this._Str_2669();
            this._toolbar.connection.send(new EventLogMessageComposer("SuperSaverAds", "client_action", "supersaverads.video.promo.close_clicked"));
        }

        private function _Str_19522(k:WindowMouseEvent):void
        {
            if (this._closeButton)
            {
                this._closeButton.color = _Str_17848;
            }
        }

        private function _Str_21414(k:WindowMouseEvent):void
        {
            if (this._closeButton)
            {
                this._closeButton.color = _Str_16248;
            }
        }

        private function _Str_13315(k:WindowMouseEvent):void
        {
            if (!this._toolbar.catalog.videoOffers.launch(VideoOfferTypeEnum.CREDIT))
            {
                this._Str_2669();
            }
        }

        private function _Str_14217(k:WindowMouseEvent):void
        {
            var _local_2:ITextWindow;
            if (this._view)
            {
                _local_2 = (this._view.findChildByName("promo_text") as ITextWindow);
                _local_2.textColor = _Str_4030;
            }
        }

        private function _Str_13749(k:WindowMouseEvent):void
        {
            var _local_2:ITextWindow;
            if (this._view)
            {
                _local_2 = (this._view.findChildByName("promo_text") as ITextWindow);
                _local_2.textColor = _Str_4086;
            }
        }
    }
}
