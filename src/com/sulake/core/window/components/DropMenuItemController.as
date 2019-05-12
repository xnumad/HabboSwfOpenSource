package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;

    public class DropMenuItemController extends ButtonController implements IDropListItemWindow, ITouchAwareWindow 
    {
        public function DropMenuItemController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public function get menu():IDropMenuWindow
        {
            var k:IWindow = parent;
            while (k)
            {
                if ((k is IDropMenuWindow))
                {
                    break;
                }
                k = k.parent;
            }
            return k as IDropMenuWindow;
        }

        public function get value():IWindow
        {
            return this;
        }

        public function set value(k:IWindow):void
        {
        }
    }
}
