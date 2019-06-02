package com.sulake.habbo.inventory
{
    import flash.utils.Timer;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.inventory.trading.TradingModel;
    import com.sulake.habbo.window.IHabboWindowManager;
    import flash.events.TimerEvent;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.window.widgets._Str_3338;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import org.openvideoads.util.StringUtils;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.habbo.room.IStuffData;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import adobe.serialization.json.JSONDecoder;
    import com.sulake.core.assets.loaders.BitmapFileLoader;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.display.DisplayObject;
    import flash.geom.Matrix;
    import com.sulake.core.window.components.*;

    public class ItemPopupCtrl 
    {
        public static const _Str_13336:int = 1;
        public static const _Str_9535:int = 2;
        private static const _Str_13845:int = -5;
        private static const _Str_18361:int = 250;
        private static const _Str_16920:int = 100;
        private static const _Str_11047:int = 180;
        private static const _Str_13158:int = 200;

        private var _openDelayTimer:Timer;
        private var _hideDelayTimer:Timer;
        private var _assets:IAssetLibrary;
        private var _popupWindow:IWindowContainer;
        private var _parent:IWindowContainer;
        private var _preferredLocation:int = 2;
        private var _arrowImgLeft:BitmapData;
        private var _arrowImgRight:BitmapData;
        private var _tradingModel:TradingModel;
        private var _windowManager:IHabboWindowManager;
        private var _expectingExtImage:Boolean = false;

        public function ItemPopupCtrl(k:IWindowContainer, _arg_2:IAssetLibrary, _arg_3:IHabboWindowManager, _arg_4:TradingModel)
        {
            this._openDelayTimer = new Timer(_Str_18361, 1);
            this._hideDelayTimer = new Timer(_Str_16920, 1);
            super();
            if (((k == null) || (_arg_2 == null)))
            {
                throw (new Error("Null pointers passed as argument!"));
            }
            this._popupWindow = k;
            this._popupWindow.visible = false;
            this._assets = _arg_2;
            this._windowManager = _arg_3;
            this._openDelayTimer.addEventListener(TimerEvent.TIMER, this._Str_10545);
            this._hideDelayTimer.addEventListener(TimerEvent.TIMER, this._Str_6823);
            this._tradingModel = _arg_4;
            var _local_5:BitmapDataAsset = (this._assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset);
            if (((!(_local_5 == null)) && (!(_local_5.content == null))))
            {
                this._arrowImgRight = (_local_5.content as BitmapData);
            }
            _local_5 = (this._assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset);
            if (((!(_local_5 == null)) && (!(_local_5.content == null))))
            {
                this._arrowImgLeft = (_local_5.content as BitmapData);
            }
        }

        public function dispose():void
        {
            if (this._openDelayTimer != null)
            {
                this._openDelayTimer.removeEventListener(TimerEvent.TIMER, this._Str_10545);
                this._openDelayTimer.stop();
                this._openDelayTimer = null;
            }
            if (this._hideDelayTimer != null)
            {
                this._hideDelayTimer.removeEventListener(TimerEvent.TIMER, this._Str_6823);
                this._hideDelayTimer.stop();
                this._hideDelayTimer = null;
            }
            this._assets = null;
            this._popupWindow = null;
            this._parent = null;
            this._arrowImgLeft = null;
            this._arrowImgRight = null;
        }

        public function _Str_17992(k:IWindowContainer, _arg_2:String, _arg_3:BitmapData, _arg_4:IStuffData=null, _arg_5:int=2, _arg_6:Boolean=false):void
        {
            var _local_10:BitmapData;
            var _local_11:String;
            var _local_12:String;
            var _local_13:String;
            var _local_14:_Str_3338;
            if (this._popupWindow == null)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            if (_arg_3 == null)
            {
                _arg_3 = new BitmapData(1, 1, true, 0xFFFFFF);
            }
            if (this._parent != null)
            {
                this._parent.removeChild(this._popupWindow);
            }
            this._parent = k;
            this._preferredLocation = _arg_5;
            this._expectingExtImage = false;
            var _local_7:ITextWindow = ITextWindow(this._popupWindow.findChildByName("item_name_text"));
            if (_local_7)
            {
                _local_7.text = _arg_2;
            }
            var _local_8:IWidgetWindow = IWidgetWindow(this._popupWindow.findChildByName("unique_item_overlay_widget"));
            var _local_9:IBitmapWrapperWindow = (this._popupWindow.findChildByName("item_image") as IBitmapWrapperWindow);
            if (_local_9)
            {
                if (((_arg_6) && (this._tradingModel)))
                {
                    _local_8.visible = false;
                    _local_9.bitmap = new BitmapData(1, 1, true, 0xFFFFFF);
                    if (_arg_4 != null)
                    {
                        this._expectingExtImage = true;
                        _local_11 = _arg_4.getJSONValue("id");
                        if (!StringUtils.isEmpty(_local_11))
                        {
                            this._Str_17989(_local_11);
                        }
                        else
                        {
                            _local_12 = _arg_4.getJSONValue("w");
                            if (!StringUtils.isEmpty(_local_12))
                            {
                                _local_13 = (this._tradingModel._Str_8308().getProperty("stories.image_url_base") + _local_12);
                                this._Str_19468(_local_13);
                            }
                        }
                    }
                    return;
                }
                _local_10 = new BitmapData(Math.min(_Str_11047, _arg_3.width), Math.min(_Str_13158, _arg_3.height), true, 0xFFFFFF);
                _local_10.copyPixels(_arg_3, new Rectangle(0, 0, _local_10.width, _local_10.height), new Point(0, 0), null, null, true);
                _local_9.bitmap = _local_10;
                _local_9.width = _local_9.bitmap.width;
                _local_9.height = _local_9.bitmap.height;
                _local_9.x = ((this._popupWindow.width - _local_9.width) / 2);
                this._popupWindow.height = (_local_9.bottom + 10);
            }
            if (((!(_arg_4 == null)) && (_arg_4.uniqueSerialNumber > 0)))
            {
                _local_14 = _Str_3338(_local_8.widget);
                _local_14._Str_3442 = _arg_4.uniqueSerialNumber;
                _local_14._Str_4345 = _arg_4._Str_5330;
            }
            else
            {
                _local_8.visible = false;
            }
        }

        private function _Str_17989(k:String):void
        {
            var _local_2:String = (this._tradingModel._Str_8308().getProperty("extra_data_service_url") + k);
            var _local_3:URLLoader = new URLLoader(new URLRequest(_local_2));
            _local_3.addEventListener(Event.COMPLETE, this._Str_12417);
        }

        private function _Str_12417(k:Event):void
        {
            var _local_3:Object;
            var _local_2:String = URLLoader(k.target).data;
            if (((this._expectingExtImage) && (!(StringUtils.isEmpty(_local_2)))))
            {
                try
                {
                    _local_3 = new JSONDecoder(_local_2, false).getValue();
                    this._Str_19468(_local_3.url);
                }
                catch(error:Error)
                {
                }
            }
        }

        private function _Str_19468(k:String):void
        {
            var _local_2:BitmapFileLoader;
            if (!StringUtils.isEmpty(k))
            {
                _local_2 = new BitmapFileLoader("image/png", new URLRequest(k));
                _local_2.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_23616);
            }
        }

        private function _Str_23616(k:AssetLoaderEvent):void
        {
            if (((!(this._popupWindow)) || (!(this._expectingExtImage))))
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._popupWindow.findChildByName("item_image") as IBitmapWrapperWindow);
            if (((!(_local_2)) || (this._assets == null)))
            {
                return;
            }
            var _local_3:DisplayObject = (BitmapFileLoader(k.target).content as DisplayObject);
            var _local_4:BitmapData = new BitmapData(Math.min(_Str_11047, _local_3.width), Math.min(_Str_13158, _local_3.height), true, 0xFFFFFF);
            var _local_5:Number = (_Str_11047 / _local_3.width);
            var _local_6:Matrix = new Matrix();
            _local_6.scale(_local_5, _local_5);
            _local_4.draw(_local_3, _local_6);
            _local_2.bitmap = _local_4;
            _local_2.width = _local_2.bitmap.width;
            _local_2.height = _local_2.bitmap.height;
            _local_2.x = ((this._popupWindow.width - _local_2.width) / 2);
            this._popupWindow.height = (_local_2.bottom + 10);
        }

        public function show():void
        {
            this._hideDelayTimer.reset();
            this._openDelayTimer.reset();
            if (this._parent == null)
            {
                return;
            }
            this._popupWindow.visible = true;
            this._parent.addChild(this._popupWindow);
            this._Str_22732(this._preferredLocation);
            switch (this._preferredLocation)
            {
                case _Str_13336:
                    this._popupWindow.x = ((-1 * this._popupWindow.width) - _Str_13845);
                    break;
                case _Str_9535:
                    this._popupWindow.x = (this._parent.width + _Str_13845);
                    break;
            }
            this._popupWindow.y = ((this._parent.height - this._popupWindow.height) / 2);
        }

        public function hide():void
        {
            this._popupWindow.visible = false;
            this._hideDelayTimer.reset();
            this._openDelayTimer.reset();
            if (this._parent != null)
            {
                this._parent.removeChild(this._popupWindow);
            }
        }

        public function _Str_26396():void
        {
            this._hideDelayTimer.reset();
            this._openDelayTimer.reset();
            this._openDelayTimer.start();
        }

        public function _Str_14093():void
        {
            this._hideDelayTimer.reset();
            this._openDelayTimer.reset();
            this._hideDelayTimer.start();
        }

        private function _Str_22732(k:int=2):void
        {
            if (((this._popupWindow == null) || (this._popupWindow.disposed)))
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(this._popupWindow.findChildByName("arrow_pointer"));
            if (!_local_2)
            {
                return;
            }
            switch (k)
            {
                case _Str_13336:
                    _local_2.bitmap = this._arrowImgRight.clone();
                    _local_2.width = this._arrowImgRight.width;
                    _local_2.height = this._arrowImgRight.height;
                    _local_2.y = ((this._popupWindow.height - this._arrowImgRight.height) / 2);
                    _local_2.x = (this._popupWindow.width - 1);
                    break;
                case _Str_9535:
                    _local_2.bitmap = this._arrowImgLeft.clone();
                    _local_2.width = this._arrowImgLeft.width;
                    _local_2.height = this._arrowImgLeft.height;
                    _local_2.y = ((this._popupWindow.height - this._arrowImgLeft.height) / 2);
                    _local_2.x = ((-1 * this._arrowImgLeft.width) + 1);
                    break;
            }
            _local_2.invalidate();
        }

        private function _Str_10545(k:TimerEvent):void
        {
            this.show();
        }

        private function _Str_6823(k:TimerEvent):void
        {
            this.hide();
        }
    }
}
