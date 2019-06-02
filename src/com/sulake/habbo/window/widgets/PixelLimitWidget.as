package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.IBitmapDataContainer;
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class PixelLimitWidget implements _Str_17266 
    {
        public static const PIXEL_LIMIT:String = "pixel_limit";
        private static const _Str_15462:String = (PIXEL_LIMIT + ":limit");
        private static const _Str_12653:PropertyStruct = new PropertyStruct(_Str_15462, 0, PropertyStruct.STRING, false, null);

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _refreshing:Boolean;
        private var _root:IWindowContainer;
        private var _bitmap:IStaticBitmapWrapperWindow;
        private var _region:IRegionWindow;
        private var _limit:int;

        public function PixelLimitWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._limit = int(_Str_12653.value);
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("badge_image_xml").content as XML)) as IWindowContainer);
            this._bitmap = (this._root.findChildByName("bitmap") as IStaticBitmapWrapperWindow);
            this._widgetWindow._Str_2429 = this._root;
            this._root.width = this._widgetWindow.width;
            this._root.height = this._widgetWindow.height;
        }

        public function get limit():int
        {
            return this._limit;
        }

        public function set limit(k:int):void
        {
            this._limit = Math.max(0, Math.min(100, k));
            this.refresh();
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._region != null)
                {
                    this._region.removeEventListener(WindowMouseEvent.CLICK, this.onClick);
                    this._region.dispose();
                    this._region = null;
                }
                this._bitmap = null;
                if (this._root != null)
                {
                    this._root.dispose();
                    this._root = null;
                }
                if (this._widgetWindow != null)
                {
                    this._widgetWindow._Str_2429 = null;
                    this._widgetWindow = null;
                }
                this._windowManager = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }

        public function get properties():Array
        {
            var _local_2:PropertyStruct;
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(_Str_12653.withValue(this._limit));
            for each (_local_2 in this._bitmap.properties)
            {
                if (_local_2.key != PropertyKeys.ASSET_URI)
                {
                    k.push(_local_2.withNameSpace(PIXEL_LIMIT));
                }
            }
            return k;
        }

        public function set properties(k:Array):void
        {
            var _local_3:PropertyStruct;
            this._refreshing = true;
            var _local_2:Array = [];
            for each (_local_3 in k)
            {
                switch (_local_3.key)
                {
                    case _Str_15462:
                        this.limit = int(_local_3.value);
                        break;
                }
                if (_local_3.key != ((PIXEL_LIMIT + ":") + PropertyKeys.ASSET_URI))
                {
                    _local_2.push(_local_3.withoutNameSpace());
                }
            }
            this._bitmap.properties = _local_2;
            this._refreshing = false;
            this.refresh();
        }

        private function refresh():void
        {
            if (this._refreshing)
            {
                return;
            }
            this._bitmap.assetUri = this.assetUri;
            this._bitmap.invalidate();
        }

        private function get assetUri():String
        {
            var k:String;
            var _local_2:int = (Math.floor((this._limit / 20)) * 20);
            _local_2 = Math.max(_local_2, 20);
            k = "${image.library.url}reception/challenge_meter_%amount%.png";
            k = k.replace("%amount%", _local_2.toString());
            return k;
        }

        private function onClick(k:WindowMouseEvent):void
        {
        }

        public function get bitmapData():BitmapData
        {
            return IBitmapDataContainer(this._bitmap).bitmapData;
        }

        public function get pivotPoint():uint
        {
            return this._bitmap.pivotPoint;
        }

        public function set pivotPoint(k:uint):void
        {
            this._bitmap.pivotPoint = k;
            this._bitmap.invalidate();
        }

        public function get stretchedX():Boolean
        {
            return this._bitmap.stretchedX;
        }

        public function set stretchedX(k:Boolean):void
        {
            this._bitmap.stretchedX = k;
            this._bitmap.invalidate();
        }

        public function get stretchedY():Boolean
        {
            return this._bitmap.stretchedY;
        }

        public function set stretchedY(k:Boolean):void
        {
            this._bitmap.stretchedY = k;
            this._bitmap.invalidate();
        }

        public function get zoomX():Number
        {
            return this._bitmap.zoomX;
        }

        public function set zoomX(k:Number):void
        {
            this._bitmap.zoomX = k;
            this._bitmap.invalidate();
        }

        public function get zoomY():Number
        {
            return this._bitmap.zoomY;
        }

        public function set zoomY(k:Number):void
        {
            this._bitmap.zoomY = k;
            this._bitmap.invalidate();
        }

        public function get greyscale():Boolean
        {
            return this._bitmap.greyscale;
        }

        public function set greyscale(k:Boolean):void
        {
            this._bitmap.greyscale = k;
            this._bitmap.invalidate();
        }

        public function get etchingColor():uint
        {
            return this._bitmap.etchingColor;
        }

        public function set etchingColor(k:uint):void
        {
            this._bitmap.etchingColor = k;
            this._bitmap.invalidate();
        }

        public function get fitSizeToContents():Boolean
        {
            return this._bitmap.fitSizeToContents;
        }

        public function set fitSizeToContents(k:Boolean):void
        {
            this._bitmap.fitSizeToContents = k;
            this._bitmap.invalidate();
        }

        public function get etchingPoint():Point
        {
            return new Point(0, 1);
        }

        public function get wrapX():Boolean
        {
            return false;
        }

        public function set wrapX(k:Boolean):void
        {
        }

        public function get wrapY():Boolean
        {
            return false;
        }

        public function set wrapY(k:Boolean):void
        {
        }
    }
}



