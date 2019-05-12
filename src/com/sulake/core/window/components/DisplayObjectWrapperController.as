package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.graphics.GraphicContext;
    import com.sulake.core.window.graphics.IGraphicContext;
    import com.sulake.core.window.graphics.IGraphicContextHost;
    import flash.display.DisplayObject;

    public class DisplayObjectWrapperController extends WindowController implements IDisplayObjectWrapper 
    {
        public function DisplayObjectWrapperController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _arg_4 = (_arg_4 & (~(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT)));
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _Str_3781 = false;
        }

        override public function getGraphicContext(k:Boolean):IGraphicContext
        {
            if (((k) && (!(_Str_2624))))
            {
                _Str_2624 = new GraphicContext((("GC {" + _name) + "}"), GraphicContext.GC_TYPE_CONTAINER, rectangle);
            }
            return _Str_2624;
        }

        public function getDisplayObject():DisplayObject
        {
            return IGraphicContextHost(this).getGraphicContext(true).getDisplayObject();
        }

        public function setDisplayObject(k:DisplayObject):void
        {
            IGraphicContextHost(this).getGraphicContext(true).setDisplayObject(k);
        }
    }
}
