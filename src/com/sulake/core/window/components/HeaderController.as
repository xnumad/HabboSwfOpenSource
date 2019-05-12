package com.sulake.core.window.components
{
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;

    public class HeaderController extends ContainerController implements IHeaderWindow 
    {
        private static const _TITLE:String = "_TITLE";
        private static const _CONTROLS:String = "_CONTROLS";

        public function HeaderController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public function get title():ILabelWindow
        {
            return findChildByTag(_TITLE) as ILabelWindow;
        }

        public function get controls():IItemListWindow
        {
            return findChildByTag(_CONTROLS) as IItemListWindow;
        }

        override public function set caption(value:String):void
        {
            super.caption = value;
            try
            {
                this.title.text = value;
            }
            catch(e:Error)
            {
            }
        }

        override public function set color(k:uint):void
        {
            var _local_3:IWindow;
            super.color = k;
            var _local_2:Array = new Array();
            groupChildrenWithTag(_COLORIZE, _local_2, -1);
            for each (_local_3 in _local_2)
            {
                _local_3.color = k;
            }
        }
    }
}
