package com.sulake.core.window.components
{
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;

    public class RadioButtonController extends SelectableController implements IRadioButtonWindow 
    {
        protected static const _CAPTION_TEXT:String = "_CAPTION_TEXT";

        public function RadioButtonController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function set caption(k:String):void
        {
            super.caption = k;
            var _local_2:IWindow = getChildByName(_CAPTION_TEXT);
            if (_local_2 != null)
            {
                _local_2.caption = caption;
            }
        }

        override public function setRectangle(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            super.setRectangle(k, _arg_2, _arg_3, _arg_4);
            var _local_5:ITextWindow = (getChildByName(_CAPTION_TEXT) as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.width = _arg_3;
            }
        }
    }
}
