package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.habbo.window.enum._Str_3142;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.habbo.utils._Str_988;

    public class BalloonWidget implements _Str_13291 
    {
        public static const BALLOON:String = "balloon";
        private static const _Str_12724:String = (BALLOON + ":arrow_pivot");
        private static const _Str_13966:String = (BALLOON + ":arrow_displacement");
        private static const _Str_15799:PropertyStruct = new PropertyStruct(_Str_12724, _Str_3142._Str_14331, PropertyStruct.STRING, false, _Str_3142.ALL);
        private static const _Str_13694:PropertyStruct = new PropertyStruct(_Str_13966, 0, PropertyStruct.INT);
        private static const ILLUMINA_LIGHT_BALLOON_ARROW_:String = "illumina_light_balloon_arrow_";
        private static const _Str_5411:int = 6;
        private static const _Str_5290:int = 6;
        private static const _Str_6859:int = 9;

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _settingProperties:Boolean = false;
        private var _resizingWidget:Boolean = false;
        private var _root:IWindowContainer;
        private var _contents:IWindowContainer;
        private var _arrowHead:IStaticBitmapWrapperWindow;
        private var _arrowPivot:String;
        private var _arrowDisplacement:int;

        public function BalloonWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._arrowPivot = String(_Str_15799.value);
            this._arrowDisplacement = int(_Str_13694.value);
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("balloon_xml").content as XML)) as IWindowContainer);
            this._arrowHead = (this._root.findChildByName("bitmap") as IStaticBitmapWrapperWindow);
            this._contents = (this._root.findChildByName("border") as IWindowContainer);
            this._Str_19710();
            this._widgetWindow.addEventListener(WindowEvent.WINDOW_EVENT_RESIZE, this._Str_2832);
            this._widgetWindow.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_2832);
            this._contents.addEventListener(WindowEvent.WINDOW_EVENT_RESIZE, this._Str_2832);
            this._contents.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_2832);
            this._widgetWindow._Str_2429 = this._root;
            this._root.width = this._widgetWindow.width;
            this._root.height = this._widgetWindow.height;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._contents != null)
                {
                    this._contents.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZE, this._Str_2832);
                    this._contents.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_2832);
                    this._contents = null;
                }
                this._arrowHead = null;
                if (this._root != null)
                {
                    this._root.dispose();
                    this._root = null;
                }
                if (this._widgetWindow != null)
                {
                    this._widgetWindow.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZE, this._Str_2832);
                    this._widgetWindow.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_2832);
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
            return (this._contents == null) ? EmptyIterator.INSTANCE : this._contents.iterator;
        }

        public function get properties():Array
        {
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(_Str_15799.withValue(this._arrowPivot));
            k.push(_Str_13694.withValue(this._arrowDisplacement));
            return k;
        }

        public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            this._settingProperties = true;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case _Str_12724:
                        this._Str_12978 = String(_local_2.value);
                        break;
                    case _Str_13966:
                        this._Str_12751 = int(_local_2.value);
                        break;
                }
            }
            this._settingProperties = false;
            this.refresh();
        }

        public function get _Str_12978():String
        {
            return this._arrowPivot;
        }

        public function set _Str_12978(k:String):void
        {
            this._arrowPivot = k;
            this._Str_23150();
            this.refresh();
            this._Str_19710();
            this.refresh();
        }

        public function get _Str_12751():int
        {
            return this._arrowDisplacement;
        }

        public function set _Str_12751(k:int):void
        {
            this._arrowDisplacement = k;
            this.refresh();
        }

        private function _Str_2832(k:WindowEvent):void
        {
            this.refresh();
        }

        private function _Str_19710():void
        {
            if (this._contents != null)
            {
                this._contents.setParamFlag(WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN, this._widgetWindow.getParamFlag(WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN));
                this._contents.setParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN, this._widgetWindow.getParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN));
            }
        }

        private function _Str_23150():void
        {
            if (this._contents != null)
            {
                this._contents.setParamFlag(WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN, false);
                this._contents.setParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN, false);
            }
        }

        private function refresh():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            if (((((this._settingProperties) || (this._resizingWidget)) || (this._disposed)) || (this._contents == null)))
            {
                return;
            }
            var k:String = _Str_3142._Str_22659(this._arrowPivot);
            switch (k)
            {
                case _Str_3142.UP:
                case _Str_3142.DOWN:
                    _local_2 = this._contents.width;
                    _local_3 = ((this._contents.height + _Str_5290) - 1);
                    break;
                case _Str_3142.LEFT:
                case _Str_3142.RIGHT:
                    _local_2 = ((this._contents.width + _Str_5290) - 1);
                    _local_3 = this._contents.height;
                    break;
            }
            this._resizingWidget = true;
            if (this._widgetWindow.testParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN))
            {
                this._root.width = _local_2;
                this._root.height = _local_3;
            }
            else
            {
                if (this._widgetWindow.testParamFlag(WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN))
                {
                    this._root.width = Math.max(this._widgetWindow.width, _local_2);
                    this._root.height = Math.max(this._widgetWindow.height, _local_3);
                }
                else
                {
                    this._root.width = this._widgetWindow.width;
                    this._root.height = this._widgetWindow.height;
                }
            }
            this._widgetWindow.width = this._root.width;
            this._widgetWindow.height = this._root.height;
            this._resizingWidget = false;
            this._arrowHead.assetUri = (ILLUMINA_LIGHT_BALLOON_ARROW_ + k);
            switch (k)
            {
                case _Str_3142.UP:
                case _Str_3142.DOWN:
                    switch (_Str_3142._Str_20849(this._arrowPivot))
                    {
                        case _Str_3142.MINIMUM:
                            _local_4 = _Str_5411;
                            break;
                        case _Str_3142.MIDDLE:
                            _local_4 = ((this._root.width - _Str_6859) / 2);
                            break;
                        case _Str_3142.MAXIMUM:
                            _local_4 = ((this._root.width - _Str_5411) - _Str_6859);
                            break;
                    }
                    this._resizingWidget = true;
                    this._contents.rectangle = new Rectangle(0, ((k == _Str_3142.UP) ? (_Str_5290 - 1) : 0), this._root.width, ((this._root.height + 1) - _Str_5290));
                    this._resizingWidget = false;
                    this._arrowHead.rectangle = new Rectangle(_Str_988._Str_2040((_local_4 + this._arrowDisplacement), _Str_5411, (this._root.width - _Str_5411)), ((k == _Str_3142.UP) ? 0 : (this._contents.bottom - 1)), _Str_6859, _Str_5290);
                    return;
                case _Str_3142.LEFT:
                case _Str_3142.RIGHT:
                    switch (_Str_3142._Str_20849(this._arrowPivot))
                    {
                        case _Str_3142.MINIMUM:
                            _local_4 = _Str_5411;
                            break;
                        case _Str_3142.MIDDLE:
                            _local_4 = ((this._root.height - _Str_6859) / 2);
                            break;
                        case _Str_3142.MAXIMUM:
                            _local_4 = ((this._root.height - _Str_5411) - _Str_6859);
                            break;
                    }
                    this._resizingWidget = true;
                    this._contents.rectangle = new Rectangle(((k == _Str_3142.LEFT) ? (_Str_5290 - 1) : 0), 0, ((this._root.width + 1) - _Str_5290), this._root.height);
                    this._resizingWidget = false;
                    this._arrowHead.rectangle = new Rectangle(((k == _Str_3142.LEFT) ? 0 : ((this._contents.right - 1))), _Str_988._Str_2040((_local_4 + this._arrowDisplacement), _Str_5411, (this._root.height - _Str_5411)), _Str_5290, _Str_6859);
                    return;
            }
        }
    }
}
