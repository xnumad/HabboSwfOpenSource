package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.events.WindowEvent;

    public class SelectableController extends InteractiveController implements ISelectableWindow 
    {
        public function SelectableController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public function get selector():ISelectorWindow
        {
            var k:IWindow;
            if (_parent)
            {
                k = (_parent as WindowController);
                while (k)
                {
                    if ((k is ISelectorWindow))
                    {
                        return k as ISelectorWindow;
                    }
                    k = k.parent;
                }
            }
            return null;
        }

        public function get _Str_2365():Boolean
        {
            return testStateFlag(WindowState.SELECTED);
        }

        public function set _Str_2365(k:Boolean):void
        {
            setStateFlag(WindowState.SELECTED, k);
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            var _local_3:WindowController;
            var _local_4:WindowEvent;
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_ACTIVATED)
            {
                if (_parent)
                {
                    if (!(_parent is ISelectorWindow))
                    {
                        _local_3 = (_parent.parent as WindowController);
                        while (_local_3)
                        {
                            if ((_local_3 is ISelectorWindow))
                            {
                                _local_4 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHILD_ACTIVATED, this, null);
                                _local_3.update(this, _local_4);
                                _local_4.recycle();
                                break;
                            }
                            _local_3 = (_local_3.parent as WindowController);
                        }
                    }
                }
            }
            return super.update(k, _arg_2);
        }

        public function select():Boolean
        {
            if (getStateFlag(WindowState.SELECTED))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_SELECT, this, null, true);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            setStateFlag(WindowState.SELECTED, true);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_SELECTED, this, null);
            this.update(this, k);
            k.recycle();
            activate();
            return true;
        }

        public function unselect():Boolean
        {
            if (!getStateFlag(WindowState.SELECTED))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_UNSELECT, this, null, true);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            setStateFlag(WindowState.SELECTED, false);
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_UNSELECTED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }
    }
}
