package com.sulake.core.window
{
    import com.sulake.core.window.graphics.IGraphicContextHost;
    import com.sulake.core.window.utils.IChildWindowHost;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowEventDispatcher;
    import com.sulake.core.window.graphics.IGraphicContext;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.utils.WindowRectLimits;
    import com.sulake.core.window.dynamicstyle.DynamicStyle;
    import com.sulake.core.window.theme.IPropertyMap;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.utils.DefaultAttStruct;
    import com.sulake.core.window.graphics.WindowRedrawFlag;
    import com.sulake.core.window.utils.IRectLimiter;
    import com.sulake.core.window.events.WindowEvent;
    import flash.geom.ColorTransform;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.core.window.graphics.GraphicContext;
    import com.sulake.core.window.events.WindowDisposeEvent;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.getQualifiedClassName;
    import com.sulake.core.utils.Map;
    import flash.display.IBitmapDrawable;
    import com.sulake.core.window.services.IMouseListenerService;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.enum.MouseListenerType;
    import com.sulake.core.window.dynamicstyle.DynamicStyleManager;
    import flash.display.BitmapData;
    import com.sulake.core.window.utils.PropertyStruct;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import __AS3__.vec.*;

    public class WindowController extends WindowModel implements IWindow, IGraphicContextHost, IChildWindowHost 
    {
        private static var _Str_10736:uint = 0;
        private static const _Str_4232:Rectangle = new Rectangle();
        public static const TAG_EXCLUDE:String = "_EXCLUDE";
        public static const TAG_INTERNAL:String = "_INTERNAL";
        public static const _COLORIZE:String = "_COLORIZE";
        public static const _IGNORE_INHERITED_STYLE:String = "_IGNORE_INHERITED_STYLE";
        private static const _Str_13133:Point = new Point();

        protected var _Str_759:WindowEventDispatcher;
        protected var _Str_2624:IGraphicContext;
        protected var _Str_6620:Function;
        protected var _Str_3781:Boolean = true;
        protected var _parent:WindowController;
        protected var _Str_2187:Vector.<IWindow>;
        protected var _Str_610:Boolean = false;
        protected var _Str_5058:WindowRectLimits;
        protected var _Str_9238:Boolean = false;
        private var _Str_9367:DynamicStyle;
        private var _Str_10190:Boolean = false;
        private var _Str_5110:Rectangle;
        private var _Str_2995:uint;
        private var _Str_8085:IPropertyMap;

        public function WindowController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0, _arg_12:String="")
        {
            var _local_15:uint;
            this._Str_2995 = _Str_10736++;
            var _local_13:XML = _arg_5.getWindowFactory()._Str_19128(_arg_2, _arg_3);
            if (_arg_6 == null)
            {
                _arg_6 = new Rectangle(0, 0, ((_local_13) ? int(_local_13.attribute("width")) : 10), ((_local_13) ? int(_local_13.attribute("height")) : 10));
            }
            this._Str_8085 = _arg_5.getWindowFactory().getThemeManager().getPropertyDefaults(_arg_3);
            super(_arg_11, k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_10, _arg_12);
            if (!this._Str_2624)
            {
                this._Str_2624 = this.getGraphicContext((!(testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))));
            }
            this._Str_5110 = new Rectangle();
            if (_local_13 != null)
            {
                _initialRect = new Rectangle(0, 0, int(_local_13.attribute("width")), int(_local_13.attribute("height")));
                _previousRect = _initialRect.clone();
                _x = _initialRect.x;
                _y = _initialRect.y;
                _w = _initialRect.width;
                _h = _initialRect.height;
                _arg_5.getWindowParser().parseAndConstruct(_local_13, this, null);
                _local_15 = _param;
                _param = (_param & (~(WindowParam.WINDOW_PARAM_REFLECT_RESIZE_TO_PARENT)));
                this.setRectangle(_arg_6.x, _arg_6.y, _arg_6.width, _arg_6.height);
                _param = _local_15;
                _previousRect.x = _arg_6.x;
                _previousRect.y = _arg_6.y;
                _previousRect.width = _arg_6.width;
                _previousRect.height = _arg_6.height;
            }
            var _local_14:DefaultAttStruct = _arg_5.getWindowFactory()._Str_20294(_arg_2, _arg_3);
            if (_local_14)
            {
                _blend = _local_14.blend;
                _mouseThreshold = _local_14.threshold;
                if (_background != _local_14.background)
                {
                    this.background = _local_14.background;
                }
                if (_fillColor != _local_14.color)
                {
                    this.color = _local_14.color;
                }
                if (_local_14._Str_24281())
                {
                    WindowRectLimits(this.limits).assign(_local_14.width_min, _local_14.width_max, _local_14.height_min, _local_14.height_max);
                }
            }
            if (_arg_9)
            {
                this.properties = _arg_9;
            }
            this._Str_6620 = _arg_8;
            if (_arg_7 != null)
            {
                this._parent = (_arg_7 as WindowController);
                WindowController(_arg_7).addChild(this);
                if (this._Str_2624)
                {
                    _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
                }
            }
        }

        private static function _Str_23737(k:WindowController, _arg_2:Rectangle):void
        {
            var _local_3:Rectangle = new Rectangle();
            k.getGlobalRectangle(_local_3);
            var _local_4:int = k.numChildren;
            var _local_5:int = _local_3.x;
            var _local_6:int = _local_3.y;
            _arg_2.left = ((_local_5 < _arg_2.left) ? _local_5 : _arg_2.left);
            _arg_2.top = ((_local_6 < _arg_2.top) ? _local_6 : _arg_2.top);
            _arg_2.right = ((_local_3.right > _arg_2.right) ? _local_3.right : _arg_2.right);
            _arg_2.bottom = ((_local_3.bottom > _arg_2.bottom) ? _local_3.bottom : _arg_2.bottom);
            var _local_7:int;
            while (_local_7 < _local_4)
            {
                WindowController._Str_23737((k.getChildAt(_local_7) as WindowController), _arg_2);
                _local_7++;
            }
        }

        public static function _Str_9294(k:WindowController, _arg_2:IWindow):void
        {
            var _local_8:uint;
            var _local_9:uint;
            var _local_10:uint;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int = k.width;
            var _local_6:int = k.height;
            var _local_7:Boolean;
            if (_arg_2.x < 0)
            {
                _local_3 = _arg_2.x;
                _local_5 = (_local_5 - _local_3);
                _arg_2.x = 0;
                _local_7 = true;
            }
            if (_arg_2.right > _local_5)
            {
                _local_5 = (_arg_2.x + _arg_2.width);
                _local_7 = true;
            }
            if (_arg_2.y < 0)
            {
                _local_4 = _arg_2.y;
                _local_6 = (_local_6 - _local_4);
                _arg_2.y = 0;
                _local_7 = true;
            }
            if (_arg_2.bottom > _local_6)
            {
                _local_6 = (_arg_2.y + _arg_2.height);
                _local_7 = true;
            }
            if (_local_7)
            {
                _local_8 = (k.param & (WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN));
                if (_local_8)
                {
                    k.setParamFlag(_local_8, false);
                }
                k.setRectangle((k.x + _local_3), (k.y + _local_4), _local_5, _local_6);
                if (((!(_local_4 == 0)) || (!(_local_3 == 0))))
                {
                    _local_10 = k.numChildren;
                    _local_9 = 0;
                    while (_local_9 < _local_10)
                    {
                        IWindow(k.getChildAt(_local_9)).offset(-(_local_3), -(_local_4));
                        _local_9++;
                    }
                }
                if (_local_8)
                {
                    k.setParamFlag(_local_8, true);
                }
            }
        }

        public static function resizeToAccommodateChildren(k:WindowController):void
        {
            var _local_2:uint;
            var _local_7:IWindow;
            var _local_10:uint;
            var _local_11:Boolean;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int = int.MIN_VALUE;
            var _local_6:int = int.MIN_VALUE;
            var _local_8:Boolean;
            var _local_9:uint = k.numChildren;
            _local_2 = 0;
            while (_local_2 < _local_9)
            {
                _local_7 = k.getChildAt(_local_2);
                if ((_local_7.x + _local_7.width) > _local_5)
                {
                    _local_5 = (_local_7.x + _local_7.width);
                    _local_8 = true;
                }
                if ((_local_7.y + _local_7.height) > _local_6)
                {
                    _local_6 = (_local_7.y + _local_7.height);
                    _local_8 = true;
                }
                _local_2++;
            }
            if (_local_8)
            {
                _local_10 = (k.param & (WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN));
                if (_local_10)
                {
                    k.setParamFlag(_local_10, false);
                }
                if (((!(_local_3 == 0)) || (!(_local_4 == 0))))
                {
                    _local_2 = 0;
                    while (_local_2 < _local_9)
                    {
                        _local_7 = k.getChildAt(_local_2);
                        _local_11 = _local_7.testParamFlag(WindowParam.WINDOW_PARAM_BOUND_TO_PARENT_RECT);
                        if (_local_11)
                        {
                            _local_7.setParamFlag(WindowParam.WINDOW_PARAM_BOUND_TO_PARENT_RECT, false);
                        }
                        _local_7.offset(-(_local_3), -(_local_4));
                        if (_local_11)
                        {
                            _local_7.setParamFlag(WindowParam.WINDOW_PARAM_BOUND_TO_PARENT_RECT, true);
                        }
                        _local_2++;
                    }
                }
                k.width = _local_5;
                k.height = _local_6;
                if (_local_10)
                {
                    k.setParamFlag(_local_10, true);
                }
            }
        }


        public function get properties():Array
        {
            return [];
        }

        public function get procedure():Function
        {
            return (this._Str_6620 != null) ? this._Str_6620 : ((this._parent != null) ? this._parent.procedure : this._Str_20825);
        }

        public function get filters():Array
        {
            return (this._Str_4453()) ? this.getGraphicContext(true).filters : [];
        }

        public function get parent():IWindow
        {
            return this._parent;
        }

        public function get debug():Boolean
        {
            return this._Str_610;
        }

        public function get limits():IRectLimiter
        {
            return (this._Str_5058) ? this._Str_5058 : this._Str_5058 = new WindowRectLimits(this);
        }

        public function get immediateClickMode():Boolean
        {
            return this._Str_9238;
        }

        public function set x(k:int):void
        {
            if (k != _x)
            {
                this.setRectangle(k, _y, _w, _h);
            }
        }

        public function set y(k:int):void
        {
            if (k != _y)
            {
                this.setRectangle(_x, k, _w, _h);
            }
        }

        public function set id(k:int):void
        {
            _id = k;
        }

        public function set name(k:String):void
        {
            _name = k;
        }

        public function set width(k:int):void
        {
            if (k != _w)
            {
                this.setRectangle(_x, _y, k, _h);
            }
        }

        public function set height(k:int):void
        {
            if (k != _h)
            {
                this.setRectangle(_x, _y, _w, k);
            }
        }

        public function set position(k:Point):void
        {
            this.setRectangle(k.x, k.y, _w, _h);
        }

        public function set rectangle(k:Rectangle):void
        {
            this.setRectangle(k.x, k.y, k.width, k.height);
        }

        public function set background(k:Boolean):void
        {
            _background = k;
            _fillColor = ((_background) ? (_fillColor | _alphaColor) : (_fillColor & 0xFFFFFF));
            this._Str_3781 = ((this._Str_3781) || (k));
            _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
        }

        public function set color(k:uint):void
        {
            _alphaColor = (k & 0xFF000000);
            _fillColor = ((_background) ? k : (k & 0xFFFFFF));
            _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
        }

        public function set alpha(k:uint):void
        {
            _alphaColor = (k << 24);
            _fillColor = ((_background) ? (_alphaColor | _fillColor) : (0xFFFFFF & _fillColor));
            _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
        }

        public function set blend(k:Number):void
        {
            k = ((k > 1) ? 1 : ((k < 0) ? 0 : k));
            if (k != _blend)
            {
                _blend = k;
                _context.invalidate(this, null, WindowRedrawFlag.BLEND);
            }
        }

        public function set visible(k:Boolean):void
        {
            var _local_2:WindowEvent;
            if (k != _visible)
            {
                _visible = k;
                if (((this._Str_2624) && (!(k))))
                {
                    this._Str_2624.visible = false;
                }
                _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
                _local_2 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHILD_VISIBILITY, this, this);
                this.update(this, _local_2);
                _local_2.recycle();
            }
        }

        public function set type(k:uint):void
        {
            if (k != _type)
            {
                _type = k;
                _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
            }
        }

        public function set caption(k:String):void
        {
            k = ((k) ? k : "");
            if (k != caption)
            {
                _caption = k;
                _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
            }
        }

        public function set tags(k:Array):void
        {
            if (k != null)
            {
                _tags = k;
            }
        }

        public function set mouseThreshold(k:uint):void
        {
            _mouseThreshold = ((k > 0xFF) ? 0xFF : k);
        }

        public function set procedure(k:Function):void
        {
            this._Str_6620 = k;
        }

        public function set filters(k:Array):void
        {
            if (this._Str_4453())
            {
                this.getGraphicContext(true).filters = k;
            }
        }

        public function set debug(k:Boolean):void
        {
            this._Str_610 = k;
        }

        public function set properties(k:Array):void
        {
        }

        public function set offsetX(k:int):void
        {
            _offsetX = k;
        }

        public function set offsetY(k:int):void
        {
            _offsetY = k;
        }

        public function set etching(k:Array):void
        {
        }

        public function set state(k:uint):void
        {
            if (k != _state)
            {
                _state = k;
                _context.invalidate(this, null, WindowRedrawFlag.STATE);
            }
        }

        public function set _Str_6120(k:ColorTransform):void
        {
            _dynamicStyleColorTransform = k;
        }

        public function get _Str_6120():ColorTransform
        {
            return _dynamicStyleColorTransform;
        }

        public function set style(k:uint):void
        {
            var _local_2:Array;
            var _local_3:uint;
            var _local_4:WindowController;
            if (k != _style)
            {
                _style = k;
                _local_2 = new Array();
                this.groupChildrenWithTag(WindowController.TAG_INTERNAL, _local_2);
                _local_3 = _local_2.length;
                while (--_local_3 > -1)
                {
                    _local_4 = (_local_2[_local_3] as WindowController);
                    if (_local_4.tags.indexOf(_IGNORE_INHERITED_STYLE) == -1)
                    {
                        _local_4.style = _style;
                    }
                }
                _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
                this._Str_8085 = _context.getWindowFactory().getThemeManager().getPropertyDefaults(_style);
            }
        }

        public function set dynamicStyle(k:String):void
        {
            _dynamicStyle = k;
            _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
        }

        public function set clipping(k:Boolean):void
        {
            if (k != _clipping)
            {
                _clipping = k;
                _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
            }
        }

        public function get host():IWindow
        {
            return (this._parent == this.desktop) ? this : this._parent.host;
        }

        public function get desktop():IDesktopWindow
        {
            return _context.getDesktopWindow();
        }

        public function set parent(k:IWindow):void
        {
            var _local_3:WindowController;
            var _local_4:WindowEvent;
            if (k == this)
            {
                throw (new Error("Attempted to assign self as parent!"));
            }
            if (((!(k == null)) && (!(k.context == _context))))
            {
                _context = WindowContext(k.context);
                if (this._Str_2187)
                {
                    for each (_local_3 in this._Str_2187)
                    {
                        _local_3.parent = this;
                    }
                }
            }
            var _local_2:IWindow = this._parent;
            if (this._parent != k)
            {
                if (this._parent != null)
                {
                    this._parent.removeChild(this);
                }
                this._parent = WindowController(k);
                if (this._parent != null)
                {
                    this._Str_5110 = this._parent.rectangle;
                    _previousRect.x = _x;
                    _previousRect.y = _y;
                    _previousRect.width = _w;
                    _previousRect.height = _h;
                    _local_4 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_PARENT_ADDED, this, this._parent);
                    this.update(this, _local_4);
                }
                else
                {
                    this._Str_5110.x = 0;
                    this._Str_5110.y = 0;
                    this._Str_5110.width = 0;
                    this._Str_5110.height = 0;
                    _local_4 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_PARENT_REMOVED, this, _local_2);
                    this.update(this, _local_4);
                }
                _local_4.recycle();
            }
        }

        public function _Str_4453():Boolean
        {
            return (!(this._Str_2624 == null)) || (!(testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT)));
        }

        public function getGraphicContext(k:Boolean):IGraphicContext
        {
            if (((k) && (!(this._Str_2624))))
            {
                this._Str_2624 = new GraphicContext((("GC {" + _name) + "}"), GraphicContext.GC_TYPE_BITMAP, new Rectangle(_x, _y, _w, _h));
                this._Str_2624.visible = _visible;
            }
            return this._Str_2624;
        }

        public function setupGraphicsContext():IGraphicContext
        {
            var k:int;
            var _local_2:WindowController;
            this._Str_2624 = this.getGraphicContext(true);
            if (this._parent)
            {
                this._parent.setupGraphicsContext();
            }
            if (((this._Str_2187) && (this._Str_2187.length > 0)))
            {
                if (this._Str_2624._Str_13711 != this.numChildren)
                {
                    k = 0;
                    for each (_local_2 in this._Str_2187)
                    {
                        this._Str_2624._Str_16175(_local_2.getGraphicContext(true), k++);
                    }
                }
            }
            this._Str_10190 = true;
            return this._Str_2624;
        }

        public function _Str_26385():void
        {
            this._Str_10190 = false;
            if (this._Str_2624)
            {
            }
        }

        public function clone():IWindow
        {
            var k:Class = Object(this).constructor;
            var _local_2:WindowController = (new k(_name, _type, _style, _param, _context, new Rectangle(_x, _y, _w, _h), null, this._Str_6620, this.properties, ((_tags) ? _tags.concat() : (null)), _id) as WindowController);
            _local_2.dynamicStyle = _dynamicStyle;
            _local_2._mouseThreshold = _mouseThreshold;
            _local_2._Str_3781 = this._Str_3781;
            _local_2._Str_610 = this._Str_610;
            _local_2._Str_5110 = this._Str_5110.clone();
            _local_2._x = _x;
            _local_2._y = _y;
            _local_2._w = _w;
            _local_2._h = _h;
            _local_2._initialRect = _initialRect.clone();
            _local_2._previousRect = _previousRect.clone();
            _local_2._minimizedRect = ((_minimizedRect) ? _minimizedRect.clone() : null);
            _local_2._maximizedRect = ((_maximizedRect) ? _maximizedRect.clone() : null);
            _local_2._Str_5058 = ((this._Str_5058) ? this._Str_5058.clone(_local_2) : null);
            _local_2._context = _context;
            _local_2._fillColor = _fillColor;
            _local_2._alphaColor = _alphaColor;
            _local_2.clipping = _clipping;
            _local_2._visible = _visible;
            _local_2._blend = _blend;
            _local_2._param = _param;
            _local_2._state = _state;
            _local_2._name = _name;
            _local_2._id = _id;
            _local_2.caption = _caption;
            _local_2.background = _background;
            this.cloneChildWindows(_local_2);
            return _local_2;
        }

        protected function cloneChildWindows(k:WindowController):void
        {
            var _local_2:WindowController;
            if (this._Str_2187)
            {
                for each (_local_2 in this._Str_2187)
                {
                    if (_local_2.tags.indexOf(WindowController.TAG_EXCLUDE) == -1)
                    {
                        k.addChild(_local_2.clone());
                    }
                }
            }
        }

        override public function dispose():void
        {
            var k:WindowDisposeEvent;
            if (!_disposed)
            {
                this.immediateClickMode = false;
                this._Str_6620 = null;
                if (!_context.disposed)
                {
                    if (!this._Str_25369())
                    {
                        if (this.getStateFlag(WindowState.ACTIVE))
                        {
                            this.deactivate();
                        }
                    }
                }
                if (this._Str_2187)
                {
                    while (this._Str_2187.length > 0)
                    {
                        IDisposable(this._Str_2187.pop()).dispose();
                    }
                }
                this._Str_2187 = null;
                if (this.parent)
                {
                    this.parent = null;
                }
                if (this._Str_759)
                {
                    k = WindowDisposeEvent.allocate(this);
                    this._Str_759.dispatchEvent(k);
                    k.recycle();
                    if ((this._Str_759 is IDisposable))
                    {
                        IDisposable(this._Str_759).dispose();
                        this._Str_759 = null;
                    }
                }
                if (this._Str_2624 != null)
                {
                    this._Str_2624.dispose();
                    this._Str_2624 = null;
                }
                super.dispose();
            }
        }

        public function toString():String
        {
            return (((((("[" + "Window ") + getQualifiedClassName(this)) + " ") + _name) + " ") + this._Str_2995) + "]";
        }

        override public function invalidate(k:Rectangle=null):void
        {
            _context.invalidate(this, k, WindowRedrawFlag.REDRAW);
        }

        public function _Str_25488():uint
        {
            return 0;
        }

        public function center():void
        {
            if (this._parent != null)
            {
                this.x = ((this._parent.width / 2) - (_w / 2));
                this.y = ((this._parent.height / 2) - (_h / 2));
            }
        }

        public function setRectangle(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            var _local_7:uint;
            var _local_8:WindowEvent;
            if (this._Str_5058)
            {
                _arg_4 = Math.max(this._Str_5058.minHeight, _arg_4);
                _arg_4 = Math.min(this._Str_5058.maxHeight, _arg_4);
                _arg_3 = Math.max(this._Str_5058.minWidth, _arg_3);
                _arg_3 = Math.min(this._Str_5058.maxWidth, _arg_3);
            }
            var _local_5:Boolean = ((!(k == _x)) || (!(_arg_2 == _y)));
            var _local_6:Boolean = ((!(_arg_3 == _w)) || (!(_arg_4 == _h)));
            if (((_local_6) && (!(_local_5))))
            {
                _local_7 = (_param & WindowParam.WINDOW_PARAM_ON_RESIZE_ALIGN_HORIZONTAL);
                if (_local_7 == WindowParam.WINDOW_PARAM_ON_RESIZE_ALIGN_CENTER)
                {
                    k = (k - ((_arg_3 - _w) / 2));
                    _local_5 = true;
                }
                else
                {
                    if (_local_7 == WindowParam.WINDOW_PARAM_ON_RESIZE_ALIGN_RIGHT)
                    {
                        k = (k - (_arg_3 - _w));
                        _local_5 = true;
                    }
                }
                _local_7 = (_param & WindowParam.WINDOW_PARAM_ON_RESIZE_ALIGN_VERTICAL);
                if (_local_7 == WindowParam.WINDOW_PARAM_ON_RESIZE_ALIGN_MIDDLE)
                {
                    _arg_2 = (_arg_2 - ((_arg_4 - _h) / 2));
                    _local_5 = true;
                }
                else
                {
                    if (_local_7 == WindowParam.WINDOW_PARAM_ON_RESIZE_ALIGN_BOTTOM)
                    {
                        _arg_2 = (_arg_2 - (_arg_4 - _h));
                        _local_5 = true;
                    }
                }
            }
            if (testParamFlag(WindowParam.WINDOW_PARAM_BOUND_TO_PARENT_RECT))
            {
                if (this._parent != null)
                {
                    k = ((k < 0) ? 0 : k);
                    _arg_2 = ((_arg_2 < 0) ? 0 : _arg_2);
                    if (_local_5)
                    {
                        k = (k - (((k + _arg_3) > this._parent.width) ? ((k + _arg_3) - this._parent.width) : 0));
                        _arg_2 = (_arg_2 - (((_arg_2 + _arg_4) > this._parent.height) ? ((_arg_2 + _arg_4) - this._parent.height) : 0));
                        _local_5 = ((!(k == _x)) || (!(_arg_2 == _y)));
                    }
                    else
                    {
                        _arg_3 = (_arg_3 - (((k + _arg_3) > this._parent.width) ? ((k + _arg_3) - this._parent.width) : 0));
                        _arg_4 = (_arg_4 - (((_arg_2 + _arg_4) > this._parent.height) ? ((_arg_2 + _arg_4) - this._parent.height) : 0));
                        _local_6 = ((!(_arg_3 == _w)) || (!(_arg_4 == _h)));
                    }
                }
            }
            if (((_local_5) || (_local_6)))
            {
                if (_local_5)
                {
                    _local_8 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RELOCATE, this, null, true);
                    this.update(this, _local_8);
                    if (_local_8.isWindowOperationPrevented())
                    {
                        _local_5 = false;
                    }
                    _local_8.recycle();
                }
                if (_local_6)
                {
                    _local_8 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RESIZE, this, null, true);
                    this.update(this, _local_8);
                    if (_local_8.isWindowOperationPrevented())
                    {
                        _local_6 = false;
                    }
                    _local_8.recycle();
                }
                if (_local_5)
                {
                    _previousRect.x = _x;
                    _previousRect.y = _y;
                    _previousRect.width = _w;
                    _previousRect.height = _h;
                    _x = k;
                    _y = _arg_2;
                }
                if (_local_6)
                {
                    _previousRect.width = _w;
                    _previousRect.height = _h;
                    _w = _arg_3;
                    _h = _arg_4;
                }
                if (_local_5)
                {
                    _local_8 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RELOCATED, this, null);
                    this.update(this, _local_8);
                    _local_8.recycle();
                }
                if (_local_6)
                {
                    _local_8 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RESIZED, this, null);
                    this.update(this, _local_8);
                    _local_8.recycle();
                }
            }
        }

        public function _Str_22290(k:Rectangle=null, _arg_2:Rectangle=null, _arg_3:Rectangle=null, _arg_4:Rectangle=null):void
        {
            if (k != null)
            {
                k.x = _x;
                k.y = _y;
                k.width = _w;
                k.height = _h;
            }
            if (_arg_2 != null)
            {
                _arg_2.x = _previousRect.x;
                _arg_2.y = _previousRect.y;
                _arg_2.width = _previousRect.width;
                _arg_2.height = _previousRect.height;
            }
            if (((!(_arg_3 == null)) && (!(_minimizedRect == null))))
            {
                _arg_3.x = _minimizedRect.x;
                _arg_3.y = _minimizedRect.y;
                _arg_3.width = _minimizedRect.width;
                _arg_3.height = _minimizedRect.height;
            }
            if (((!(_arg_4 == null)) && (!(_maximizedRect == null))))
            {
                _arg_4.x = _maximizedRect.x;
                _arg_4.y = _maximizedRect.y;
                _arg_4.width = _maximizedRect.width;
                _arg_4.height = _maximizedRect.height;
            }
        }

        public function _Str_26163(k:Rectangle=null, _arg_2:Rectangle=null, _arg_3:Rectangle=null):void
        {
            if (_arg_3 != null)
            {
                if (((_arg_3.width < 0) || (_arg_3.height < 0)))
                {
                    throw (new Error("Invalid rectangle; maximized size can't be less than zero!"));
                }
                if (_maximizedRect == null)
                {
                    _maximizedRect = new Rectangle();
                }
                _maximizedRect.x = _arg_3.x;
                _maximizedRect.y = _arg_3.y;
                _maximizedRect.width = _arg_3.width;
                _maximizedRect.height = _arg_3.height;
            }
            if (_arg_2 != null)
            {
                if (((_arg_2.width < 0) || (_arg_2.height < 0)))
                {
                    throw (new Error("Invalid rectangle; minimized size can't be less than zero!"));
                }
                if (_minimizedRect == null)
                {
                    _minimizedRect = new Rectangle();
                }
                _minimizedRect.x = _arg_2.x;
                _minimizedRect.y = _arg_2.y;
                _minimizedRect.width = _arg_2.width;
                _minimizedRect.height = _arg_2.height;
            }
            if (((_arg_3.width < _arg_2.width) || (_arg_3.height < _arg_2.height)))
            {
                _arg_3.width = _arg_2.width;
                _arg_3.height = _arg_2.height;
                throw (new Error("Maximized rectangle can't be smaller than minimized rectangle!"));
            }
            if (k != null)
            {
                this.setRectangle(k.x, k.y, k.width, k.height);
            }
        }

        public function buildFromXML(k:XML, _arg_2:Map=null):Boolean
        {
            return !(_context.getWindowParser().parseAndConstruct(k, this, _arg_2) == null);
        }

        public function fetchDrawBuffer():IBitmapDrawable
        {
            return (testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT)) ? ((this._parent != null) ? this._parent.fetchDrawBuffer() : null) : (this.getGraphicContext(true).fetchDrawBuffer());
        }

        public function getDrawRegion(k:Rectangle):void
        {
            if (!testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))
            {
                k.x = 0;
                k.y = 0;
                k.width = _w;
                k.height = _h;
            }
            else
            {
                if (this._parent != null)
                {
                    this._parent.getDrawRegion(k);
                    k.x = (k.x + _x);
                    k.y = (k.y + _y);
                    k.width = _w;
                    k.height = _h;
                }
                else
                {
                    k.x = 0;
                    k.y = 0;
                    k.width = 0;
                    k.height = 0;
                }
            }
        }

        public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            var _local_3:IWindow;
            var _local_4:IMouseListenerService;
            var _local_5:WindowEvent;
            var _local_6:uint;
            if (!testParamFlag(WindowParam.WINDOW_PARAM_INTERNAL_EVENT_HANDLING))
            {
                this.procedure(_arg_2, this);
                if (_disposed)
                {
                    return true;
                }
                if (!_arg_2.isWindowOperationPrevented())
                {
                    if (this.hasEventListener(_arg_2.type))
                    {
                        this._Str_759.dispatchEvent(_arg_2);
                        if (_disposed)
                        {
                            return true;
                        }
                    }
                }
                if (_arg_2.cancelable)
                {
                    if (_arg_2.isWindowOperationPrevented())
                    {
                        return true;
                    }
                }
            }
            if ((_arg_2 is WindowMouseEvent))
            {
                switch (_arg_2.type)
                {
                    case WindowMouseEvent.DOWN:
                        if (this.activate())
                        {
                            if (_arg_2.cancelable)
                            {
                                _arg_2.preventDefault();
                            }
                        }
                        if (disposed)
                        {
                            return true;
                        }
                        this.setStateFlag(WindowState.PRESSED, true);
                        _local_4 = _context.getWindowServices().getMouseListenerService();
                        _local_4.begin(this);
                        _local_4.eventTypes.push(WindowMouseEvent.UP);
                        _local_4._Str_14321 = MouseListenerType.EVENTS_OUTSIDE_WINDOW;
                        if (testParamFlag(WindowParam.WINDOW_PARAM_MOUSE_DRAGGING_TRIGGER))
                        {
                            _local_3 = this;
                            while (_local_3 != null)
                            {
                                if (_local_3.testParamFlag(WindowParam.WINDOW_PARAM_MOUSE_DRAGGING_TARGET))
                                {
                                    _context.getWindowServices().getMouseDraggingService().begin(_local_3);
                                    break;
                                }
                                _local_3 = _local_3.parent;
                            }
                        }
                        if ((_param & WindowParam.WINDOW_PARAM_MOUSE_SCALING_TRIGGER) > 0)
                        {
                            _local_3 = this;
                            while (_local_3 != null)
                            {
                                if (_local_3.testParamFlag(WindowParam.WINDOW_PARAM_MOUSE_SCALING_TARGET))
                                {
                                    _context.getWindowServices().getMouseScalingService().begin(_local_3, (_param & WindowParam.WINDOW_PARAM_MOUSE_SCALING_TRIGGER));
                                    break;
                                }
                                _local_3 = _local_3.parent;
                            }
                        }
                        break;
                    case WindowMouseEvent.UP:
                        if (testStateFlag(WindowState.PRESSED))
                        {
                            this.setStateFlag(WindowState.PRESSED, false);
                        }
                        _context.getWindowServices().getMouseListenerService().end(this);
                        if (testParamFlag(WindowParam.WINDOW_PARAM_MOUSE_DRAGGING_TARGET))
                        {
                            _context.getWindowServices().getMouseDraggingService().end(this);
                        }
                        if (testParamFlag(WindowParam.WINDOW_PARAM_MOUSE_SCALING_TARGET))
                        {
                            _context.getWindowServices().getMouseScalingService().end(this);
                        }
                        break;
                    case WindowMouseEvent.OUT:
                        if (testStateFlag(WindowState.HOVERING))
                        {
                            this.setStateFlag(WindowState.HOVERING, false);
                        }
                        if (testStateFlag(WindowState.PRESSED))
                        {
                            this.setStateFlag(WindowState.PRESSED, false);
                        }
                        break;
                    case WindowMouseEvent.OVER:
                        if (!testStateFlag(WindowState.HOVERING))
                        {
                            this.setStateFlag(WindowState.HOVERING, true);
                        }
                        break;
                    case WindowMouseEvent.WHEEL:
                        return false;
                }
            }
            else
            {
                if ((_arg_2 is WindowEvent))
                {
                    switch (_arg_2.type)
                    {
                        case WindowEvent.WINDOW_EVENT_RESIZED:
                            if (k == this)
                            {
                                _Str_4232.x = ((_x < _previousRect.x) ? _x : _previousRect.x);
                                _Str_4232.y = ((_y < _previousRect.y) ? _y : _previousRect.y);
                                _Str_4232.right = (((_x + _w) > _previousRect.right) ? (_x + _w) : _previousRect.right);
                                _Str_4232.bottom = (((_y + _h) > _previousRect.bottom) ? (_y + _h) : _previousRect.bottom);
                                _Str_4232.offset(-(_x), -(_y));
                                _context.invalidate(this, _Str_4232, WindowRedrawFlag.RESIZE);
                                _local_5 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_PARENT_RESIZED, this, null);
                                this._Str_16194(_local_5);
                                _local_5.recycle();
                                if (testParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER, WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER))
                                {
                                    this._Str_10618();
                                }
                                else
                                {
                                    if (testParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER, WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER))
                                    {
                                        this._Str_10618();
                                    }
                                }
                                if (this._parent != null)
                                {
                                    _local_6 = _param;
                                    _param = (_param & (~(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER)));
                                    if (testParamFlag(WindowParam.WINDOW_PARAM_REFLECT_HORIZONTAL_RESIZE_TO_PARENT))
                                    {
                                        this._parent.width = (this._parent.width + (_w - _previousRect.width));
                                    }
                                    if (testParamFlag(WindowParam.WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT))
                                    {
                                        this._parent.height = (this._parent.height + (_h - _previousRect.height));
                                    }
                                    _param = _local_6;
                                    _local_5 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHILD_RESIZED, this._parent, this);
                                    this._parent.update(this, _local_5);
                                    _local_5.recycle();
                                }
                            }
                            break;
                        case WindowEvent.WINDOW_EVENT_RELOCATED:
                            if (k == this)
                            {
                                _Str_4232.x = ((_x < _previousRect.x) ? _x : _previousRect.x);
                                _Str_4232.y = ((_y < _previousRect.y) ? _y : _previousRect.y);
                                _Str_4232.right = (((_x + _w) > _previousRect.right) ? (_x + _w) : _previousRect.right);
                                _Str_4232.bottom = (((_y + _h) > _previousRect.bottom) ? (_y + _h) : _previousRect.bottom);
                                _Str_4232.offset(-(_x), -(_y));
                                _context.invalidate(this, _Str_4232, WindowRedrawFlag.RELOCATE);
                                _local_5 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_PARENT_RELOCATED, this, null);
                                this._Str_16194(_local_5);
                                _local_5.recycle();
                                if (this._parent != null)
                                {
                                    _local_5 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHILD_RELOCATED, this._parent, this);
                                    this._parent.update(this, _local_5);
                                    _local_5.recycle();
                                }
                            }
                            break;
                        case WindowEvent.WINDOW_EVENT_ACTIVATED:
                            if (k == this)
                            {
                                _local_5 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_PARENT_ACTIVATED, this, null);
                                this._Str_16194(_local_5);
                                _local_5.recycle();
                                if (this._parent != null)
                                {
                                    _local_5 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHILD_ACTIVATED, this._parent, this);
                                    this._parent.update(this, _local_5);
                                    _local_5.recycle();
                                }
                            }
                            break;
                        case WindowEvent.WINDOW_EVENT_PARENT_ADDED:
                            if (testParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER, WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER))
                            {
                                this._Str_10618();
                            }
                            else
                            {
                                if (testParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER, WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER))
                                {
                                    this._Str_10618();
                                }
                            }
                            _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
                            break;
                        case WindowEvent.WINDOW_EVENT_PARENT_RESIZED:
                            this._parent._Str_22290(null, this._Str_5110);
                            this._Str_10618();
                            break;
                        case WindowEvent.WINDOW_EVENT_CHILD_ADDED:
                            if (testParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN))
                            {
                                this._Str_14067();
                            }
                            else
                            {
                                if (testParamFlag(WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN))
                                {
                                    _Str_9294(this, _arg_2.related);
                                }
                            }
                            this._Str_19941();
                            break;
                        case WindowEvent.WINDOW_EVENT_CHILD_REMOVED:
                            if (testParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN))
                            {
                                this._Str_14067();
                            }
                            break;
                        case WindowEvent.WINDOW_EVENT_CHILD_ACTIVATED:
                            this.activate();
                            break;
                        case WindowEvent.WINDOW_EVENT_CHILD_RESIZED:
                            if (testParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN))
                            {
                                this._Str_14067();
                            }
                            else
                            {
                                if (testParamFlag(WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN))
                                {
                                    _Str_9294(this, _arg_2.related);
                                }
                            }
                            break;
                        case WindowEvent.WINDOW_EVENT_CHILD_RELOCATED:
                            if (testParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN))
                            {
                                this._Str_14067();
                            }
                            else
                            {
                                if (testParamFlag(WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN))
                                {
                                    _Str_9294(this, _arg_2.related);
                                }
                            }
                            break;
                        case WindowEvent.WINDOW_EVENT_CHILD_VISIBILITY:
                            if (k == this)
                            {
                                if (this._parent != null)
                                {
                                    _local_5 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHILD_VISIBILITY, this._parent, this);
                                    this._parent.update(this, _local_5);
                                    _local_5.recycle();
                                }
                            }
                            break;
                    }
                }
            }
            return true;
        }

        private function _Str_19941():void
        {
            var k:uint;
            if (_dynamicStyle == "")
            {
                return;
            }
            if (((!(this._Str_9367)) || (!(this._Str_9367.name == _dynamicStyle))))
            {
                this._Str_9367 = DynamicStyleManager.getStyle(_dynamicStyle);
            }
            if (this.getStateFlag(WindowState.DISABLED))
            {
                k = WindowState.DISABLED;
            }
            else
            {
                if (this.getStateFlag(WindowState.PRESSED))
                {
                    k = WindowState.PRESSED;
                }
                else
                {
                    if (this.getStateFlag(WindowState.HOVERING))
                    {
                        k = WindowState.HOVERING;
                    }
                    else
                    {
                        k = WindowState.DEFAULT;
                    }
                }
            }
            this._Str_20599(this, this._Str_9367, k);
            if (this._Str_2187)
            {
                this._Str_21070(this._Str_2187, k);
            }
        }

        private function _Str_20599(k:WindowController, _arg_2:DynamicStyle, _arg_3:uint):void
        {
            var _local_5:Array;
            var _local_4:Object = _arg_2.getStyleByWindowState(_arg_3);
            k.offsetX = ((_local_4.offsetX) ? _local_4.offsetX : 0);
            k.offsetY = ((_local_4.offsetY) ? _local_4.offsetY : 0);
            if (k._Str_4453())
            {
                k._Str_2624.getDisplayObject().transform.colorTransform = _arg_2.getColorTransform(_arg_3);
            }
            else
            {
                k._dynamicStyleColorTransform = _arg_2.getColorTransform(_arg_3);
                k.invalidate();
            }
            if (_local_4.etchingPoint)
            {
                _local_5 = [_local_4.etchingColor, _local_4.etchingPoint[0], _local_4.etchingPoint[1]];
                k.etching = _local_5;
                k.invalidate();
            }
            else
            {
                k.etching = [0, 0, 1];
                k.invalidate();
            }
        }

        private function _Str_21070(k:Vector.<IWindow>, _arg_2:uint):void
        {
            var _local_3:WindowController;
            for each (_local_3 in k)
            {
                if (this._Str_9367.getChildStyle(_local_3))
                {
                    this._Str_20599(_local_3, this._Str_9367.getChildStyle(_local_3), _arg_2);
                }
                if (_local_3._Str_2187)
                {
                    this._Str_21070(_local_3._Str_2187, _arg_2);
                }
            }
        }

        protected function _Str_21166(k:WindowEvent):void
        {
            this.procedure(k, this);
            if (!k.isWindowOperationPrevented())
            {
                if (this.hasEventListener(k.type))
                {
                    this._Str_759.dispatchEvent(k);
                }
            }
        }

        private function _Str_20825(k:WindowEvent, _arg_2:IWindow):void
        {
        }

        private function _Str_16194(k:WindowEvent):void
        {
            var _local_2:WindowController;
            if (this._Str_2187)
            {
                for each (_local_2 in this._Str_2187)
                {
                    _local_2.update(this, k);
                }
            }
        }

        public function convertPointFromGlobalToLocalSpace(k:Point):void
        {
            var _local_2:Number = k.x;
            var _local_3:Number = k.y;
            if (this._parent == null)
            {
                k.x = _x;
                k.y = _y;
            }
            else
            {
                this._parent.getGlobalPosition(k);
                k.x = (k.x + _x);
                k.y = (k.y + _y);
            }
            k.x = (_local_2 - k.x);
            k.y = (_local_3 - k.y);
        }

        public function convertPointFromLocalToGlobalSpace(k:Point):void
        {
            var _local_2:Number = k.x;
            var _local_3:Number = k.y;
            if (this._parent == null)
            {
                k.x = _x;
                k.y = _y;
            }
            else
            {
                this._parent.getGlobalPosition(k);
                k.x = (k.x + _x);
                k.y = (k.y + _y);
            }
            k.x = (k.x + _local_2);
            k.y = (k.y + _local_3);
        }

        public function getRelativeMousePosition(k:Point):void
        {
            this.getGlobalPosition(k);
            k.x = (_context.getDesktopWindow().mouseX - k.x);
            k.y = (_context.getDesktopWindow().mouseY - k.y);
        }

        public function getAbsoluteMousePosition(k:Point):void
        {
            k.x = _context.getDesktopWindow().mouseX;
            k.y = _context.getDesktopWindow().mouseY;
        }

        public function getLocalPosition(k:Point):void
        {
            k.x = _x;
            k.y = _y;
        }

        public function getLocalRectangle(k:Rectangle):void
        {
            k.x = _x;
            k.y = _y;
            k.width = _w;
            k.height = _h;
        }

        public function hitTestLocalPoint(k:Point):Boolean
        {
            return (((k.x >= _x) && (k.x < (_x + _w))) && (k.y >= _y)) && (k.y < (_y + _h));
        }

        public function hitTestLocalRectangle(k:Rectangle):Boolean
        {
            return rectangle.intersects(k);
        }

        public function _Str_23321(k:Point, _arg_2:BitmapData):Boolean
        {
            return this._Str_21791(k, _arg_2, _mouseThreshold);
        }

        public function getGlobalPosition(k:Point):void
        {
            if (this._parent != null)
            {
                this._parent.getGlobalPosition(k);
                k.x = (k.x + _x);
                k.y = (k.y + _y);
            }
            else
            {
                k.x = _x;
                k.y = _y;
            }
        }

        public function setGlobalPosition(k:Point):void
        {
            var _local_2:Point = new Point();
            if (this._parent != null)
            {
                this._parent.getGlobalPosition(_local_2);
                _local_2.x = (_local_2.x + _x);
                _local_2.y = (_local_2.y + _y);
            }
            else
            {
                _local_2.x = _x;
                _local_2.y = _y;
            }
            this.x = (x + (k.x - _local_2.x));
            this.y = (y + (k.y - _local_2.y));
        }

        public function getGlobalRectangle(k:Rectangle):void
        {
            if (this._parent != null)
            {
                this._parent.getGlobalRectangle(k);
                k.x = (k.x + _x);
                k.y = (k.y + _y);
            }
            else
            {
                k.x = _x;
                k.y = _y;
            }
            k.width = _w;
            k.height = _h;
        }

        public function setGlobalRectangle(k:Rectangle):void
        {
            var _local_2:Point = new Point();
            if (this._parent != null)
            {
                this._parent.getGlobalPosition(_local_2);
                _local_2.x = (_local_2.x + _x);
                _local_2.y = (_local_2.y + _y);
            }
            else
            {
                _local_2.x = _x;
                _local_2.y = _y;
            }
            this.setRectangle((x + (k.x - _local_2.x)), (y + (k.y - _local_2.y)), k.width, k.height);
        }

        public function hitTestGlobalPoint(k:Point):Boolean
        {
            var _local_2:Rectangle = new Rectangle();
            this.getGlobalRectangle(_local_2);
            return _local_2.containsPoint(k);
        }

        public function hitTestGlobalRectangle(k:Rectangle):Boolean
        {
            var _local_2:Rectangle = new Rectangle();
            this.getGlobalRectangle(_local_2);
            return _local_2.intersects(k);
        }

        public function _Str_22545(k:Point, _arg_2:BitmapData):Boolean
        {
            var _local_3:Point = new Point();
            this.getGlobalPosition(_local_3);
            _local_3.x = (k.x - _local_3.x);
            _local_3.y = (k.y - _local_3.y);
            return this._Str_21791(_local_3, _arg_2, _mouseThreshold);
        }

        public function getMouseRegion(k:Rectangle):void
        {
            var _local_2:Rectangle;
            this.getGlobalRectangle(k);
            if (k.width < 0)
            {
                k.width = 0;
            }
            if (k.height < 0)
            {
                k.height = 0;
            }
            if (testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))
            {
                _local_2 = new Rectangle();
                IWindow(this._parent).getMouseRegion(_local_2);
                if (k.left < _local_2.left)
                {
                    k.left = _local_2.left;
                }
                if (k.top < _local_2.top)
                {
                    k.top = _local_2.top;
                }
                if (k.right > _local_2.right)
                {
                    k.right = _local_2.right;
                }
                if (k.bottom > _local_2.bottom)
                {
                    k.bottom = _local_2.bottom;
                }
            }
        }

        protected function _Str_21791(k:Point, _arg_2:BitmapData, _arg_3:uint):Boolean
        {
            var _local_5:BitmapData;
            var _local_4:Boolean;
            if (((_w < 1) || (_h < 1)))
            {
                return false;
            }
            if (((this._Str_3781) && (_mouseThreshold > 0)))
            {
                if (!testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))
                {
                    if (((k.x <= _w) && (k.y <= _h)))
                    {
                        _local_5 = (this.getGraphicContext(true).fetchDrawBuffer() as BitmapData);
                        if (_local_5 != null)
                        {
                            _local_4 = _local_5.hitTest(_Str_13133, _arg_3, k);
                        }
                    }
                }
                else
                {
                    _local_4 = ((_arg_2 != null) ? _arg_2.hitTest(_Str_13133, _arg_3, k) : false);
                }
            }
            else
            {
                if (((k.x >= 0) && (k.x < _w)))
                {
                    if (((k.y >= 0) && (k.y < _h)))
                    {
                        _local_4 = true;
                    }
                }
            }
            return _local_4;
        }

        public function _Str_26170():Boolean
        {
            return true;
        }

        public function resolveVerticalScale():Number
        {
            return _h / _initialRect.height;
        }

        public function resolveHorizontalScale():Number
        {
            return _w / _initialRect.width;
        }

        public function offset(k:Number, _arg_2:Number):void
        {
            this.setRectangle((_x + k), (_y + _arg_2), _w, _h);
        }

        public function scale(k:Number, _arg_2:Number):void
        {
            this.setRectangle(_x, _y, (_w + k), (_h + _arg_2));
        }

        public function _Str_14067():void
        {
            var k:IWindow;
            var _local_8:Array;
            var _local_9:uint;
            if (!this._Str_2187)
            {
                return;
            }
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Boolean;
            var _local_7:uint = (param & (WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN));
            for each (k in this._Str_2187)
            {
                if (k.x < _local_2)
                {
                    _local_4 = (_local_4 - (k.x - _local_2));
                    _local_2 = k.x;
                    _local_6 = true;
                }
                if ((k.x + k.width) > _local_4)
                {
                    _local_4 = (k.x + k.width);
                    _local_6 = true;
                }
                if (k.y < _local_3)
                {
                    _local_5 = (_local_5 - (k.y - _local_3));
                    _local_3 = k.y;
                    _local_6 = true;
                }
                if ((k.y + k.height) > _local_5)
                {
                    _local_5 = (k.y + k.height);
                    _local_6 = true;
                }
            }
            if (_local_6)
            {
                _local_8 = [];
                for each (k in this._Str_2187)
                {
                    _local_9 = (k.param & (WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER));
                    k.setParamFlag(_local_9, false);
                    _local_8.push(_local_9);
                }
                if (_local_7)
                {
                    this.setParamFlag(_local_7, false);
                }
                this.setRectangle((_x + _local_2), (_y + _local_3), _local_4, _local_5);
                for each (k in this._Str_2187)
                {
                    k.offset(-(_local_2), -(_local_3));
                    k.setParamFlag(_local_8.shift(), true);
                }
                if (_local_7)
                {
                    this.setParamFlag(_local_7, true);
                }
            }
        }

        public function getStateFlag(k:uint):Boolean
        {
            return !((_state & k) == 0);
        }

        public function setStateFlag(k:uint, _arg_2:Boolean=true):void
        {
            var _local_3:uint = _state;
            _state = ((_arg_2) ? _state = (_state | k) : _state = (_state & (~(k))));
            if (_state != _local_3)
            {
                this._Str_19941();
                _context.invalidate(this, null, WindowRedrawFlag.STATE);
            }
        }

        public function getStyleFlag(k:uint):Boolean
        {
            return !((_style & k) == 0);
        }

        public function setStyleFlag(k:uint, _arg_2:Boolean=true):void
        {
            var _local_4:Array;
            var _local_5:uint;
            var _local_6:WindowController;
            var _local_3:uint = _style;
            _style = ((_arg_2) ? _style = (_style | k) : _style = (_style & (~(k))));
            if (_style != _local_3)
            {
                _local_4 = new Array();
                this.groupChildrenWithTag(WindowController.TAG_INTERNAL, _local_4);
                _local_5 = _local_4.length;
                while (--_local_5 > -1)
                {
                    _local_6 = (_local_4[_local_5] as WindowController);
                    if (_local_6.tags.indexOf(_IGNORE_INHERITED_STYLE) == -1)
                    {
                        _local_6.style = _style;
                    }
                }
                _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
            }
        }

        public function getParamFlag(k:uint):Boolean
        {
            return !((_param & k) == 0);
        }

        public function setParamFlag(k:uint, _arg_2:Boolean=true):void
        {
            var _local_3:uint = _param;
            _param = ((_arg_2) ? _param = (_param | k) : _param = (_param & (~(k))));
            if (_param != _local_3)
            {
                if (!(_param & WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))
                {
                    if (!this._Str_2624)
                    {
                        this.setupGraphicsContext();
                        _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
                    }
                }
                else
                {
                    if ((_param & WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))
                    {
                        if (this._Str_2624)
                        {
                            _context.invalidate(this, null, WindowRedrawFlag.REDRAW);
                        }
                    }
                }
            }
        }

        protected function _Str_10618():void
        {
            var _local_3:int;
            var _local_4:uint;
            var _local_5:uint;
            if (this._parent == null)
            {
                return;
            }
            var k:* = (!(testParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED, WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER)));
            var _local_2:* = (!(testParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_FIXED, WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER)));
            var _local_6:int = _x;
            var _local_7:int = _y;
            var _local_8:int = _w;
            var _local_9:int = _h;
            if (((k) || (_local_2)))
            {
                if (k)
                {
                    _local_3 = (this._parent.width - this._Str_5110.width);
                    _local_4 = (_param & WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER);
                    if (_local_4 == WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH)
                    {
                        _local_8 = (_local_8 + _local_3);
                    }
                    else
                    {
                        if (_local_4 == WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_MOVE)
                        {
                            _local_6 = (_local_6 + _local_3);
                        }
                        else
                        {
                            if (_local_4 == WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER)
                            {
                                if (((this._parent.width < _local_8) && (this.getParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))))
                                {
                                    _local_6 = 0;
                                }
                                else
                                {
                                    _local_6 = (Math.floor((this._parent.width / 2)) - Math.floor((_local_8 / 2)));
                                }
                            }
                        }
                    }
                }
                if (_local_2)
                {
                    _local_3 = (this._parent.height - this._Str_5110.height);
                    _local_4 = (_param & WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER);
                    if (_local_4 == WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_STRETCH)
                    {
                        _local_9 = (_local_9 + _local_3);
                    }
                    else
                    {
                        if (_local_4 == WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_MOVE)
                        {
                            _local_7 = (_local_7 + _local_3);
                        }
                        else
                        {
                            if (_local_4 == WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER)
                            {
                                if (((this._parent.height < _local_9) && (this.getParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))))
                                {
                                    _local_7 = 0;
                                }
                                else
                                {
                                    _local_7 = (Math.floor((this._parent.height / 2)) - Math.floor((_local_9 / 2)));
                                }
                            }
                        }
                    }
                }
                _local_5 = _param;
                _param = (_param & (~((WindowParam.WINDOW_PARAM_REFLECT_RESIZE_TO_PARENT | WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER) | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER)));
                this.setRectangle(_local_6, _local_7, _local_8, _local_9);
                _param = _local_5;
            }
            else
            {
                if (testParamFlag(WindowParam.WINDOW_PARAM_BOUND_TO_PARENT_RECT))
                {
                    if (this._parent != null)
                    {
                        _local_6 = ((_local_6 < 0) ? 0 : _local_6);
                        _local_7 = ((_local_7 < 0) ? 0 : _local_7);
                        _local_6 = (_local_6 - (((_local_6 + _local_8) > this._parent.width) ? ((_local_6 + _local_8) - this._parent.width) : 0));
                        _local_7 = (_local_7 - (((_local_7 + _local_9) > this._parent.height) ? ((_local_7 + _local_9) - this._parent.height) : 0));
                        _local_8 = (_local_8 - (((_local_6 + _local_8) > this._parent.width) ? ((_local_6 + _local_8) - this._parent.width) : 0));
                        _local_9 = (_local_9 - (((_local_7 + _local_9) > this._parent.height) ? ((_local_7 + _local_9) - this._parent.height) : 0));
                        if (((((!(_local_6 == _x)) || (!(_local_7 == _y))) || (!(_local_8 == _w))) || (!(_local_9 == _h))))
                        {
                            _local_5 = _param;
                            _param = (_param & (~((WindowParam.WINDOW_PARAM_REFLECT_RESIZE_TO_PARENT | WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER) | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER)));
                            this.setRectangle(_local_6, _local_7, _local_8, _local_9);
                            _param = _local_5;
                        }
                    }
                }
            }
        }

        protected function _Str_25369():Boolean
        {
            return !(this._parent == context.getDesktopWindow());
        }

        public function destroy():Boolean
        {
            if (_state == WindowState.DISPOSED)
            {
                return true;
            }
            _state = WindowState.DISPOSED;
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_DESTROY, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_DESTROYED, this, null);
            this.update(this, k);
            k.recycle();
            this.dispose();
            return true;
        }

        public function minimize():Boolean
        {
            if ((_state & WindowState.LOCKED))
            {
                return false;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_MINIMIZE, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.LOCKED, true);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_MINIMIZED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function maximize():Boolean
        {
            if ((_state & WindowState.LOCKED))
            {
                return false;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_MAXIMIZE, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.LOCKED, true);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_MAXIMIZED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function restore():Boolean
        {
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RESTORE, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.LOCKED, false);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RESTORED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function activate():Boolean
        {
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_ACTIVATE, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.ACTIVE, true);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_ACTIVATED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function deactivate():Boolean
        {
            if (!this.getStateFlag(WindowState.ACTIVE))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_DEACTIVATE, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.ACTIVE, false);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_DEACTIVATED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function lock():Boolean
        {
            if (this.getStateFlag(WindowState.LOCKED))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_LOCK, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.LOCKED, true);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_LOCKED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function unlock():Boolean
        {
            if (!this.getStateFlag(WindowState.LOCKED))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_UNLOCK, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.LOCKED, false);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_UNLOCKED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function enable():Boolean
        {
            if (!this.getStateFlag(WindowState.DISABLED))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_ENABLE, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.DISABLED, false);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_ENABLED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function disable():Boolean
        {
            if (this.getStateFlag(WindowState.DISABLED))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_DISABLE, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.DISABLED, true);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_DISABLED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function focus():Boolean
        {
            if (this.getStateFlag(WindowState.FOCUSED))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_FOCUS, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.FOCUSED, true);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_FOCUSED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function unfocus():Boolean
        {
            if (!this.getStateFlag(WindowState.FOCUSED))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_UNFOCUS, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            this.setStateFlag(WindowState.FOCUSED, false);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_UNFOCUSED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function getChildUnderPoint(k:Point):IWindow
        {
            var _local_2:Rectangle;
            var _local_3:Boolean;
            var _local_4:IWindow;
            var _local_5:uint;
            if (_visible)
            {
                _local_2 = new Rectangle();
                this.getMouseRegion(_local_2);
                _local_3 = _local_2.containsPoint(k);
                _local_5 = this.numChildren;
                if (_local_3)
                {
                    while (_local_5 > 0)
                    {
                        _local_4 = WindowController(this._Str_2187[(_local_5 - 1)]).getChildUnderPoint(k);
                        if (_local_4 != null)
                        {
                            return _local_4;
                        }
                        _local_5--;
                    }
                }
                if (this._Str_22545(k, null))
                {
                    return this;
                }
            }
            return null;
        }

        public function groupChildrenUnderPoint(k:Point, _arg_2:Array):void
        {
            var _local_3:WindowController;
            if (_visible)
            {
                if (((((k.x >= _x) && (k.x < (_x + _w))) && (k.y >= _y)) && (k.y < (_y + _h))))
                {
                    _arg_2.push(this);
                    if (this._Str_2187)
                    {
                        k.offset(-(_x), -(_y));
                        for each (_local_3 in this._Str_2187)
                        {
                            _local_3.groupChildrenUnderPoint(k, _arg_2);
                        }
                        k.offset(_x, _y);
                    }
                }
                else
                {
                    if (!_clipping)
                    {
                        if (this._Str_2187)
                        {
                            k.offset(-(_x), -(_y));
                            for each (_local_3 in this._Str_2187)
                            {
                                _local_3.groupChildrenUnderPoint(k, _arg_2);
                            }
                            k.offset(_x, _y);
                        }
                    }
                }
            }
        }

        public function groupParameterFilteredChildrenUnderPoint(k:Point, _arg_2:Array, _arg_3:uint=0):void
        {
            var _local_4:WindowController;
            if (_visible)
            {
                if (((((k.x >= _x) && (k.x < (_x + _w))) && (k.y >= _y)) && (k.y < (_y + _h))))
                {
                    if ((_param & _arg_3) == _arg_3)
                    {
                        _arg_2.push(this);
                    }
                    if (this._Str_2187)
                    {
                        k.offset(-(_x), -(_y));
                        for each (_local_4 in this._Str_2187)
                        {
                            _local_4.groupParameterFilteredChildrenUnderPoint(k, _arg_2, _arg_3);
                        }
                        k.offset(_x, _y);
                    }
                }
                else
                {
                    if (!_clipping)
                    {
                        if (this._Str_2187)
                        {
                            k.offset(-(_x), -(_y));
                            for each (_local_4 in this._Str_2187)
                            {
                                _local_4.groupParameterFilteredChildrenUnderPoint(k, _arg_2, _arg_3);
                            }
                            k.offset(_x, _y);
                        }
                    }
                }
            }
        }

        public function addEventListener(k:String, _arg_2:Function, _arg_3:int=0):void
        {
            if (!_disposed)
            {
                if (!this._Str_759)
                {
                    this._Str_759 = new WindowEventDispatcher(this);
                }
                this._Str_759.addEventListener(k, _arg_2, _arg_3);
            }
        }

        public function hasEventListener(k:String):Boolean
        {
            return ((_disposed) || (!(this._Str_759))) ? false : this._Str_759.hasEventListener(k);
        }

        public function removeEventListener(k:String, _arg_2:Function):void
        {
            if (((!(_disposed)) && (this._Str_759)))
            {
                this._Str_759.removeEventListener(k, _arg_2);
            }
        }

        public function get children():Vector.<IWindow>
        {
            return this._Str_2187;
        }

        public function get numChildren():int
        {
            return (this._Str_2187) ? this._Str_2187.length : 0;
        }

        public function populate(k:Array):void
        {
            var _local_3:WindowController;
            var _local_2:Boolean;
            if (!this._Str_2187)
            {
                this._Str_2187 = new Vector.<IWindow>();
            }
            for each (_local_3 in k)
            {
                if (((_local_3) && (!(_local_3.parent == this))))
                {
                    this._Str_2187.push(_local_3);
                    _local_3.parent = this;
                    _local_2 = ((_local_2) || (_local_3._Str_4453()));
                }
            }
            if (((this._Str_10190) || (_local_2)))
            {
                this.setupGraphicsContext();
            }
        }

        public function addChild(k:IWindow):IWindow
        {
            var _local_2:WindowController = WindowController(k);
            if (_local_2.parent != null)
            {
                WindowController(_local_2.parent).removeChild(_local_2);
            }
            if (!this._Str_2187)
            {
                this._Str_2187 = new Vector.<IWindow>();
            }
            this._Str_2187.push(_local_2);
            _local_2.parent = this;
            if (((this._Str_10190) || (_local_2._Str_4453())))
            {
                this.setupGraphicsContext();
                if (_local_2.getGraphicContext(true).parent != this._Str_2624)
                {
                    this._Str_2624._Str_22175(_local_2.getGraphicContext(true));
                }
            }
            var _local_3:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHILD_ADDED, this, k);
            this.update(this, _local_3);
            _local_3.recycle();
            return k;
        }

        public function addChildAt(k:IWindow, _arg_2:int):IWindow
        {
            var _local_3:WindowController = WindowController(k);
            if (_local_3.parent != null)
            {
                WindowController(_local_3.parent).removeChild(_local_3);
            }
            if (!this._Str_2187)
            {
                this._Str_2187 = new Vector.<IWindow>();
            }
            this._Str_2187.splice(_arg_2, 0, _local_3);
            _local_3.parent = this;
            if (((this._Str_10190) || (_local_3._Str_4453())))
            {
                this.setupGraphicsContext();
                if (_local_3.getGraphicContext(true).parent != this._Str_2624)
                {
                    this._Str_2624._Str_16175(_local_3.getGraphicContext(true), _arg_2);
                }
            }
            var _local_4:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHILD_ADDED, this, k);
            this.update(this, _local_4);
            _local_4.recycle();
            return k;
        }

        public function getChildAt(k:int):IWindow
        {
            return (this._Str_2187) ? (((k < this._Str_2187.length) && (k > -1)) ? this._Str_2187[k] : null) : null;
        }

        public function getChildByID(k:int):IWindow
        {
            var _local_2:IWindow;
            if (this._Str_2187)
            {
                for each (_local_2 in this._Str_2187)
                {
                    if (_local_2.id == k)
                    {
                        return _local_2;
                    }
                }
            }
            return null;
        }

        public function getChildByName(k:String):IWindow
        {
            var _local_2:IWindow;
            if (this._Str_2187)
            {
                for each (_local_2 in this._Str_2187)
                {
                    if (_local_2.name == k)
                    {
                        return _local_2;
                    }
                }
            }
            return null;
        }

        public function findChildByName(k:String):IWindow
        {
            var _local_2:WindowController;
            if (this._Str_2187)
            {
                for each (_local_2 in this._Str_2187)
                {
                    if (_local_2.name == k)
                    {
                        return _local_2;
                    }
                }
                for each (_local_2 in this._Str_2187)
                {
                    _local_2 = (_local_2.findChildByName(k) as WindowController);
                    if (_local_2)
                    {
                        return _local_2 as IWindow;
                    }
                }
            }
            return null;
        }

        public function getChildByTag(k:String):IWindow
        {
            var _local_2:IWindow;
            if (this._Str_2187)
            {
                for each (_local_2 in this._Str_2187)
                {
                    if (_local_2.tags.indexOf(k) > -1)
                    {
                        return _local_2;
                    }
                }
            }
            return null;
        }

        public function findChildByTag(k:String):IWindow
        {
            if (((_tags) && (_tags.indexOf(k) > -1)))
            {
                return this;
            }
            var _local_2:WindowController = WindowController(this.getChildByTag(k));
            if (((_local_2 == null) && (this._Str_2187)))
            {
                for each (_local_2 in this._Str_2187)
                {
                    _local_2 = (_local_2.findChildByTag(k) as WindowController);
                    if (_local_2 != null) break;
                }
            }
            return _local_2 as IWindow;
        }

        public function getChildIndex(k:IWindow):int
        {
            return (this._Str_2187) ? this._Str_2187.indexOf(k) : -1;
        }

        public function removeChild(k:IWindow):IWindow
        {
            if (!this._Str_2187)
            {
                return null;
            }
            var _local_2:int = this._Str_2187.indexOf(k);
            if (_local_2 < 0)
            {
                return null;
            }
            this._Str_2187.splice(_local_2, 1);
            k.parent = null;
            var _local_3:IGraphicContextHost = (k as IGraphicContextHost);
            if (((_local_3) && (_local_3._Str_4453())))
            {
                this._Str_2624._Str_17938(_local_3.getGraphicContext(true));
            }
            var _local_4:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHILD_REMOVED, this, k);
            this.update(this, _local_4);
            _local_4.recycle();
            return k;
        }

        public function removeChildAt(k:int):IWindow
        {
            return this.removeChild(this.getChildAt(k));
        }

        public function setChildIndex(k:IWindow, _arg_2:int):void
        {
            var _local_4:WindowController;
            if (!this._Str_2187)
            {
                return;
            }
            var _local_3:int = this._Str_2187.indexOf(k);
            if (((_local_3 > -1) && (!(_arg_2 == _local_3))))
            {
                this._Str_2187.splice(_local_3, 1);
                this._Str_2187.splice(_arg_2, 0, k);
                _local_4 = WindowController(k);
                if (_local_4._Str_4453())
                {
                    this._Str_2624._Str_19243(_local_4.getGraphicContext(true), this.getChildIndex(_local_4));
                }
            }
        }

        public function swapChildren(k:IWindow, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:IWindow;
            var _local_6:int;
            if (!this._Str_2187)
            {
                return;
            }
            if ((((!(k == null)) && (!(_arg_2 == null))) && (!(k == _arg_2))))
            {
                _local_3 = this._Str_2187.indexOf(k);
                if (_local_3 < 0)
                {
                    return;
                }
                _local_4 = this._Str_2187.indexOf(_arg_2);
                if (_local_4 < 0)
                {
                    return;
                }
                if (_local_4 < _local_3)
                {
                    _local_5 = k;
                    k = _arg_2;
                    _arg_2 = _local_5;
                    _local_6 = _local_3;
                    _local_3 = _local_4;
                    _local_4 = _local_6;
                }
                this._Str_2187.splice(_local_4, 1);
                this._Str_2187.splice(_local_3, 1);
                this._Str_2187.splice(_local_3, 0, _arg_2);
                this._Str_2187.splice(_local_4, 0, k);
                if (((WindowController(k)._Str_4453()) || (WindowController(_arg_2)._Str_4453())))
                {
                    this._Str_2624._Str_20742(WindowController(k).getGraphicContext(true), WindowController(_arg_2).getGraphicContext(true));
                }
            }
        }

        public function swapChildrenAt(k:int, _arg_2:int):void
        {
            if (!this._Str_2187)
            {
                return;
            }
            this.swapChildren(this._Str_2187[k], this._Str_2187[_arg_2]);
            this._Str_2624._Str_21032(k, _arg_2);
        }

        public function groupChildrenWithID(k:uint, _arg_2:Array, _arg_3:int=0):uint
        {
            var _local_4:WindowController;
            if (!this._Str_2187)
            {
                return 0;
            }
            var _local_5:uint;
            for each (_local_4 in this._Str_2187)
            {
                if (_local_4.id == k)
                {
                    _arg_2.push(_local_4);
                    _local_5++;
                }
                if (((_arg_3 > 0) || (_arg_3 < 0)))
                {
                    _arg_3--;
                    _local_5 = (_local_5 + _local_4.groupChildrenWithID(k, _arg_2, _arg_3));
                }
            }
            return _local_5;
        }

        public function groupChildrenWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint
        {
            var _local_4:WindowController;
            if (!this._Str_2187)
            {
                return 0;
            }
            var _local_5:uint;
            for each (_local_4 in this._Str_2187)
            {
                if (_local_4.tags.indexOf(k) > -1)
                {
                    _arg_2.push(_local_4);
                    _local_5++;
                }
                if (((_arg_3 > 0) || (_arg_3 < 0)))
                {
                    _local_5 = (_local_5 + _local_4.groupChildrenWithTag(k, _arg_2, (_arg_3 - 1)));
                }
            }
            return _local_5;
        }

        public function findParentByName(k:String):IWindow
        {
            if (_name == k)
            {
                return this;
            }
            if (this._parent != null)
            {
                if (this._parent.name == k)
                {
                    return this._parent;
                }
                return this._parent.findParentByName(k);
            }
            return null;
        }

        protected function _Str_25024():Boolean
        {
            var k:WindowController;
            if (testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))
            {
                if (this._Str_2187)
                {
                    for each (k in this._Str_2187)
                    {
                        if (k._Str_25024())
                        {
                            return true;
                        }
                    }
                }
                return false;
            }
            return true;
        }

        public function createProperty(k:String, _arg_2:Object):PropertyStruct
        {
            return this._Str_8085.get(k).withValue(_arg_2);
        }

        public function getDefaultProperty(k:String):PropertyStruct
        {
            return this._Str_8085.get(k);
        }

        public function _Str_5065():Boolean
        {
            return !(this.getStateFlag(WindowState.DISABLED));
        }

        public function enableChildren(k:Boolean, _arg_2:Array):void
        {
            var _local_3:String;
            var _local_4:IWindow;
            for each (_local_3 in _arg_2)
            {
                _local_4 = this.findChildByName(_local_3);
                if (_local_4 != null)
                {
                    if (k)
                    {
                        _local_4.enable();
                    }
                    else
                    {
                        _local_4.disable();
                    }
                }
            }
        }

        public function activateChildren(k:Boolean, _arg_2:Array):void
        {
            var _local_3:String;
            var _local_4:IWindow;
            for each (_local_3 in _arg_2)
            {
                _local_4 = this.findChildByName(_local_3);
                if (_local_4 != null)
                {
                    if (k)
                    {
                        _local_4.activate();
                    }
                    else
                    {
                        _local_4.deactivate();
                    }
                }
            }
        }

        public function setVisibleChildren(k:Boolean, _arg_2:Array):void
        {
            var _local_3:String;
            var _local_4:IWindow;
            for each (_local_3 in _arg_2)
            {
                _local_4 = this.findChildByName(_local_3);
                if (_local_4 != null)
                {
                    _local_4.visible = k;
                }
            }
        }

        public function set immediateClickMode(k:Boolean):void
        {
            var _local_2:IGraphicContext;
            if (k != this._Str_9238)
            {
                this._Str_9238 = k;
                _local_2 = this.getGraphicContext(false);
                if (_local_2)
                {
                    if (this._Str_9238)
                    {
                        _local_2._Str_10223 = true;
                        _local_2.addEventListener(MouseEvent.CLICK, this.immediateClickHandler);
                    }
                    else
                    {
                        _local_2._Str_10223 = false;
                        _local_2.removeEventListener(MouseEvent.CLICK, this.immediateClickHandler);
                    }
                }
            }
        }

        protected function immediateClickHandler(k:Event):void
        {
            var _local_6:IWindow;
            var _local_2:MouseEvent = (k as MouseEvent);
            var _local_3:Point = new Point(_local_2.stageX, _local_2.stageY);
            var _local_4:Array = [];
            this.desktop.groupChildrenUnderPoint(_local_3, _local_4);
            while (_local_4.length > 0)
            {
                _local_6 = _local_4.pop();
                if (_local_6 == this) break;
                if (_local_6.getParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR))
                {
                    return;
                }
            }
            this.getRelativeMousePosition(_local_3);
            var _local_5:WindowEvent = WindowMouseEvent.allocate(WindowMouseEvent.CLICK, this, null, _local_3.x, _local_3.y, _local_2.stageX, _local_2.stageY, _local_2.altKey, _local_2.ctrlKey, _local_2.shiftKey, _local_2.buttonDown, _local_2.delta);
            if (this._Str_759)
            {
                this._Str_759.dispatchEvent(_local_5);
            }
            if (!_local_5.isWindowOperationPrevented())
            {
                if (this.procedure != null)
                {
                    this.procedure(_local_5, this);
                }
            }
            k.stopImmediatePropagation();
            _local_5.recycle();
        }
    }
}
