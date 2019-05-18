package com.sulake.habbo.toolbar.extensions
{
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.utils.Timer;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing._Str_63._Str_7218;
    import flash.events.TimerEvent;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.core.window.components.IIconWindow;

    public class ClubDiscountPromoExtension 
    {
        private static const CLUB_PROMO:String = "club_promo";
        private static const _Str_3830:int = 14;
        private static const _Str_4086:uint = 0xFFFFFF;
        private static const _Str_4030:uint = 12247545;

        private var _toolbar:HabboToolbar;
        private var _view:IWindowContainer;
        private var _disposed:Boolean = false;
        private var _animElement:IBitmapWrapperWindow;
        private var _animTimer:Timer;
        private var _animTickCount:int = 0;
        private var _animBlockMoveAmount:int;
        private var _triggerTimer:Timer;
        private var _animBitmap:BitmapData;
        private var _expirationTimer:Timer;

        public function ClubDiscountPromoExtension(k:HabboToolbar)
        {
            this._toolbar = k;
        }

        private function createWindow():IWindowContainer
        {
            var _local_3:IRegionWindow;
            var _local_4:IAsset;
            var k:IWindowContainer;
            var _local_2:XmlAsset = (this._toolbar.assets.getAssetByName("club_discount_promotion_xml") as XmlAsset);
            if (_local_2)
            {
                k = (this._toolbar.windowManager.buildFromXML((_local_2.content as XML), 1) as IWindowContainer);
                if (k)
                {
                    this._animElement = (k.findChildByName("flashing_animation") as IBitmapWrapperWindow);
                    if (this._animElement)
                    {
                        _local_4 = (this._toolbar.assets.getAssetByName("extend_hilite_png") as IAsset);
                        if (_local_4)
                        {
                            this._animBitmap = (_local_4.content as BitmapData);
                            if (this._animBitmap)
                            {
                                this._animElement.bitmap = this._animBitmap.clone();
                            }
                        }
                        this._animElement.visible = false;
                    }
                    _local_3 = (k.findChildByName("text_region") as IRegionWindow);
                    if (_local_3)
                    {
                        _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_13315);
                        _local_3.addEventListener(WindowMouseEvent.OVER, this._Str_14217);
                        _local_3.addEventListener(WindowMouseEvent.OUT, this._Str_13749);
                    }
                    this._Str_6881();
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
                this._animElement = null;
            }
            this.animate(false);
            this._Str_10712();
        }

        public function dispose():void
        {
            if (((this._disposed) || (!(this._toolbar))))
            {
                return;
            }
            if (this._toolbar.extensionView)
            {
                this._toolbar.extensionView.detachExtension(CLUB_PROMO);
            }
            this._Str_9128();
            this._Str_2669();
            this._toolbar = null;
            this._disposed = true;
        }

        private function _Str_13315(k:WindowMouseEvent):void
        {
            if (this._toolbar.inventory.clubLevel == HabboClubLevelEnum._Str_2575)
            {
                this._toolbar.connection.send(new EventLogMessageComposer("DiscountPromo", "discount", "client.club.extend.discount.clicked"));
                this._toolbar.connection.send(new _Str_7218());
            }
        }

        private function _Str_6881():void
        {
            switch (this._toolbar.inventory.clubLevel)
            {
                case HabboClubLevelEnum._Str_3159:
                    this._Str_2497("${discount.bar.no.club.promo}");
                    this._Str_5997(_Str_3830);
                    break;
                case HabboClubLevelEnum._Str_2575:
                    this._Str_2497("${discount.bar.vip.expiring}");
                    this._Str_5997(_Str_3830);
                    break;
            }
            this.animate(true);
        }

        public function _Str_5219(k:HabboInventoryHabboClubEvent):void
        {
            if ((((this._toolbar.inventory._Str_6682) && (!(this._view))) && (this._Str_17305())))
            {
                this._view = this.createWindow();
                if (this._expirationTimer != null)
                {
                    this._Str_10712();
                }
                if (((this._toolbar.inventory._Str_6338 < 1440) && (this._toolbar.inventory._Str_6338 > 0)))
                {
                    this._expirationTimer = new Timer(((this._toolbar.inventory._Str_6338 * 60) * 1000), 1);
                    this._expirationTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_12398);
                    this._expirationTimer.start();
                }
                this._Str_6881();
                this._toolbar.extensionView.attachExtension(CLUB_PROMO, this._view, ExtensionFixedSlotsEnum._Str_8642);
            }
            else
            {
                this._toolbar.extensionView.detachExtension(CLUB_PROMO);
                this._Str_2669();
            }
        }

        private function _Str_10712():void
        {
            if (this._expirationTimer)
            {
                this._expirationTimer.stop();
                this._expirationTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_12398);
                this._expirationTimer = null;
            }
        }

        private function _Str_12398(k:TimerEvent):void
        {
            this._toolbar.extensionView.detachExtension(CLUB_PROMO);
            this._Str_2669();
        }

        private function _Str_17305():Boolean
        {
            if (((this._toolbar.inventory.clubLevel == HabboClubLevelEnum._Str_2575) && (this._toolbar.getBoolean("club.membership.extend.vip.promotion.enabled"))))
            {
                return true;
            }
            return false;
        }

        private function _Str_2497(k:String):void
        {
            var _local_2:ITextWindow;
            var _local_3:ITextWindow;
            if (this._view)
            {
                _local_2 = (this._view.findChildByName("promo_text") as ITextWindow);
                _local_3 = (this._view.findChildByName("promo_text_shadow") as ITextWindow);
                if (_local_2)
                {
                    _local_2.text = k;
                }
                if (_local_3)
                {
                    _local_3.text = k;
                }
            }
        }

        private function animate(k:Boolean):void
        {
            if (k)
            {
                Logger.log("Animate window");
                if (this._triggerTimer)
                {
                    this._triggerTimer.stop();
                }
                this._triggerTimer = new Timer(15000);
                this._triggerTimer.addEventListener(TimerEvent.TIMER, this._Str_23307);
                this._triggerTimer.start();
            }
            else
            {
                if (this._triggerTimer)
                {
                    this._triggerTimer.stop();
                    this._triggerTimer = null;
                }
                this._Str_9128();
            }
        }

        private function _Str_9128():void
        {
            if (this._animElement)
            {
                this._animElement.visible = false;
                this._animElement.bitmap = null;
                this._animElement = null;
                this._view.invalidate();
                if (this._animTimer)
                {
                    this._animTimer.stop();
                    this._animTimer = null;
                }
            }
        }

        private function _Str_23307(k:TimerEvent):void
        {
            if (this._animElement)
            {
                if (this._animElement.context)
                {
                    this._animElement.visible = true;
                    this._Str_22649();
                    this._Str_25483();
                }
            }
        }

        private function _Str_22649():void
        {
            this._animElement.x = 3;
            this._animElement.y = 3;
            this._animElement.bitmap = this._animBitmap.clone();
            this._animElement.height = (this._view.height - 6);
            this._animElement.width = this._animElement.bitmap.width;
            this._animElement.invalidate();
            this._animBlockMoveAmount = ((this._view.width - 7) - this._animElement.bitmap.width);
            this._animTickCount = 0;
        }

        private function _Str_25483():void
        {
            this._animTimer = new Timer(25, 26);
            this._animTimer.addEventListener(TimerEvent.TIMER, this._Str_14894);
            this._animTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_17342);
            this._animTimer.start();
        }

        private function _Str_14894(k:TimerEvent):void
        {
            var _local_2:int;
            var _local_3:BitmapData;
            this._animElement.x = (3 + ((this._animTickCount / 20) * this._animBlockMoveAmount));
            if (this._animElement.x > this._animBlockMoveAmount)
            {
                _local_2 = ((this._view.width - 4) - this._animElement.x);
                _local_3 = new BitmapData(_local_2, this._animBitmap.height);
                _local_3.copyPixels(this._animBitmap, new Rectangle(0, 0, _local_2, this._animBitmap.height), new Point(0, 0));
                this._animElement.bitmap = _local_3;
                this._animElement.width = _local_2;
            }
            this._animElement.invalidate();
            this._animTickCount++;
        }

        private function _Str_17342(k:TimerEvent):void
        {
            this._Str_9128();
        }

        private function _Str_5997(k:int):void
        {
            var _local_2:IIconWindow;
            if (this._view)
            {
                _local_2 = (this._view.findChildByName("club_icon") as IIconWindow);
                if (_local_2)
                {
                    _local_2.style = k;
                    _local_2.invalidate();
                }
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






