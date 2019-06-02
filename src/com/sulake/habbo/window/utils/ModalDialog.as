package com.sulake.habbo.window.utils
{
    import flash.geom.ColorTransform;
    import flash.display.Stage;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import flash.events.Event;
    import com.sulake.core.window.IWindowContext;
    import com.sulake.core.window.components.IDesktopWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import com.sulake.core.window.WindowController;
    import flash.geom.Matrix;

    public class ModalDialog implements _Str_2784 
    {
        private static const _Str_4923:int = 3;
        private static const _Str_5846:ColorTransform = new ColorTransform(0.25, 0.25, 0.25);
        private static var _Str_2691:Stage = null;
        private static var _Str_2277:HabboWindowManagerComponent;
        private static var _container:IWindowContainer;
        private static var _Str_7821:int;

        private var _disposed:Boolean;
        private var _Str_7545:IWindow;
        private var _background:IBitmapWrapperWindow;

        public function ModalDialog(k:HabboWindowManagerComponent, _arg_2:XML)
        {
            _Str_22219(k);
            this._background = (_Str_20664.create("", "", WindowType.WINDOW_TYPE_BITMAP_WRAPPER, 0, WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, new Rectangle(0, 0, 1, 1), null, _container, 0) as IBitmapWrapperWindow);
            this._Str_7545 = _Str_2277.buildFromXML(_arg_2, _Str_4923);
            _container.addChild(this._Str_7545);
            this._Str_7545.center();
            _container.visible = true;
            refresh();
        }

        private static function _Str_22219(k:HabboWindowManagerComponent):void
        {
            if (_Str_2691 == null)
            {
                _Str_2277 = k;
                _Str_2691 = _Str_2277.context.displayObjectContainer.stage;
                _container = (_Str_20664.create("", "", WindowType.WINDOW_TYPE_CONTAINER, 0, 0, new Rectangle(0, 0, 1, 1), null, null, 0) as IWindowContainer);
                _Str_2691.addEventListener(Event.RESIZE, onResize);
                _Str_2691.addEventListener(Event.ENTER_FRAME, _Str_749);
            }
        }

        private static function get _Str_20664():IWindowContext
        {
            return _Str_2277.getWindowContext(_Str_4923);
        }

        private static function refresh():void
        {
            var i:int;
            var desktop:IDesktopWindow;
            var child:IWindow;
            var context:IWindowContext;
            var wrapper:IBitmapWrapperWindow;
            var window:IWindow;
            if (_container == null)
            {
                return;
            }
            var noModalDialogs:Boolean = (_container.numChildren == 0);
            i = 0;
            while (i < _Str_4923)
            {
                desktop = _Str_2277.getWindowContext(i).getDesktopWindow();
                desktop.visible = noModalDialogs;
                if (noModalDialogs)
                {
                    for each (child in desktop.iterator)
                    {
                        child.invalidate();
                    }
                }
                i = (i + 1);
            }
            if (noModalDialogs)
            {
                return;
            }
            var rectangle:Rectangle = new Rectangle(0, 0, Math.max(1, _Str_2691.stageWidth), Math.max(1, _Str_2691.stageHeight));
            _container.rectangle = rectangle;
            i = 0;
            while (i < _container.numChildren)
            {
                child = _container.getChildAt(i);
                if ((i % 2) == 0)
                {
                    child.rectangle = rectangle;
                    IBitmapWrapperWindow(child).bitmap = null;
                }
                else
                {
                    child.center();
                }
                i = (i + 1);
            }
            var image:BitmapData = new BitmapData(rectangle.width, rectangle.height, false, 0);
            i = 0;
            while (i < _Str_4923)
            {
                context = _Str_2277.getWindowContext(i);
                if (context != null)
                {
                    try
                    {
                        image.draw(IDisplayObjectWrapper(context.getDesktopWindow()).getDisplayObject());
                    }
                    catch(e:SecurityError)
                    {
                        Logger.log(("[ModalDialog] security error while drawing modal dialog:" + e.message));
                    }
                }
                i = (i + 1);
            }
            image.colorTransform(image.rect, _Str_5846);
            i = 0;
            while (i < _container.numChildren)
            {
                child = _container.getChildAt(i);
                if ((i % 2) == 0)
                {
                    wrapper = (child as IBitmapWrapperWindow);
                    if (i >= 2)
                    {
                        wrapper.bitmap = image.clone();
                        image = wrapper.bitmap;
                        window = _container.getChildAt((i - 1));
                        image.draw(WindowController(window).getGraphicContext(true), new Matrix(1, 0, 0, 1, window.x, window.y), _Str_5846);
                    }
                    else
                    {
                        wrapper.bitmap = image;
                    }
                }
                child.visible = (i >= (_container.numChildren - 2));
                child.invalidate();
                i = (i + 1);
            }
        }

        private static function onResize(k:Event):void
        {
            if (((_container == null) || (_container.numChildren <= 0)))
            {
                return;
            }
            _Str_7821 = 2;
            _container.getChildAt((_container.numChildren - 1)).center();
        }

        private static function _Str_749(k:Event):void
        {
            if (((_container == null) || (_container.numChildren <= 0)))
            {
                return;
            }
            if (_Str_7821 > 0)
            {
                _Str_7821--;
                if (_Str_7821 == 0)
                {
                    refresh();
                }
            }
        }


        public function get _Str_2429():IWindow
        {
            return this._Str_7545;
        }

        public function get background():IBitmapWrapperWindow
        {
            return this._background;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._background != null)
                {
                    this._background.dispose();
                    this._background = null;
                }
                if (this._Str_7545 != null)
                {
                    this._Str_7545.dispose();
                    this._Str_7545 = null;
                }
                refresh();
                if (((!(_container == null)) && (_container.numChildren == 0)))
                {
                    _container.visible = false;
                }
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
