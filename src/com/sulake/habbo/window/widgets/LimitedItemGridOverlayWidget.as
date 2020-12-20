package com.sulake.habbo.window.widgets
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.utils.getTimer;
    import com.sulake.habbo.window.utils.LimitedItemOverlayNumberBitmapGenerator;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import flash.geom.Rectangle;
    import flash.geom.Point;

    public class LimitedItemGridOverlayWidget implements ILimitedItemGridOverlayWidget, IUpdateReceiver
    {
        public static const LIMITED_ITEM_OVERLAY_GRID:String = "limited_item_overlay_grid";

        private const _Str_20449:uint = 10000;
        private const _Str_23542:uint = 250;

        private var _disposed:Boolean = false;
        private var _Str_2326:IWidgetWindow;
        private var _habboWindowManagerComponent:HabboWindowManagerComponent;
        private var _root:IWindowContainer;
        private var _Str_11590:BitmapData;
        private var _Str_5779:IBitmapWrapperWindow;
        private var _serialNumber:int;
        private var _Str_7480:uint;
        private var _Str_13683:uint;
        private var _animated:Boolean = false;

        public function LimitedItemGridOverlayWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._Str_7480 = getTimer();
            this._Str_13683 = this._Str_7480;
            super();
            this._Str_2326 = k;
            this._habboWindowManagerComponent = _arg_2;
            this._Str_11590 = BitmapData(this._habboWindowManagerComponent.assets.getAssetByName("unique_item_label_plaque_metal").content).clone();
            this._root = IWindowContainer(this._habboWindowManagerComponent.buildFromXML(XML(this._habboWindowManagerComponent.assets.getAssetByName("unique_item_overlay_griditem_xml").content)));
            this._Str_5779 = IBitmapWrapperWindow(this._root.findChildByName("unique_item_overlay_plaque_background_bitmap"));
            this._Str_5779.bitmap = this._Str_11590;
            this._Str_2326.rootWindow = this._root;
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._animated)
                {
                    this._habboWindowManagerComponent.removeUpdateReceiver(this);
                }
                if (this._Str_2326 != null)
                {
                    this._Str_2326.rootWindow = null;
                    this._Str_2326 = null;
                }
                if (this._root != null)
                {
                    this._root.dispose();
                    this._root = null;
                }
                this._habboWindowManagerComponent = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set serialNumber(k:int):void
        {
            this._serialNumber = k;
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(this._root.findChildByName("unique_item_overlay_plaque_number_bitmap"));
            _local_2.bitmap = LimitedItemOverlayNumberBitmapGenerator._Str_14181(this._habboWindowManagerComponent.assets, this.serialNumber, _local_2.width, _local_2.height);
        }

        public function set seriesSize(k:int):void
        {
        }

        public function get serialNumber():int
        {
            return this._serialNumber;
        }

        public function get seriesSize():int
        {
            return 0;
        }

        public function get properties():Array
        {
            return [];
        }

        public function set properties(k:Array):void
        {
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }

        public function get animated():Boolean
        {
            return this._animated;
        }

        public function set animated(k:Boolean):void
        {
            this._animated = k;
            if (this._animated)
            {
                this._habboWindowManagerComponent.registerUpdateReceiver(this, 5);
            }
            else
            {
                this._habboWindowManagerComponent.removeUpdateReceiver(this);
            }
        }

        public function update(k:uint):void
        {
            var _local_2:BitmapData;
            var _local_3:Number;
            var _local_4:int;
            if (!this.disposed)
            {
                this._Str_7480 = (this._Str_7480 + k);
                if ((this._Str_7480 - this._Str_13683) > this._Str_20449)
                {
                    _local_2 = new BitmapData(this._Str_5779.width, this._Str_5779.height, false);
                    _local_3 = (((this._Str_7480 - this._Str_13683) - this._Str_20449) / this._Str_23542);
                    if (_local_3 < 1)
                    {
                        _local_4 = ((this._Str_11590.height - this._Str_5779.height) * _local_3);
                        _local_2.copyPixels(this._Str_11590, new Rectangle(0, _local_4, this._Str_5779.width, this._Str_5779.height), new Point(0, 0));
                        this._Str_5779.bitmap = _local_2;
                    }
                    else
                    {
                        this._Str_5779.bitmap = this._Str_11590;
                        this._Str_13683 = this._Str_7480;
                    }
                }
            }
        }
    }
}
