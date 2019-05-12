package com.sulake.core.window.components
{
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.WindowController;

    public class TabButtonController extends SelectableController implements ITabButtonWindow 
    {
        private static const TAB_BUTTON_CONTENT:String = "TAB_BUTTON_CONTENT";
        private static const TAB_BUTTON_TITLE:String = "TAB_BUTTON_TITLE";
        private static const TAB_BUTTON_ICON:String = "TAB_BUTTON_ICON";

        public function TabButtonController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function set caption(k:String):void
        {
            super.caption = k;
            var _local_2:IWindow = findChildByTag(TAB_BUTTON_TITLE);
            if (_local_2 != null)
            {
                _local_2.caption = k;
            }
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_CHILD_RESIZED)
            {
                WindowController.resizeToAccommodateChildren(this);
            }
            return super.update(k, _arg_2);
        }
    }
}
