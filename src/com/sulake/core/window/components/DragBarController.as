package com.sulake.core.window.components
{
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.WindowController;

    public class DragBarController extends InteractiveController implements IDragBarWindow 
    {
        protected var _Str_18200:Number;
        protected var _Str_18429:Number;
        protected var _Str_2734:ScrollBarController;

        public function DragBarController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._Str_18200 = 0;
            this._Str_18429 = 0;
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_BOUND_TO_PARENT_RECT);
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_MOUSE_DRAGGING_TARGET);
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_MOUSE_DRAGGING_TRIGGER);
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            var _local_12:IWindow = _arg_7;
            while (_local_12 != null)
            {
                if ((_local_12 is IScrollbarWindow))
                {
                    this._Str_2734 = ScrollBarController(_local_12);
                    _local_12 = null;
                }
                else
                {
                    _local_12 = _local_12.parent;
                }
            }
            if (this._Str_2734.horizontal)
            {
                limits.minWidth = width;
            }
            else
            {
                limits.minHeight = height;
            }
        }

        public function get _Str_14866():Number
        {
            return this._Str_18200;
        }

        public function get _Str_15234():Number
        {
            return this._Str_18429;
        }

        public function set _Str_14866(k:Number):void
        {
        }

        public function set _Str_15234(k:Number):void
        {
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            var _local_3:WindowEvent;
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_RELOCATED)
            {
                this._Str_18200 = ((x != 0) ? (x / Number((_parent.width - width))) : 0);
                this._Str_18429 = ((y != 0) ? (y / Number((_parent.height - height))) : 0);
                if (_parent != this._Str_2734)
                {
                    _local_3 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHILD_RELOCATED, this, null);
                    this._Str_2734.update(this, _local_3);
                    _local_3.recycle();
                }
            }
            return super.update(k, _arg_2);
        }
    }
}
