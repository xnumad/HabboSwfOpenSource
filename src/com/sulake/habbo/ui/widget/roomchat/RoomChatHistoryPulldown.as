package com.sulake.habbo.ui.widget.roomchat
{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum.HabboWindowStyle;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
    import flash.geom.Point;
	import com.sulake.core.window.enum.WindowParam;

    public class RoomChatHistoryPulldown 
    {
        public static const STATE_FADE_OUT:int = 3;
        public static const STATE_FADE_IN:int = 2;
        public static const STATE_VISIBLE:int = 1;
        public static const STATE_HIDDEN:int = 0;
        public static const PULLDOWN_WINDOW_HEIGHT:int = 39;
        private static const FADE_OUT_MS:int = 150;
        private static const FADE_IN_MS:int = 250;

        private var _widget:RoomChatWidget;
        private var _windowManager:IHabboWindowManager;
        private var _window:IWindowContainer;
        private var _bgWindow:IBitmapWrapperWindow;
        private var _containerWindow:IWindowContainer;
        private var _region:IRegionWindow;
        private var _assetLibrary:IAssetLibrary;
        private var _lastWidth:int = 0;
        private var _state:int = -1;
        private var _grabBarBgBmp:BitmapData;
        private var _grabBarGripBmp:BitmapData;
        private var _grabBarHandleBmp:BitmapData;
        private var _grabBarXBmp:BitmapData;
        private var _grabBarXOverBmp:BitmapData;
        private var _grabBarXPressedBmp:BitmapData;
        private var _chatHistoryBgBmp:BitmapData;
        private var _regionRightMargin:int = 30;

        public function RoomChatHistoryPulldown(k:RoomChatWidget, _arg_2:IHabboWindowManager, _arg_3:IWindowContainer, _arg_4:IAssetLibrary)
        {
            this._widget = k;
            this._windowManager = _arg_2;
            this._assetLibrary = _arg_4;
            this._containerWindow = _arg_3;
            this._grabBarBgBmp = ((this._assetLibrary.getAssetByName("chat_grapbar_bg") as BitmapDataAsset).content as BitmapData);
            this._grabBarGripBmp = ((this._assetLibrary.getAssetByName("chat_grapbar_grip") as BitmapDataAsset).content as BitmapData);
            this._grabBarHandleBmp = ((this._assetLibrary.getAssetByName("chat_grapbar_handle") as BitmapDataAsset).content as BitmapData);
            this._grabBarXBmp = ((this._assetLibrary.getAssetByName("chat_grapbar_x") as BitmapDataAsset).content as BitmapData);
            this._grabBarXOverBmp = ((this._assetLibrary.getAssetByName("chat_grapbar_x_hi") as BitmapDataAsset).content as BitmapData);
            this._grabBarXPressedBmp = ((this._assetLibrary.getAssetByName("chat_grapbar_x_pr") as BitmapDataAsset).content as BitmapData);
            this._chatHistoryBgBmp = ((this._assetLibrary.getAssetByName("chat_history_bg") as BitmapDataAsset).content as BitmapData);
            this._bgWindow = (this._windowManager.createWindow("chat_history_bg", "", WindowType.WINDOW_TYPE_BITMAP_WRAPPER, HabboWindowStyle.DEFAULT, WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT, new Rectangle(0, 0, _arg_3.width, (_arg_3.height - PULLDOWN_WINDOW_HEIGHT)), null, 0, 0) as IBitmapWrapperWindow);
            this._containerWindow.addChild(this._bgWindow);
            this._window = (this._windowManager.createWindow("chat_pulldown", "", WindowType.WINDOW_TYPE_CONTAINER, HabboWindowStyle.DEFAULT, (WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR | WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT), new Rectangle(0, (this._containerWindow.height - PULLDOWN_WINDOW_HEIGHT), _arg_3.width, PULLDOWN_WINDOW_HEIGHT), null, 0) as IWindowContainer);
            this._containerWindow.addChild(this._window);
            this._region = (this._windowManager.createWindow("REGIONchat_pulldown", "", WindowType.WINDOW_TYPE_REGION, HabboWindowStyle.NULL, (((WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR | WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT) | WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED) | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_FIXED), new Rectangle(0, 0, _arg_3.width, (_arg_3.height - PULLDOWN_WINDOW_HEIGHT)), null, 0) as IRegionWindow);
            if (this._region != null)
            {
                this._region.background = true;
                this._region.mouseThreshold = 0;
                this._region.addEventListener(WindowMouseEvent.DOWN, this.onPulldownMouseDown);
                this._containerWindow.addChild(this._region);
                this._region.toolTipCaption = "${chat.history.drag.tooltip}";
                this._region._Str_3099 = 250;
            }
            var _local_5:XmlAsset = (_arg_4.getAssetByName("chat_history_pulldown") as XmlAsset);
            this._window.buildFromXML((_local_5.content as XML));
            this._window.addEventListener(WindowMouseEvent.DOWN, this.onPulldownMouseDown);
            var _local_6:IBitmapWrapperWindow = (this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow);
            if (_local_6 != null)
            {
                _local_6.mouseThreshold = 0;
                _local_6.addEventListener(WindowMouseEvent.CLICK, this.onCloseButtonClicked);
                _local_6.addEventListener(WindowMouseEvent.UP, this.onCloseButtonMouseUp);
                _local_6.addEventListener(WindowMouseEvent.DOWN, this.onCloseButtonMouseDown);
                _local_6.addEventListener(WindowMouseEvent.OVER, this.onCloseButtonMouseOver);
                _local_6.addEventListener(WindowMouseEvent.OUT, this.onCloseButtonMouseOut);
            }
            this._window.background = true;
            this._window.color = 0;
            this._window.mouseThreshold = 0;
            this.state = STATE_HIDDEN;
            this.buildWindowGraphics();
        }

        public function dispose():void
        {
            if (this._region != null)
            {
                this._region.dispose();
                this._region = null;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._bgWindow != null)
            {
                this._bgWindow.dispose();
                this._bgWindow = null;
            }
        }

        public function update(k:uint):void
        {
            switch (this.state)
            {
                case STATE_FADE_IN:
                    this._bgWindow.blend = (this._bgWindow.blend + (k / FADE_IN_MS));
                    this._window.blend = (this._window.blend + (k / FADE_IN_MS));
                    if (this._window.blend >= 1)
                    {
                        this.state = STATE_VISIBLE;
                    }
                    return;
                case STATE_FADE_OUT:
                    this._bgWindow.blend = (this._bgWindow.blend - (k / FADE_OUT_MS));
                    this._window.blend = (this._window.blend - (k / FADE_OUT_MS));
                    if (this._window.blend <= 0)
                    {
                        this.state = STATE_HIDDEN;
                    }
                    return;
            }
        }

        public function set state(k:int):void
        {
            if (k == this._state)
            {
                return;
            }
            switch (k)
            {
                case STATE_VISIBLE:
                    if (this._state == STATE_HIDDEN)
                    {
                        this.state = STATE_FADE_IN;
                    }
                    else
                    {
                        if (((this._window == null) || (this._bgWindow == null)))
                        {
                            return;
                        }
                        this._window.visible = true;
                        this._bgWindow.visible = true;
                        this._region.visible = true;
                        this._state = k;
                    }
                    return;
                case STATE_HIDDEN:
                    if (((this._window == null) || (this._bgWindow == null)))
                    {
                        return;
                    }
                    this._window.visible = false;
                    this._bgWindow.visible = false;
                    this._region.visible = false;
                    this._state = k;
                    return;
                case STATE_FADE_IN:
                    if (((this._window == null) || (this._bgWindow == null)))
                    {
                        return;
                    }
                    this._window.blend = 0;
                    this._bgWindow.blend = 0;
                    this._window.visible = true;
                    this._bgWindow.visible = true;
                    this._state = k;
                    return;
                case STATE_FADE_OUT:
                    if (((this._window == null) || (this._bgWindow == null)))
                    {
                        return;
                    }
                    this._window.blend = 1;
                    this._bgWindow.blend = 1;
                    this._state = k;
                    return;
            }
        }

        public function get state():int
        {
            return this._state;
        }

        public function containerResized(k:Rectangle):void
        {
            if (this._window != null)
            {
                this._window.x = 0;
                this._window.y = (this._containerWindow.height - PULLDOWN_WINDOW_HEIGHT);
                this._window.width = this._containerWindow.width;
            }
            if (this._region != null)
            {
                this._region.x = 0;
                this._region.y = (this._containerWindow.height - PULLDOWN_WINDOW_HEIGHT);
                this._region.width = (this._containerWindow.width - this._regionRightMargin);
            }
            if (this._bgWindow != null)
            {
                this._bgWindow.rectangle = this._containerWindow.rectangle;
                this._bgWindow.height = (this._bgWindow.height - PULLDOWN_WINDOW_HEIGHT);
            }
            this.buildWindowGraphics();
        }

        private function buildWindowGraphics():void
        {
            var width:int;
            var height:int;
            var state:int;
            var destBgBitmap:BitmapData;
            var destGripLBitmap:BitmapData;
            var destGripRBitmap:BitmapData;
            if (this._window == null)
            {
                return;
            }
            if (this._lastWidth == this._window.width)
            {
                return;
            }
            this._lastWidth = this._window.width;
            var barBg:IBitmapWrapperWindow = (this._window.findChildByName("grapBarBg") as IBitmapWrapperWindow);
            var barX:IBitmapWrapperWindow = (this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow);
            var barGripL:IBitmapWrapperWindow = (this._window.findChildByName("grapBarGripL") as IBitmapWrapperWindow);
            var barGripR:IBitmapWrapperWindow = (this._window.findChildByName("grapBarGripR") as IBitmapWrapperWindow);
            var barHandle:IBitmapWrapperWindow = (this._window.findChildByName("grapBarHandle") as IBitmapWrapperWindow);
            var gripMargin:int = 5;
            if (((!(barX == null)) && (!(barHandle == null))))
            {
                barHandle.bitmap = this._grabBarHandleBmp;
                barHandle.disposesBitmap = false;
                barX.bitmap = this._grabBarXBmp;
                barX.disposesBitmap = false;
                this._regionRightMargin = (this._window.width - barX.x);
            }
            barGripL.width = (barHandle.x - gripMargin);
            barGripL.x = 0;
            barGripR.x = ((barHandle.x + barHandle.width) + gripMargin);
            barGripR.width = ((barX.x - gripMargin) - barGripR.x);
            if (barGripL.width < 0)
            {
                barGripL.width = 0;
            }
            if (barGripR.width < 0)
            {
                barGripR.width = 0;
            }
            state = 0;
            if ((((!(barBg == null)) && (!(barGripL == null))) && (!(barGripR == null))))
            {
                try
                {
                    state = 1;
                    width = barBg.width;
                    height = barBg.height;
                    if (((width > 0) && (height > 0)))
                    {
                        destBgBitmap = new TrackedBitmapData(this, width, height);
                        this.tileBitmapHorz(this._grabBarBgBmp, destBgBitmap);
                        barBg.disposesBitmap = true;
                        barBg.bitmap = destBgBitmap;
                    }
                    state = 2;
                    width = barGripL.width;
                    height = barGripL.height;
                    if (((width > 0) && (height > 0)))
                    {
                        destGripLBitmap = new TrackedBitmapData(this, width, height);
                        this.tileBitmapHorz(this._grabBarGripBmp, destGripLBitmap);
                        barGripL.disposesBitmap = true;
                        barGripL.bitmap = destGripLBitmap;
                    }
                    state = 3;
                    width = barGripR.width;
                    height = barGripR.height;
                    if (((width > 0) && (height > 0)))
                    {
                        destGripRBitmap = new TrackedBitmapData(this, width, height);
                        this.tileBitmapHorz(this._grabBarGripBmp, destGripRBitmap);
                        barGripR.disposesBitmap = true;
                        barGripR.bitmap = destGripRBitmap;
                    }
                }
                catch(e:Error)
                {
                    throw (new Error(((((((e.message + " width:") + width) + " height:") + height) + " state:") + state), e.errorID));
                }
            }
            if (this._bgWindow == null)
            {
                return;
            }
            this._bgWindow.bitmap = this._chatHistoryBgBmp;
            this._bgWindow.disposesBitmap = false;
        }

        private function tileBitmapHorz(k:BitmapData, _arg_2:BitmapData):void
        {
            var _local_3:int = (_arg_2.width / k.width);
            var _local_4:Point = new Point();
            var _local_5:int;
            while (_local_5 < (_local_3 + 1))
            {
                _local_4.x = (_local_5 * k.width);
                _arg_2.copyPixels(k, k.rect, _local_4);
                _local_5++;
            }
        }

        private function onPulldownMouseDown(k:WindowMouseEvent):void
        {
            if (this._widget != null)
            {
                this._widget.onPulldownMouseDown(k);
            }
        }

        private function onCloseButtonClicked(k:WindowMouseEvent):void
        {
            if (this._widget != null)
            {
                this._widget._Str_24607(k);
            }
        }

        private function onCloseButtonMouseOver(k:WindowMouseEvent):void
        {
            if (this._window == null)
            {
                return;
            }
            if (!this._window.visible)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                _local_2.disposesBitmap = false;
                _local_2.bitmap = this._grabBarXOverBmp;
            }
        }

        private function onCloseButtonMouseOut(k:WindowMouseEvent):void
        {
            if (this._window == null)
            {
                return;
            }
            if (!this._window.visible)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                _local_2.disposesBitmap = false;
                _local_2.bitmap = this._grabBarXBmp;
            }
        }

        private function onCloseButtonMouseDown(k:WindowMouseEvent):void
        {
            if (this._window == null)
            {
                return;
            }
            if (!this._window.visible)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                _local_2.disposesBitmap = false;
                _local_2.bitmap = this._grabBarXPressedBmp;
            }
        }

        private function onCloseButtonMouseUp(k:WindowMouseEvent):void
        {
            if (this._window == null)
            {
                return;
            }
            if (!this._window.visible)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                _local_2.disposesBitmap = false;
                _local_2.bitmap = this._grabBarXOverBmp;
            }
        }
    }
}
