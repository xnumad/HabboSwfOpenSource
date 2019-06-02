package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.IWindow;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.BitmapDataAsset;

    public class SeperatorWidget implements _Str_16365 
    {
        public static const SEPARATOR:String = "separator";
        private static const _Str_15525:String = (SEPARATOR + ":vertical");
        private static const _Str_15640:PropertyStruct = new PropertyStruct(_Str_15525, false, PropertyStruct.BOOLEAN);
        private static const ILLUMINA_LIGHT_SEPARATOR_HORIZONTAL:String = "illumina_light_separator_horizontal";
        private static const ILLUMINA_LIGHT_SEPARATOR_VERTICAL:String = "illumina_light_separator_vertical";

        private var _disposed:Boolean;
        private var _Str_2326:IWidgetWindow;
        private var _habboWindowManagerComponent:HabboWindowManagerComponent;
        private var _Str_2302:IWindowContainer;
        private var _Str_1868:IBitmapWrapperWindow;
        private var _Str_2903:BitmapData;
        private var _Str_2187:IWindowContainer;
        private var _vertical:Boolean;

        public function SeperatorWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._vertical = Boolean(_Str_15640.value);
            super();
            this._Str_2326 = k;
            this._habboWindowManagerComponent = _arg_2;
            this._Str_2302 = (this._habboWindowManagerComponent.buildFromXML((this._habboWindowManagerComponent.assets.getAssetByName("separator_xml").content as XML)) as IWindowContainer);
            this._Str_1868 = (this._Str_2302.getChildByName("canvas") as IBitmapWrapperWindow);
            this._Str_2187 = (this._Str_2302.getChildByName("children") as IWindowContainer);
            this._Str_1868.addEventListener(WindowEvent.WINDOW_EVENT_RESIZE, this._Str_2832);
            this._Str_1868.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_2832);
            this._Str_2187.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_ADDED, this._Str_2832);
            this._Str_2187.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_REMOVED, this._Str_2832);
            this._Str_2187.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_RELOCATED, this._Str_2832);
            this._Str_2187.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_RESIZED, this._Str_2832);
            this._Str_2326._Str_2429 = this._Str_2302;
            this._Str_2302.width = this._Str_2326.width;
            this._Str_2302.height = this._Str_2326.height;
        }

        private function _Str_2832(k:WindowEvent):void
        {
            this.refresh();
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._Str_2903 != null)
                {
                    this._Str_2903.dispose();
                    this._Str_2903 = null;
                }
                if (this._Str_1868 != null)
                {
                    this._Str_1868.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZE, this._Str_2832);
                    this._Str_1868.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_2832);
                    this._Str_1868 = null;
                }
                if (this._Str_2187 != null)
                {
                    this._Str_2187.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_ADDED, this._Str_2832);
                    this._Str_2187.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_REMOVED, this._Str_2832);
                    this._Str_2187.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_RELOCATED, this._Str_2832);
                    this._Str_2187.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_RESIZED, this._Str_2832);
                    this._Str_2187 = null;
                }
                if (this._Str_2302 != null)
                {
                    this._Str_2302.dispose();
                    this._Str_2302 = null;
                }
                if (this._Str_2326 != null)
                {
                    this._Str_2326._Str_2429 = null;
                    this._Str_2326 = null;
                }
                this._habboWindowManagerComponent = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get iterator():IIterator
        {
            return this._Str_2187.iterator;
        }

        public function get properties():Array
        {
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(_Str_15640.withValue(this._vertical));
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
                    case _Str_15525:
                        this.vertical = Boolean(_local_2.value);
                        break;
                }
            }
        }

        public function get vertical():Boolean
        {
            return this._vertical;
        }

        public function set vertical(k:Boolean):void
        {
            this._vertical = k;
            this.refresh();
        }

        private function refresh():void
        {
            var _local_2:IWindow;
            var _local_3:BitmapData;
            var _local_4:Point;
            if (this._disposed)
            {
                return;
            }
            if ((((this._Str_2903 == null) || (!(this._Str_2903.width == this._Str_1868.width))) || (!(this._Str_2903.height == this._Str_1868.height))))
            {
                if (this._Str_2903 != null)
                {
                    this._Str_2903.dispose();
                }
                this._Str_2903 = new BitmapData(Math.max(1, this._Str_1868.width), Math.max(1, this._Str_1868.height), true, 0);
                this._Str_1868.bitmap = this._Str_2903;
            }
            this._Str_2903.lock();
            this._Str_2903.fillRect(new Rectangle(0, 0, this._Str_1868.width, this._Str_1868.height), 0);
            var k:BitmapDataAsset = (this._habboWindowManagerComponent.assets.getAssetByName(((this._vertical) ? ILLUMINA_LIGHT_SEPARATOR_VERTICAL : ILLUMINA_LIGHT_SEPARATOR_HORIZONTAL)) as BitmapDataAsset);
            if (k != null)
            {
                _local_3 = (k.content as BitmapData);
                if (this._vertical)
                {
                    _local_4 = new Point(((this._Str_1868.width / 2) - 1), 0);
                    while (_local_4.y < this._Str_1868.height)
                    {
                        this._Str_2903.copyPixels(_local_3, k.rectangle, _local_4);
                        _local_4.y = (_local_4.y + k.rectangle.height);
                    }
                }
                else
                {
                    _local_4 = new Point(0, ((this._Str_1868.height / 2) - 1));
                    while (_local_4.x < this._Str_1868.width)
                    {
                        this._Str_2903.copyPixels(_local_3, k.rectangle, _local_4);
                        _local_4.x = (_local_4.x + k.rectangle.width);
                    }
                }
            }
            for each (_local_2 in this._Str_2187.iterator)
            {
                if (_local_2.visible)
                {
                    this._Str_2903.fillRect(_local_2.rectangle, 0);
                }
            }
            this._Str_2903.unlock();
            this._Str_1868.invalidate();
        }
    }
}



