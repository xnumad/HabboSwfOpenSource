package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import flash.geom.Matrix;
    import flash.utils.Dictionary;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.IWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.enum.WindowParam;

    public class IlluminaBorderWidget implements _Str_16637 
    {
        public static const ILLUMINA_BORDER:String = "illumina_border";
        public static const ILLUMINA_LIGHT:String = "illumina_light";
        public static const ILLUMINA_DARK:String = "illumina_dark";
        public static const _Str_14195:Array = [ILLUMINA_LIGHT, ILLUMINA_DARK];
        public static const _Str_7804:String = (ILLUMINA_BORDER + ":border_style");
        private static const _Str_13768:String = (ILLUMINA_BORDER + ":content_child");
        private static const _Str_14622:String = (ILLUMINA_BORDER + ":content_padding");
        private static const _Str_13118:String = (ILLUMINA_BORDER + ":side_padding");
        private static const _Str_13917:String = (ILLUMINA_BORDER + ":child_margin");
        private static const _Str_14392:String = (ILLUMINA_BORDER + ":top_left_child");
        private static const _Str_14956:String = (ILLUMINA_BORDER + ":top_center_child");
        private static const _Str_14239:String = (ILLUMINA_BORDER + ":top_right_child");
        private static const _Str_15641:String = (ILLUMINA_BORDER + ":bottom_left_child");
        private static const _Str_15636:String = (ILLUMINA_BORDER + ":bottom_center_child");
        private static const _Str_13835:String = (ILLUMINA_BORDER + ":bottom_right_child");
        private static const _Str_13958:String = (ILLUMINA_BORDER + ":landing_view_mode");
        private static const _Str_13216:PropertyStruct = new PropertyStruct(_Str_13768, "", PropertyStruct.STRING);
        private static const _Str_13095:PropertyStruct = new PropertyStruct(_Str_14622, 5, PropertyStruct.UINT);
        private static const _Str_12566:PropertyStruct = new PropertyStruct(_Str_13118, 15, PropertyStruct.UINT);
        private static const _Str_15722:PropertyStruct = new PropertyStruct(_Str_13917, 3, PropertyStruct.UINT);
        private static const _Str_14919:PropertyStruct = new PropertyStruct(_Str_14392, "", PropertyStruct.STRING);
        private static const _Str_15429:PropertyStruct = new PropertyStruct(_Str_14956, "", PropertyStruct.STRING);
        private static const _Str_15053:PropertyStruct = new PropertyStruct(_Str_14239, "", PropertyStruct.STRING);
        private static const _Str_15265:PropertyStruct = new PropertyStruct(_Str_15641, "", PropertyStruct.STRING);
        private static const _Str_14659:PropertyStruct = new PropertyStruct(_Str_15636, "", PropertyStruct.STRING);
        private static const _Str_13511:PropertyStruct = new PropertyStruct(_Str_13835, "", PropertyStruct.STRING);
        private static const _Str_15456:PropertyStruct = new PropertyStruct(_Str_13958, false, PropertyStruct.BOOLEAN);
        private static const _Str_3559:Matrix = new Matrix();
        private static const TOP_LEFT:String = "top_left";
        private static const TOP:String = "top_center";
        private static const TOP_RIGHT:String = "top_right";
        private static const RIGHT:String = "center_right";
        private static const BOTTOM_RIGHT:String = "bottom_right";
        private static const BOTTOM:String = "bottom_center";
        private static const BOTTOM_LEFT:String = "bottom_left";
        private static const LEFT:String = "center_left";
        private static const _Str_18608:Array = [TOP_LEFT, TOP, TOP_RIGHT, RIGHT, BOTTOM_RIGHT, BOTTOM, BOTTOM_LEFT, LEFT];

        private var _borderPieces:Dictionary;
        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _root:IWindowContainer;
        private var _canvas:IBitmapWrapperWindow;
        private var _drawBuffer:BitmapData;
        private var _children:IWindowContainer;
        private var _settingProperties:Boolean = false;
        private var _resizingWidget:Boolean = false;
        private var _borderStyle:String;
        private var _contentChild:String;
        private var _contentPadding:uint;
        private var _sidePadding:uint;
        private var _childMargin:uint;
        private var _topLeftChild:String;
        private var _topCenterChild:String;
        private var _topRightChild:String;
        private var _bottomLeftChild:String;
        private var _bottomCenterChild:String;
        private var _bottomRightChild:String;
        private var _landingViewMode:Boolean;

        public function IlluminaBorderWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._contentChild = String(_Str_13216.value);
            this._contentPadding = uint(_Str_13095.value);
            this._sidePadding = uint(_Str_12566.value);
            this._childMargin = uint(_Str_15722.value);
            this._topLeftChild = String(_Str_14919.value);
            this._topCenterChild = String(_Str_15429.value);
            this._topRightChild = String(_Str_15053.value);
            this._bottomLeftChild = String(_Str_15265.value);
            this._bottomCenterChild = String(_Str_14659.value);
            this._bottomRightChild = String(_Str_13511.value);
            this._landingViewMode = Boolean(_Str_15456.value);
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("illumina_border_xml").content as XML)) as IWindowContainer);
            this._canvas = (this._root.getChildByName("canvas") as IBitmapWrapperWindow);
            this._children = (this._root.getChildByName("children") as IWindowContainer);
            this._Str_10365 = String(this._widgetWindow.getDefaultProperty(_Str_7804).value);
            this._widgetWindow.addEventListener(WindowEvent.WINDOW_EVENT_RESIZE, this._Str_2832);
            this._widgetWindow.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_2832);
            this._children.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_ADDED, this._Str_2832);
            this._children.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_REMOVED, this._Str_2832);
            this._children.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_RELOCATED, this._Str_2832);
            this._children.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_RESIZED, this._Str_2832);
            this._widgetWindow._Str_2429 = this._root;
            this._root.width = this._widgetWindow.width;
            this._root.height = this._widgetWindow.height;
        }

        private function _Str_2832(k:WindowEvent):void
        {
            this.refresh();
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._drawBuffer != null)
                {
                    this._drawBuffer.dispose();
                    this._drawBuffer = null;
                }
                if (this._canvas != null)
                {
                    this._canvas.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZE, this._Str_2832);
                    this._canvas.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_2832);
                    this._canvas = null;
                }
                if (this._children != null)
                {
                    this._children.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_ADDED, this._Str_2832);
                    this._children.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_REMOVED, this._Str_2832);
                    this._children.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_RELOCATED, this._Str_2832);
                    this._children.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_RESIZED, this._Str_2832);
                    this._children = null;
                }
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
                this._borderPieces = null;
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
            return this._children.iterator;
        }

        public function get properties():Array
        {
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(this._widgetWindow.createProperty(_Str_7804, this._borderStyle));
            k.push(_Str_13216.withValue(this._contentChild));
            k.push(_Str_13095.withValue(this._contentPadding));
            k.push(_Str_12566.withValue(this._sidePadding));
            k.push(_Str_15722.withValue(this._childMargin));
            k.push(_Str_14919.withValue(this._topLeftChild));
            k.push(_Str_15429.withValue(this._topCenterChild));
            k.push(_Str_15053.withValue(this._topRightChild));
            k.push(_Str_15265.withValue(this._bottomLeftChild));
            k.push(_Str_14659.withValue(this._bottomCenterChild));
            k.push(_Str_13511.withValue(this._bottomRightChild));
            k.push(_Str_15456.withValue(this._landingViewMode));
            return k;
        }

        public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            if (this._disposed)
            {
                return;
            }
            this._settingProperties = true;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case _Str_7804:
                        this._Str_10365 = String(_local_2.value);
                        break;
                    case _Str_13768:
                        this._Str_14667 = String(_local_2.value);
                        break;
                    case _Str_14622:
                        this._Str_8790 = uint(_local_2.value);
                        break;
                    case _Str_13118:
                        this._Str_12661 = uint(_local_2.value);
                        break;
                    case _Str_13917:
                        this._Str_12578 = uint(_local_2.value);
                        break;
                    case _Str_14392:
                        this._Str_14320 = String(_local_2.value);
                        break;
                    case _Str_14956:
                        this._Str_13313 = String(_local_2.value);
                        break;
                    case _Str_14239:
                        this._Str_13654 = String(_local_2.value);
                        break;
                    case _Str_15641:
                        this._Str_15704 = String(_local_2.value);
                        break;
                    case _Str_15636:
                        this._Str_15773 = String(_local_2.value);
                        break;
                    case _Str_13835:
                        this._Str_12912 = String(_local_2.value);
                        break;
                    case _Str_13958:
                        this._Str_15124 = Boolean(_local_2.value);
                        break;
                }
            }
            this._settingProperties = false;
            this.refresh();
        }

        public function get _Str_10365():String
        {
            return this._borderStyle;
        }

        public function set _Str_10365(k:String):void
        {
            var _local_2:String;
            this._borderStyle = k;
            this._borderPieces = new Dictionary();
            for each (_local_2 in _Str_18608)
            {
                this._borderPieces[_local_2] = this._windowManager.assets.getAssetByName(((this._borderStyle + "_border_") + _local_2));
            }
            this.refresh();
        }

        public function get _Str_14667():String
        {
            return this._contentChild;
        }

        public function set _Str_14667(k:String):void
        {
            this._contentChild = ((k != null) ? k : "");
            this.refresh();
        }

        public function get _Str_8790():uint
        {
            return this._contentPadding;
        }

        public function set _Str_8790(k:uint):void
        {
            this._contentPadding = k;
            this.refresh();
        }

        public function get _Str_12661():uint
        {
            return this._sidePadding;
        }

        public function set _Str_12661(k:uint):void
        {
            this._sidePadding = k;
            this.refresh();
        }

        public function get _Str_12578():uint
        {
            return this._childMargin;
        }

        public function set _Str_12578(k:uint):void
        {
            this._childMargin = k;
            this.refresh();
        }

        public function get _Str_14320():String
        {
            return this._topLeftChild;
        }

        public function set _Str_14320(k:String):void
        {
            this._topLeftChild = ((k != null) ? k : "");
            this.refresh();
        }

        public function get _Str_13313():String
        {
            return this._topCenterChild;
        }

        public function set _Str_13313(k:String):void
        {
            this._topCenterChild = ((k != null) ? k : "");
            this.refresh();
        }

        public function get _Str_13654():String
        {
            return this._topRightChild;
        }

        public function set _Str_13654(k:String):void
        {
            this._topRightChild = ((k != null) ? k : "");
            this.refresh();
        }

        public function get _Str_15704():String
        {
            return this._bottomLeftChild;
        }

        public function set _Str_15704(k:String):void
        {
            this._bottomLeftChild = ((k != null) ? k : "");
            this.refresh();
        }

        public function get _Str_15773():String
        {
            return this._bottomCenterChild;
        }

        public function set _Str_15773(k:String):void
        {
            this._bottomCenterChild = ((k != null) ? k : "");
            this.refresh();
        }

        public function get _Str_12912():String
        {
            return this._bottomRightChild;
        }

        public function set _Str_12912(k:String):void
        {
            this._bottomRightChild = ((k != null) ? k : "");
            this.refresh();
        }

        public function get _Str_15124():Boolean
        {
            return this._landingViewMode;
        }

        public function set _Str_15124(k:Boolean):void
        {
            this._landingViewMode = k;
            this.refresh();
        }

        private function _Str_4388(k:String):BitmapDataAsset
        {
            return this._borderPieces[k];
        }

        private function _Str_8501(k:String):int
        {
            var _local_2:IWindow = this._children.getChildByName(k);
            return (((!(k == null)) && (k.length > 0)) && (!(_local_2 == null))) ? _local_2.height : 0;
        }

        private function get _Str_13539():int
        {
            return Math.max(this._Str_8501(this._topCenterChild), Math.max(this._Str_8501(this._topLeftChild), this._Str_8501(this._topRightChild))) / 2;
        }

        private function get _Str_19026():int
        {
            return Math.max(this._Str_8501(this._bottomCenterChild), Math.max(this._Str_8501(this._bottomLeftChild), this._Str_8501(this._bottomRightChild))) / 2;
        }

        private function refresh():void
        {
            var _local_3:String;
            var _local_4:Array;
            var _local_5:IWindow;
            var _local_6:int;
            var _local_7:int;
            var _local_8:BitmapDataAsset;
            var _local_9:BitmapData;
            var _local_10:Rectangle;
            var _local_11:Rectangle;
            var _local_12:int;
            var _local_13:int;
            if ((((this._settingProperties) || (this._resizingWidget)) || (this.disposed)))
            {
                return;
            }
            this._root.limits.setEmpty();
            this._root.width = this._widgetWindow.width;
            this._root.height = this._widgetWindow.height;
            var k:IWindow = this._children.getChildByName(this._contentChild);
            if (k != null)
            {
                _local_6 = Math.max(1, (k.width + (2 * this._contentPadding)));
                _local_7 = Math.max(1, (((k.height + (2 * this._contentPadding)) + this._Str_13539) + this._Str_19026));
                this._resizingWidget = true;
                if (this._widgetWindow.testParamFlag(WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN))
                {
                    this._root.limits.minWidth = _local_6;
                    this._root.limits.minHeight = _local_7;
                }
                if (this._widgetWindow.testParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN))
                {
                    this._root.limits.minWidth = _local_6;
                    this._root.limits.minHeight = _local_7;
                    this._root.limits.maxWidth = _local_6;
                    this._root.limits.maxHeight = _local_7;
                }
                this._resizingWidget = false;
            }
            if ((((this._drawBuffer == null) || (!(this._drawBuffer.width == this._root.width))) || (!(this._drawBuffer.height == this._root.height))))
            {
                this._canvas.width = this._root.width;
                this._canvas.height = this._root.height;
                this._children.width = this._root.width;
                this._children.height = this._root.height;
                if (this._drawBuffer != null)
                {
                    this._drawBuffer.dispose();
                }
                this._drawBuffer = new BitmapData(this._canvas.width, this._canvas.height, true, 0);
                this._canvas.bitmap = this._drawBuffer;
            }
            var _local_2:Rectangle = this._canvas.rectangle;
            _local_2.y = (_local_2.y + this._Str_13539);
            _local_2.height = (_local_2.height - (this._Str_13539 + this._Str_19026));
            this._drawBuffer.lock();
            this._drawBuffer.fillRect(new Rectangle(0, 0, this._canvas.width, this._canvas.height), 0);
            _loop_1:
            for (_local_3 in this._borderPieces)
            {
                _local_8 = this._Str_4388(_local_3);
                if (((_local_8 == null) || ((this._landingViewMode) && (((_local_3 == TOP_LEFT) || (_local_3 == LEFT)) || (_local_3 == BOTTOM_LEFT)))))
                {
                }
                else
                {
                    _local_9 = (_local_8.content as BitmapData);
                    _local_10 = _local_8.rectangle;
                    _local_11 = new Rectangle(_local_2.x, _local_2.y, _local_10.width, _local_10.height);
                    switch (_local_3)
                    {
                        case TOP_LEFT:
                            break;
                        case TOP:
                            _local_11.x = (_local_11.x + this._Str_4388(TOP_LEFT).rectangle.width);
                            _local_11.width = ((_local_2.width - this._Str_4388(TOP_LEFT).rectangle.width) - this._Str_4388(TOP_RIGHT).rectangle.width);
                            break;
                        case TOP_RIGHT:
                            _local_11.x = (_local_11.x + (_local_2.width - _local_10.width));
                            break;
                        case RIGHT:
                            _local_11.x = (_local_11.x + (_local_2.width - _local_10.width));
                            _local_11.y = (_local_11.y + this._Str_4388(TOP_RIGHT).rectangle.height);
                            _local_11.height = ((_local_2.height - this._Str_4388(TOP_RIGHT).rectangle.height) - this._Str_4388(BOTTOM_RIGHT).rectangle.height);
                            break;
                        case BOTTOM_RIGHT:
                            _local_11.x = (_local_11.x + (_local_2.width - _local_10.width));
                            _local_11.y = (_local_11.y + (_local_2.height - _local_10.height));
                            break;
                        case BOTTOM:
                            _local_11.x = (_local_11.x + this._Str_4388(BOTTOM_LEFT).rectangle.width);
                            _local_11.y = (_local_11.y + (_local_2.height - _local_10.height));
                            _local_11.width = ((_local_2.width - this._Str_4388(BOTTOM_LEFT).rectangle.width) - this._Str_4388(BOTTOM_RIGHT).rectangle.width);
                            if (this._landingViewMode)
                            {
                                _local_12 = (_local_11.width / 2);
                                _local_11.x = (_local_11.x + _local_12);
                                _local_11.width = (_local_11.width - _local_12);
                            }
                            break;
                        case BOTTOM_LEFT:
                            _local_11.y = (_local_11.y + (_local_2.height - _local_10.height));
                            break;
                        case LEFT:
                            _local_11.y = (_local_11.y + this._Str_4388(TOP_LEFT).rectangle.height);
                            _local_11.height = ((_local_2.height - this._Str_4388(TOP_LEFT).rectangle.height) - this._Str_4388(BOTTOM_LEFT).rectangle.height);
                            break;
                        default:
                            continue _loop_1;
                    }
                    _Str_3559.a = (_local_11.width / _local_10.width);
                    _Str_3559.d = (_local_11.height / _local_10.height);
                    _Str_3559.tx = (_local_11.x - (_local_10.x * _Str_3559.a));
                    _Str_3559.ty = (_local_11.y - (_local_10.y * _Str_3559.d));
                    this._drawBuffer.draw(_local_9, _Str_3559, null, null, _local_11, false);
                }
            }
            _local_4 = [this._topLeftChild, this._topCenterChild, this._topRightChild, this._bottomLeftChild, this._bottomCenterChild, this._bottomRightChild];
            for each (_local_5 in this._children.iterator)
            {
                if (((!(_local_5.name == null)) && (_local_5.name.length > 0)))
                {
                    _local_13 = _local_4.indexOf(_local_5.name);
                    if (_local_13 < 0)
                    {
                        if (_local_5.name == this._contentChild)
                        {
                            _local_5.x = (_local_2.x + this._Str_8790);
                            _local_5.y = (_local_2.y + this._Str_8790);
                            _local_5.visible = true;
                        }
                        else
                        {
                            _local_5.visible = false;
                        }
                    }
                    else
                    {
                        switch ((_local_13 % 3))
                        {
                            case 0:
                                _local_5.x = Math.min(this._sidePadding, (this._canvas.width - _local_5.width));
                                break;
                            case 1:
                                _local_5.x = (Math.max((this._canvas.width - _local_5.width), 0) / 2);
                                break;
                            case 2:
                                _local_5.x = Math.max(((this._canvas.width - _local_5.width) - this._sidePadding), 0);
                                break;
                        }
                        if (_local_13 < 3)
                        {
                            _local_5.y = (this._Str_13539 - (_local_5.height / 2));
                        }
                        else
                        {
                            _local_5.y = (this._canvas.height - (this._Str_19026 + (_local_5.height / 2)));
                        }
                        _local_5.visible = true;
                        this._drawBuffer.fillRect(new Rectangle((_local_5.x - this._childMargin), _local_5.y, (_local_5.width + (this._childMargin * 2)), _local_5.height), 0);
                    }
                }
                else
                {
                    _local_5.visible = false;
                }
            }
            this._drawBuffer.unlock();
            this._canvas.invalidate();
        }
    }
}
