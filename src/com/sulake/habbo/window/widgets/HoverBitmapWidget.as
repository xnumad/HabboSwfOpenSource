package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.theme.PropertyKeys;

    public class HoverBitmapWidget implements _Str_14236 
    {
        public static const HOVER_BITMAP:String = "hover_bitmap";
        private static const _Str_15793:String = (HOVER_BITMAP + ":hover_asset");
        private static const _Str_15315:String = (HOVER_BITMAP + ":normal_asset");
        private static const _Str_16062:PropertyStruct = new PropertyStruct(_Str_15793, null, PropertyStruct.STRING);
        private static const _Str_16371:PropertyStruct = new PropertyStruct(_Str_15315, null, PropertyStruct.STRING);

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _bitmap:IStaticBitmapWrapperWindow;
        private var _normalAsset:String;
        private var _hoverAsset:String;
        private var _isMouseOver:Boolean = false;

        public function HoverBitmapWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._bitmap = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("hover_bitmap_xml").content as XML)) as IStaticBitmapWrapperWindow);
            this._bitmap.addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
            this._bitmap.addEventListener(WindowMouseEvent.OUT, this.onMouseOut);
            this._widgetWindow._Str_2429 = this._bitmap;
            this._bitmap.width = this._widgetWindow.width;
            this._bitmap.height = this._widgetWindow.height;
            this._bitmap.invalidate();
        }

        private function onMouseOver(k:WindowMouseEvent):void
        {
            this._isMouseOver = true;
            this._bitmap.assetUri = this._hoverAsset;
        }

        private function onMouseOut(k:WindowMouseEvent):void
        {
            this._isMouseOver = false;
            this._bitmap.assetUri = this._normalAsset;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._bitmap != null)
                {
                    this._bitmap.dispose();
                    this._bitmap = null;
                }
                this._widgetWindow._Str_2429 = null;
                this._widgetWindow = null;
                this._windowManager = null;
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
            k.push(_Str_16371.withValue(this._normalAsset));
            k.push(_Str_16062.withValue(this._hoverAsset));
            if (this._bitmap != null)
            {
                for each (_local_2 in this._bitmap.properties)
                {
                    if (_local_2.key != PropertyKeys.ASSET_URI)
                    {
                        k.push(_local_2);
                    }
                }
            }
            return k;
        }

        public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            if (this._disposed)
            {
                return;
            }
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case _Str_15315:
                        this._Str_13459 = String(_local_2.value);
                        break;
                    case _Str_15793:
                        this._Str_15575 = String(_local_2.value);
                        break;
                }
            }
            if (this._bitmap != null)
            {
                this._bitmap.properties = k;
                this._bitmap.invalidate();
            }
        }

        public function get _Str_13459():String
        {
            return this._normalAsset;
        }

        public function set _Str_13459(k:String):void
        {
            this._normalAsset = k;
            if (!this._isMouseOver)
            {
                this._bitmap.assetUri = this._normalAsset;
            }
        }

        public function get _Str_15575():String
        {
            return this._hoverAsset;
        }

        public function set _Str_15575(k:String):void
        {
            this._hoverAsset = k;
            if (this._isMouseOver)
            {
                this._bitmap.assetUri = this._hoverAsset;
            }
        }

        public function get _Str_24603():IStaticBitmapWrapperWindow
        {
            return this._bitmap;
        }
    }
}

