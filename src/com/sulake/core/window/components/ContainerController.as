package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.iterators.ContainerIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.graphics.GraphicContext;
    import com.sulake.core.window.graphics.IGraphicContext;

    public class ContainerController extends WindowController implements IWindowContainer 
    {
        public function ContainerController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _Str_3781 = (((_background) || (testParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR))) || (!(testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))));
        }

        public function get iterator():IIterator
        {
            return new ContainerIterator(this);
        }

        override public function getGraphicContext(k:Boolean):IGraphicContext
        {
            if (((k) && (!(_Str_2624))))
            {
                _Str_2624 = new GraphicContext((("GC {" + _name) + "}"), ((testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT)) ? (GraphicContext.GC_TYPE_CONTAINER) : (GraphicContext.GC_TYPE_BITMAP)), rectangle);
                _Str_2624.visible = _visible;
            }
            return _Str_2624;
        }
    }
}
