package com.sulake.core.window.utils
{
    import com.sulake.core.runtime.IDisposable;
    import flash.geom.Point;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.graphics.IWindowRenderer;
    import com.sulake.core.window.components.IDesktopWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IInputEventTracker;
    import com.sulake.core.window.enum.MouseCursorType;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.events.MouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.components.IInteractiveWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.RegionController;
    import com.sulake.core.window.enum.*;

    public class MouseEventProcessor implements IEventProcessor, IDisposable 
    {
        protected static var _Str_4716:Array;
        protected static var _Str_4392:Array;
        protected static var _Str_5267:Point = new Point();

        protected var location:Point;
        protected var _Str_3558:WindowController;
        protected var _Str_3275:WindowController;
        protected var _Str_2884:IWindowRenderer;
        protected var _Str_2867:IDesktopWindow;
        protected var _Str_8811:Vector.<IInputEventTracker>;
        private var _disposed:Boolean = false;

        public function MouseEventProcessor()
        {
            this.location = new Point();
            if (_Str_4716 == null)
            {
                _Str_4716 = new Array();
                _Str_4716[0] = MouseCursorType.ARROW_LINK;
                _Str_4716[1] = MouseCursorType.DEFAULT;
                _Str_4716[2] = MouseCursorType.ARROW_LINK;
                _Str_4716[3] = MouseCursorType.ARROW_LINK;
                _Str_4716[4] = MouseCursorType.ARROW_LINK;
                _Str_4716[5] = MouseCursorType.DEFAULT;
                _Str_4716[6] = MouseCursorType.ARROW_LINK;
            }
            if (_Str_4392 == null)
            {
                _Str_4392 = new Array();
                _Str_4392[0] = WindowState.ACTIVE;
                _Str_4392[1] = WindowState.FOCUSED;
                _Str_4392[2] = WindowState.HOVERING;
                _Str_4392[3] = WindowState.LOCKED;
                _Str_4392[4] = WindowState.SELECTED;
                _Str_4392[5] = WindowState.PRESSED;
                _Str_4392[6] = WindowState.DISABLED;
            }
        }

        public static function _Str_26019(k:uint, _arg_2:uint):void
        {
            var _local_3:int = _Str_4392.indexOf(k);
            if (_local_3 > -1)
            {
                _Str_4716[_local_3] = _arg_2;
            }
        }

        public static function getMouseCursorByState(k:uint):uint
        {
            var _local_2:uint = _Str_4392.length;
            while (_local_2-- > 0)
            {
                if ((k & _Str_4392[_local_2]) > 0)
                {
                    return _Str_4716[_local_2];
                }
            }
            return MouseCursorType.DEFAULT;
        }

        protected static function _Str_9426(k:MouseEvent, _arg_2:IWindow, _arg_3:IWindow):WindowMouseEvent
        {
            var _local_4:String;
            var _local_5:Point;
            var _local_6:Boolean;
            _local_5 = new Point(k.stageX, k.stageY);
            _arg_2.convertPointFromGlobalToLocalSpace(_local_5);
            switch (k.type)
            {
                case MouseEvent.MOUSE_MOVE:
                    _local_4 = WindowMouseEvent.MOVE;
                    break;
                case MouseEvent.MOUSE_OVER:
                    _local_4 = WindowMouseEvent.OVER;
                    break;
                case MouseEvent.MOUSE_OUT:
                    _local_4 = WindowMouseEvent.OUT;
                    break;
                case MouseEvent.ROLL_OUT:
                    _local_4 = WindowMouseEvent.ROLL_OUT;
                    break;
                case MouseEvent.ROLL_OVER:
                    _local_4 = WindowMouseEvent.ROLL_OVER;
                    break;
                case MouseEvent.CLICK:
                    _local_4 = WindowMouseEvent.CLICK;
                    break;
                case MouseEvent.DOUBLE_CLICK:
                    _local_4 = WindowMouseEvent.DOUBLE_CLICK;
                    break;
                case MouseEvent.MOUSE_DOWN:
                    _local_4 = WindowMouseEvent.DOWN;
                    break;
                case MouseEvent.MOUSE_UP:
                    _local_6 = ((((_local_5.x > -1) && (_local_5.y > -1)) && (_local_5.x < _arg_2.width)) && (_local_5.y < _arg_2.height));
                    _local_4 = ((_local_6) ? WindowMouseEvent.UP : WindowMouseEvent.UP_OUTSIDE);
                    break;
                case MouseEvent.MOUSE_WHEEL:
                    _local_4 = WindowMouseEvent.WHEEL;
                    break;
                default:
                    _local_4 = WindowEvent.UNKNOWN;
            }
            return WindowMouseEvent.allocate(_local_4, _arg_2, _arg_3, _local_5.x, _local_5.y, k.stageX, k.stageY, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown, k.delta);
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._disposed = true;
            }
        }

        public function process(state:EventProcessorState, eventQueue:IEventQueue):void
        {
            var event:MouseEvent;
            var index:int;
            var child:WindowController;
            var array:Array;
            var tempWindowEvent:WindowEvent;
            var window:IWindow;
            var temp:IWindow;
            if (eventQueue.length == 0)
            {
                return;
            }
            this._Str_2867 = state.desktop;
            this._Str_3275 = (state.hoverWindow as WindowController);
            this._Str_3558 = (state.lastClickTarget as WindowController);
            this._Str_2884 = state.renderer;
            this._Str_8811 = state.eventTrackers;
            eventQueue.begin();
            this.location.x = -1;
            this.location.y = -1;
            var mouseCursorType:int = MouseCursorType.DEFAULT;
            while (true)
            {
                event = (eventQueue.next() as MouseEvent);
                if (event == null) break;
                if (((!(event.stageX == this.location.x)) || (!(event.stageY == this.location.y))))
                {
                    this.location.x = event.stageX;
                    this.location.y = event.stageY;
                    array = new Array();
                    this._Str_2867.groupParameterFilteredChildrenUnderPoint(this.location, array, WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
                }
                index = ((array != null) ? array.length : 0);
                if (index == 0)
                {
                    switch (event.type)
                    {
                        case MouseEvent.MOUSE_MOVE:
                            if (((!(this._Str_3275 == this._Str_2867)) && (!(this._Str_3275.disposed))))
                            {
                                this._Str_3275.getGlobalPosition(_Str_5267);
                                tempWindowEvent = WindowMouseEvent.allocate(WindowMouseEvent.OUT, this._Str_3275, null, (event.stageX - _Str_5267.x), (event.stageY - _Str_5267.y), event.stageX, event.stageY, event.altKey, event.ctrlKey, event.shiftKey, event.buttonDown, event.delta);
                                this._Str_3275.update(this._Str_3275, tempWindowEvent);
                                this._Str_3275 = WindowController(this._Str_2867);
                                tempWindowEvent.recycle();
                            }
                            break;
                        case MouseEvent.MOUSE_DOWN:
                            window = this._Str_2867.getActiveWindow();
                            if (window)
                            {
                                window.deactivate();
                            }
                            break;
                        case MouseEvent.MOUSE_UP:
                            if (this._Str_3558)
                            {
                                array.push(this._Str_3558);
                                index = (index + 1);
                            }
                            break;
                    }
                }
                while (--index > -1)
                {
                    child = this._Str_16513(WindowController(array[index]), event);
                    if (((!(child == null)) && (child.visible)))
                    {
                        if (event.type == MouseEvent.MOUSE_MOVE)
                        {
                            if (child != this._Str_3275)
                            {
                                if (!this._Str_3275.disposed)
                                {
                                    this._Str_3275.getGlobalPosition(_Str_5267);
                                    tempWindowEvent = WindowMouseEvent.allocate(WindowMouseEvent.OUT, this._Str_3275, child, (event.stageX - _Str_5267.x), (event.stageY - _Str_5267.y), event.stageX, event.stageY, event.altKey, event.ctrlKey, event.shiftKey, event.buttonDown, event.delta);
                                    this._Str_3275.update(this._Str_3275, tempWindowEvent);
                                    tempWindowEvent.recycle();
                                }
                                if (!child.disposed)
                                {
                                    child.getGlobalPosition(_Str_5267);
                                    tempWindowEvent = WindowMouseEvent.allocate(WindowMouseEvent.OVER, child, null, (event.stageX - _Str_5267.x), (event.stageY - _Str_5267.y), event.stageX, event.stageY, event.altKey, event.ctrlKey, event.shiftKey, event.buttonDown, event.delta);
                                    child.update(child, tempWindowEvent);
                                    tempWindowEvent.recycle();
                                }
                                if (!child.disposed)
                                {
                                    this._Str_3275 = child;
                                }
                            }
                        }
                        temp = child.parent;
                        while (((temp) && (!(temp.disposed))))
                        {
                            if ((temp is IInputProcessorRoot))
                            {
                                tempWindowEvent = _Str_9426(event, temp, child);
                                IInputProcessorRoot(temp).process(tempWindowEvent);
                                tempWindowEvent.recycle();
                                break;
                            }
                            temp = temp.parent;
                        }
                        if ((this._Str_3275 is IInteractiveWindow))
                        {
                            try
                            {
                                mouseCursorType = IInteractiveWindow(this._Str_3275).getMouseCursorByState(this._Str_3275.state);
                                if (mouseCursorType == MouseCursorType.DEFAULT)
                                {
                                    mouseCursorType = getMouseCursorByState(this._Str_3275.state);
                                }
                            }
                            catch(e:Error)
                            {
                                mouseCursorType = MouseCursorType.DEFAULT;
                            }
                        }
                        if (child != this._Str_2867)
                        {
                            event.stopPropagation();
                            eventQueue.remove();
                        }
                        break;
                    }
                }
            }
            eventQueue.end();
            MouseCursorControl.type = mouseCursorType;
            state.desktop = this._Str_2867;
            state.hoverWindow = this._Str_3275;
            state.lastClickTarget = this._Str_3558;
            state.renderer = this._Str_2884;
            state.eventTrackers = this._Str_8811;
        }

        private function _Str_16513(k:WindowController, _arg_2:MouseEvent, _arg_3:Boolean=false):WindowController
        {
            var _local_9:IInputEventTracker;
            var _local_10:BitmapData;
            if (k.disposed)
            {
                return null;
            }
            if ((((k.testStateFlag(WindowState.DISABLED)) && (_arg_2.type == MouseEvent.MOUSE_MOVE)) && (k is RegionController)))
            {
                return k;
            }
            if (k.testStateFlag(WindowState.DISABLED))
            {
                return null;
            }
            var _local_4:Boolean;
            var _local_5:Point = new Point(_arg_2.stageX, _arg_2.stageY);
            k.convertPointFromGlobalToLocalSpace(_local_5);
            if (_arg_2.type == MouseEvent.MOUSE_UP)
            {
                if (k != this._Str_3558)
                {
                    if (((this._Str_3558) && (!(this._Str_3558.disposed))))
                    {
                        this._Str_3558.update(this._Str_3558, _Str_9426(new MouseEvent(MouseEvent.MOUSE_UP, false, true, _arg_2.localX, _arg_2.localY, null, _arg_2.ctrlKey, _arg_2.altKey, _arg_2.shiftKey, _arg_2.buttonDown, _arg_2.delta), this._Str_3558, k));
                        this._Str_3558 = null;
                        if (k.disposed)
                        {
                            return null;
                        }
                    }
                }
                else
                {
                    _local_4 = (!(k.hitTestLocalPoint(_local_5)));
                }
            }
            if (!_local_4)
            {
                _local_10 = this._Str_2884._Str_19855(k);
                if (!k._Str_23321(_local_5, _local_10))
                {
                    return null;
                }
            }
            if (k.testParamFlag(WindowParam.WINDOW_PARAM_ROUTE_INPUT_EVENTS_TO_PARENT))
            {
                if (k.parent != null)
                {
                    return this._Str_16513(WindowController(k.parent), _arg_2);
                }
            }
            if (!_arg_3)
            {
                switch (_arg_2.type)
                {
                    case MouseEvent.MOUSE_DOWN:
                        this._Str_3558 = k;
                        break;
                    case MouseEvent.CLICK:
                        if (this._Str_3558 != k)
                        {
                            return null;
                        }
                        this._Str_3558 = null;
                        break;
                    case MouseEvent.DOUBLE_CLICK:
                        if (this._Str_3558 != k)
                        {
                            return null;
                        }
                        this._Str_3558 = null;
                        break;
                }
            }
            var _local_6:IWindow;
            var _local_7:WindowMouseEvent = _Str_9426(_arg_2, k, _local_6);
            var _local_8:Boolean = k.update(k, _local_7);
            for each (_local_9 in this._Str_8811)
            {
                _local_9.eventReceived(_local_7, k);
            }
            _local_7.recycle();
            if (((!(_local_8)) && (!(_arg_3))))
            {
                if (k.parent)
                {
                    return this._Str_16513(WindowController(k.parent), _arg_2);
                }
            }
            return k;
        }
    }
}
