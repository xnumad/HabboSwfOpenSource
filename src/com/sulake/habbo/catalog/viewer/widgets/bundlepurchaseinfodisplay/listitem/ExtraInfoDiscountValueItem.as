package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.UpdateableExtraInfoListItem;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.HabboCatalog;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.HabboCatalogUtils;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.BitmapDataAsset;

    public class ExtraInfoDiscountValueItem extends UpdateableExtraInfoListItem 
    {
        private static const ICON_SPLASH_BITMAP:String = "icon_splash_bitmap";
        private static const ICON_BITMAP:String = "icon_bitmap";
        private static const TOTAL_CURRENCY_VALUE_LEFT:String = "total_currency_value_left";
        private static const TOTAL_CURRENCY_ICON_LEFT:String = "total_currency_icon_left";
        private static const STRIKETROUGH_TOTAL_CURRENCY_LEFT:String = "striketrough_total_currency_left";
        private static const TOTAL_CURRENCY_VALUE_RIGHT:String = "total_currency_value_right";
        private static const TOTAL_CURRENCY_ICON_RIGHT:String = "total_currency_icon_right";
        private static const STRIKETROUGH_TOTAL_CURRENCY_RIGHT:String = "striketrough_total_currency_right";
        private static const DISCOUNT_CURRENCY_VALUE_LEFT:String = "discount_currency_value_left";
        private static const DISCOUNT_CURRENCY_ICON_LEFT:String = "discount_currency_icon_left";
        private static const DISCOUNT_CURRENCY_VALUE_RIGHT:String = "discount_currency_value_right";
        private static const DISCOUNT_CURRENCY_ICON_RIGHT:String = "discount_currency_icon_right";
        private static const STRIKETHROUGH_LEFT_MARGIN:int = 4;
        private static const STRIKETHROUGH_RIGHT_MARGIN:int = (16 + STRIKETHROUGH_LEFT_MARGIN);//20

        private var _window:IWindowContainer = null;
        private var _dirty:Boolean = true;
        private var _catalog:HabboCatalog;
        private var _starAnimationOffset:int = 0;
        private var _starAnimationTimer:Timer;
        private var _creditsOnLeft:Boolean;
        private var _creditsOnRight:Boolean;
        private var _noCredits:Boolean;
        private var _currencyIconsSet:Boolean = false;

        public function ExtraInfoDiscountValueItem(k:int, _arg_2:ExtraInfoItemData, _arg_3:HabboCatalog)
        {
            super(null, k, _arg_2, ALIGN_BOTTOM, true);
            this._catalog = _arg_3;
            this._starAnimationTimer = new Timer(150);
            this._starAnimationTimer.addEventListener(TimerEvent.TIMER, this.starAnimationTimerEvent);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (this._starAnimationTimer != null)
                {
                    this._starAnimationTimer.stop();
                    this._starAnimationTimer = null;
                }
                this._catalog = null;
                super.dispose();
            }
        }

        override public function update(k:ExtraInfoItemData):void
        {
            super.update(k);
            this._creditsOnLeft = false;
            this._creditsOnRight = false;
            this._noCredits = false;
            if (((k.priceCredits > 0) && (k.priceActivityPoints > 0)))
            {
                this._creditsOnLeft = true;
            }
            else
            {
                if (((k.priceActivityPoints > 0) && (k.priceCredits == 0)))
                {
                    this._noCredits = true;
                }
                else
                {
                    this._creditsOnRight = true;
                }
            }
            this._dirty = true;
            this.render();
            if (!this._currencyIconsSet)
            {
                this.setCurrencyIcons();
            }
        }

        override public function getRenderedWindow():IWindowContainer
        {
            if (this._dirty)
            {
                this.render();
            }
            return this._window;
        }

        private function createWindow():void
        {
            this._window = IWindowContainer(this._catalog.utils.createWindow("discountValueItem"));
            this.setElementBitmap(ICON_BITMAP, "thumb_up");
            this.startSplashAnimation();
        }

        private function render():void
        {
            if (this._window == null)
            {
                this.createWindow();
            }
            this.updateColumns();
            this.updatePriceIndicators();
            this.updateStrikeThroughElements();
            this._dirty = false;
        }

        private function updateColumns():void
        {
            if (((this._noCredits) || (this._creditsOnRight)))
            {
                this.setLeftColumnVisibility(false);
            }
            else
            {
                this.setLeftColumnVisibility(true);
            }
        }

        private function setCurrencyIcons():void
        {
            if (this._creditsOnLeft)
            {
                this.setIconStyle(TOTAL_CURRENCY_ICON_LEFT, -1);
                this.setIconStyle(DISCOUNT_CURRENCY_ICON_LEFT, -1);
            }
            if (this._creditsOnRight)
            {
                this.setIconStyle(TOTAL_CURRENCY_ICON_RIGHT, -1);
                this.setIconStyle(DISCOUNT_CURRENCY_ICON_RIGHT, -1);
            }
            else
            {
                this.setIconStyle(TOTAL_CURRENCY_ICON_RIGHT, data.activityPointType);
                this.setIconStyle(DISCOUNT_CURRENCY_ICON_RIGHT, data.activityPointType);
            }
            this._currencyIconsSet = true;
        }

        private function updatePriceIndicators():void
        {
            if (this._creditsOnLeft)
            {
                this.setElementText(TOTAL_CURRENCY_VALUE_LEFT, (data.quantity * data.priceCredits).toString());
                this.setElementText(DISCOUNT_CURRENCY_VALUE_LEFT, ((data.quantity * data.priceCredits) - data.discountPriceCredits).toString());
            }
            if (this._creditsOnRight)
            {
                this.setElementText(TOTAL_CURRENCY_VALUE_RIGHT, (data.quantity * data.priceCredits).toString());
                this.setElementText(DISCOUNT_CURRENCY_VALUE_RIGHT, ((data.quantity * data.priceCredits) - data.discountPriceCredits).toString());
            }
            else
            {
                this.setElementText(TOTAL_CURRENCY_VALUE_RIGHT, (data.quantity * data.priceActivityPoints).toString());
                this.setElementText(DISCOUNT_CURRENCY_VALUE_RIGHT, ((data.quantity * data.priceActivityPoints) - data.discountPriceActivityPoints).toString());
            }
        }

        private function updateStrikeThroughElements():void
        {
            var k:ITextWindow = ITextWindow(this._window.findChildByName(TOTAL_CURRENCY_VALUE_LEFT));
            var _local_2:int = ((k.x + k.width) - k.textWidth);
            var _local_3:IWindowContainer = IWindowContainer(this._window.findChildByName(STRIKETROUGH_TOTAL_CURRENCY_LEFT));
            _local_3.x = (_local_2 - STRIKETHROUGH_LEFT_MARGIN);
            _local_3.width = ((STRIKETHROUGH_LEFT_MARGIN + k.textWidth) + STRIKETHROUGH_RIGHT_MARGIN);
            var _local_4:ITextWindow = ITextWindow(this._window.findChildByName(TOTAL_CURRENCY_VALUE_RIGHT));
            var _local_5:int = ((_local_4.x + _local_4.width) - _local_4.textWidth);
            var _local_6:IWindowContainer = IWindowContainer(this._window.findChildByName(STRIKETROUGH_TOTAL_CURRENCY_RIGHT));
            _local_6.x = (_local_5 - STRIKETHROUGH_LEFT_MARGIN);
            _local_6.width = ((STRIKETHROUGH_LEFT_MARGIN + _local_4.textWidth) + STRIKETHROUGH_RIGHT_MARGIN);
        }

        private function setElementText(k:String, _arg_2:String):void
        {
            this._window.findChildByName(k).caption = _arg_2;
        }

        private function setElementBitmap(k:String, _arg_2:String):void
        {
            var _local_3:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName(k));
            var _local_4:BitmapData = BitmapData(this._catalog.assets.getAssetByName(_arg_2).content);
            HabboCatalogUtils._Str_14396(_local_3, _local_4);
        }

        private function setIconStyle(k:String, _arg_2:int):void
        {
            var _local_3:IWindow = this._window.findChildByName(k);
            _local_3.style = ActivityPointTypeEnum.getIconStyleFor(_arg_2, this._catalog, false);
        }

        private function setLeftColumnVisibility(k:Boolean):void
        {
            var _local_3:String;
            var _local_2:Array = [DISCOUNT_CURRENCY_ICON_LEFT, DISCOUNT_CURRENCY_VALUE_LEFT, TOTAL_CURRENCY_ICON_LEFT, STRIKETROUGH_TOTAL_CURRENCY_LEFT, TOTAL_CURRENCY_VALUE_LEFT];
            for each (_local_3 in _local_2)
            {
                this._window.findChildByName(_local_3).visible = k;
            }
        }

        private function startSplashAnimation():void
        {
            var k:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName(ICON_SPLASH_BITMAP));
            k.bitmap = new BitmapData(k.width, k.height, true, 0);
            this.starAnimationTimerEvent(new TimerEvent(TimerEvent.TIMER));
            this._starAnimationTimer.start();
        }

        private function starAnimationTimerEvent(k:TimerEvent):void
        {
            var _local_2:IBitmapWrapperWindow;
            var _local_3:IAsset;
            if (this._window != null)
            {
                _local_2 = IBitmapWrapperWindow(this._window.findChildByName(ICON_SPLASH_BITMAP));
                _local_3 = this._catalog.assets.getAssetByName(("bundle_discount_star_" + this._starAnimationOffset));
                HabboCatalogUtils._Str_14396(_local_2, BitmapData(_local_3.content), BitmapDataAsset(_local_3).rectangle);
                if (++this._starAnimationOffset > 7)
                {
                    this._starAnimationOffset = 0;
                }
            }
        }
    }
}

