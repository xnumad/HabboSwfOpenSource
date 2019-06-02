package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowTouchEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.WindowController;

    public class ButtonController extends InteractiveController implements IButtonWindow, ITouchAwareWindow 
    {
        protected static const _BTN_TEXT:String = "_BTN_TEXT";
        protected static const _Str_5734:Number = 0.5;

        public function ButtonController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN);
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function set caption(k:String):void
        {
            super.caption = k;
            var _local_2:IWindow = getChildByName(_BTN_TEXT);
            if (_local_2 != null)
            {
                _local_2.caption = caption;
            }
        }

        override public function set blend(k:Number):void
        {
            super.blend = k;
            var _local_2:IWindow = getChildByName(_BTN_TEXT);
            var _local_3:Boolean = getStateFlag(WindowState.DISABLED);
            if (_local_2 != null)
            {
                _local_2.blend = ((_local_3) ? (k / 2) : k);
            }
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            var _local_3:String;
            var _local_4:WindowEvent;
            var _local_5:Boolean;
            if ((_arg_2 is WindowEvent))
            {
                switch (_arg_2.type)
                {
                    case WindowEvent.WINDOW_EVENT_CHILD_RESIZED:
                        width = 0;
                        break;
                    case WindowEvent.WINDOW_EVENT_ENABLED:
                        try
                        {
                            getChildByName(_BTN_TEXT).blend = (getChildByName(_BTN_TEXT).blend + _Str_5734);
                        }
                        catch(e:Error)
                        {
                        }
                        break;
                    case WindowEvent.WINDOW_EVENT_DISABLED:
                        try
                        {
                            getChildByName(_BTN_TEXT).blend = (getChildByName(_BTN_TEXT).blend - _Str_5734);
                        }
                        catch(e:Error)
                        {
                        }
                        break;
                }
            }
            else
            {
                if ((_arg_2 is WindowTouchEvent))
                {
                    _local_3 = WindowEvent.UNKNOWN;
                    switch (_arg_2.type)
                    {
                        case WindowTouchEvent.WTE_BEGIN:
                            _local_3 = WindowMouseEvent.DOWN;
                            break;
                        case WindowTouchEvent.WTE_END:
                            _local_3 = WindowMouseEvent.UP;
                            break;
                        case WindowTouchEvent.WTE_TAP:
                            _local_3 = WindowMouseEvent.CLICK;
                            break;
                    }
                    _local_4 = WindowMouseEvent.allocate(_local_3, WindowTouchEvent(_arg_2).window, WindowTouchEvent(_arg_2).related, WindowTouchEvent(_arg_2).localX, WindowTouchEvent(_arg_2).localY, WindowTouchEvent(_arg_2).stageX, WindowTouchEvent(_arg_2).stageY, WindowTouchEvent(_arg_2).altKey, WindowTouchEvent(_arg_2).ctrlKey, WindowTouchEvent(_arg_2).shiftKey, true, 0);
                    _local_5 = super.update(k, _local_4);
                    _local_4.recycle();
                    return _local_5;
                }
            }
            return super.update(k, _arg_2);
        }
    }
}
