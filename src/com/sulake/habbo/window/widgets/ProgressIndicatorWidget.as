package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.habbo.window.enum._Str_10992;
    import com.sulake.habbo.window.enum._Str_7639;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.utils.IBitmapDataContainer;

    public class ProgressIndicatorWidget implements _Str_4466 
    {
        public static const PROGRESS_INDICATOR:String = "progress_indicator";
        private static const _Str_15237:String = (PROGRESS_INDICATOR + ":style");
        private static const _Str_13117:String = (PROGRESS_INDICATOR + ":size");
        private static const _Str_15724:String = (PROGRESS_INDICATOR + ":position");
        private static const _Str_14899:String = (PROGRESS_INDICATOR + ":mode");
        private static const _Str_13010:PropertyStruct = new PropertyStruct(_Str_15237, _Str_10992.FLAT, PropertyStruct.STRING, false, _Str_10992.ALL);
        private static const _Str_19001:PropertyStruct = new PropertyStruct(_Str_13117, 1, PropertyStruct.UINT);
        private static const _Str_13575:PropertyStruct = new PropertyStruct(_Str_15724, 0, PropertyStruct.UINT);
        private static const _Str_12527:PropertyStruct = new PropertyStruct(_Str_14899, _Str_7639.POSITION, PropertyStruct.STRING, false, _Str_7639.ALL);
        private static const _Str_18224:uint = 1000;

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _root:IItemListWindow;
        private var _position:uint;
        private var _style:String;
        private var _mode:String;

        public function ProgressIndicatorWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._position = uint(_Str_13575.value);
            this._style = String(_Str_13010.value);
            this._mode = String(_Str_12527.value);
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("progress_indicator_xml").content as XML)) as IItemListWindow);
            this._widgetWindow.setParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN);
            this._widgetWindow._Str_2429 = this._root;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
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
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(_Str_13010.withValue(this._style));
            k.push(_Str_19001.withValue(this.size));
            k.push(_Str_13575.withValue(this._position));
            k.push(_Str_12527.withValue(this._mode));
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
                    case _Str_15237:
                        this.style = String(_local_2.value);
                        break;
                    case _Str_13117:
                        this.size = uint(_local_2.value);
                        break;
                    case _Str_15724:
                        this.position = uint(_local_2.value);
                        break;
                    case _Str_14899:
                        this.mode = String(_local_2.value);
                        break;
                }
            }
        }

        public function get style():String
        {
            return this._style;
        }

        public function set style(k:String):void
        {
            this._style = k;
            this.refresh();
        }

        public function get size():uint
        {
            return this._root.numListItems;
        }

        public function set size(k:uint):void
        {
            k = Math.min(Math.max(k, 1), _Str_18224);
            if (k != this.size)
            {
                while (k < this.size)
                {
                    this._root.removeListItemAt((this.size - 1));
                }
                while (k > this.size)
                {
                    this._root.addListItem(this._root.getListItemAt(0).clone());
                }
                this.refresh();
            }
        }

        public function get position():uint
        {
            return this._position;
        }

        public function set position(k:uint):void
        {
            this._position = k;
            this.refresh();
        }

        public function get mode():String
        {
            return this._mode;
        }

        public function set mode(k:String):void
        {
            this._mode = k;
            this.refresh();
        }

        private function refresh():void
        {
            var _local_2:IStaticBitmapWrapperWindow;
            var _local_3:Boolean;
            var _local_4:BitmapData;
            var k:int;
            while (k < this.size)
            {
                _local_2 = (this._root.getListItemAt(k) as IStaticBitmapWrapperWindow);
                switch (this._mode)
                {
                    case _Str_7639.POSITION:
                        _local_3 = ((k + 1) == this.position);
                        break;
                    case _Str_7639.PROGRESS:
                        _local_3 = (k < this.position);
                        break;
                }
                _local_2.assetUri = (("progress_disk_" + this._style) + ((_local_3) ? "_on" : "_off"));
                _local_4 = IBitmapDataContainer(_local_2).bitmapData;
                _local_2.width = _local_4.width;
                _local_2.height = _local_4.height;
                this._root.height = _local_4.height;
                k++;
            }
        }
    }
}
