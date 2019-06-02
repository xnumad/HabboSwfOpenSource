package com.sulake.core.window.services
{
    import com.sulake.core.window.components.IToolTipWindow;
    import flash.utils.Timer;
    import flash.geom.Point;
    import flash.display.DisplayObject;
    import com.sulake.core.window.components.IInteractiveWindow;
    import flash.events.TimerEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.enum.WindowParam;

    public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService 
    {
        protected var _Str_3422:String;
        protected var _Str_3468:IToolTipWindow;
        protected var _Str_5194:Timer;
        protected var _Str_11145:Point;
        protected var _Str_4734:Point;
        protected var _Str_3681:uint;

        public function WindowToolTipAgent(k:DisplayObject)
        {
            this._Str_4734 = new Point();
            this._Str_11145 = new Point(20, 20);
            this._Str_3681 = 500;
            super(k);
        }

        override public function begin(k:IWindow, _arg_2:uint=0):IWindow
        {
            if (((k) && (!(k.disposed))))
            {
                if ((k is IInteractiveWindow))
                {
                    this._Str_3422 = IInteractiveWindow(k)._Str_2613;
                    this._Str_3681 = IInteractiveWindow(k)._Str_3099;
                }
                else
                {
                    this._Str_3422 = k.caption;
                    this._Str_3681 = 500;
                }
                _Str_3282.x = _Str_2302.mouseX;
                _Str_3282.y = _Str_2302.mouseY;
                getMousePositionRelativeTo(k, _Str_3282, this._Str_4734);
                if (this._Str_5194 == null)
                {
                    this._Str_5194 = new Timer(this._Str_3681, 1);
                    this._Str_5194.addEventListener(TimerEvent.TIMER, this.showToolTip);
                }
                this._Str_5194.reset();
                this._Str_5194.start();
            }
            return super.begin(k, _arg_2);
        }

        override public function end(k:IWindow):IWindow
        {
            if (this._Str_5194 != null)
            {
                this._Str_5194.stop();
                this._Str_5194.removeEventListener(TimerEvent.TIMER, this.showToolTip);
                this._Str_5194 = null;
            }
            this.hideToolTip();
            return super.end(k);
        }

        override public function operate(k:int, _arg_2:int):void
        {
            if (((window) && (!(window.disposed))))
            {
                _Str_3282.x = k;
                _Str_3282.y = _arg_2;
                getMousePositionRelativeTo(window, _Str_3282, this._Str_4734);
                if (((!(this._Str_3468 == null)) && (!(this._Str_3468.disposed))))
                {
                    this._Str_3468.x = (k + this._Str_11145.x);
                    this._Str_3468.y = (_arg_2 + this._Str_11145.y);
                }
            }
        }

        protected function showToolTip(k:TimerEvent):void
        {
            var _local_2:Point;
            if (this._Str_5194 != null)
            {
                this._Str_5194.reset();
            }
            if (((window) && (!(window.disposed))))
            {
                if ((window is IInteractiveWindow))
                {
                    this._Str_3422 = IInteractiveWindow(window)._Str_2613;
                }
                else
                {
                    this._Str_3422 = window.caption;
                }
                if (((this._Str_3468 == null) || (this._Str_3468.disposed)))
                {
                    this._Str_3468 = (window.context.create((window.name + "::ToolTip"), this._Str_3422, WindowType.WINDOW_TYPE_TOOLTIP, window.style, (WindowParam.WINDOW_PARAM_BOUND_TO_PARENT_RECT | WindowParam.WINDOW_PARAM_NULL), null, null, null, 0, null, null) as IToolTipWindow);
                }
                _local_2 = new Point();
                window.getGlobalPosition(_local_2);
                this._Str_3468.x = ((_local_2.x + this._Str_4734.x) + this._Str_11145.x);
                this._Str_3468.y = ((_local_2.y + this._Str_4734.y) + this._Str_11145.y);
                this._Str_3468.visible = (this._Str_3468.caption.length > 0);
            }
        }

        protected function hideToolTip():void
        {
            if (((!(this._Str_3468 == null)) && (!(this._Str_3468.disposed))))
            {
                this._Str_3468.destroy();
                this._Str_3468 = null;
            }
        }

        public function updateCaption(k:IWindow):void
        {
            var _local_2:String;
            if (((((k == null) || (k.disposed)) || (this._Str_3468 == null)) || (this._Str_3468.disposed)))
            {
                return;
            }
            if ((k is IInteractiveWindow))
            {
                _local_2 = IInteractiveWindow(k)._Str_2613;
            }
            else
            {
                _local_2 = k.caption;
            }
            if (_local_2 != this._Str_3422)
            {
                this._Str_3422 = _local_2;
                if (((_local_2 == null) || (_local_2.length == 0)))
                {
                    this._Str_3468.visible = false;
                }
                else
                {
                    this._Str_3468.caption = _local_2;
                    this._Str_3468.visible = true;
                }
            }
        }
    }
}
