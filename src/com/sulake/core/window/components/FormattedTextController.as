package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;

    public class FormattedTextController extends TextController 
    {
        public function FormattedTextController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function set text(k:String):void
        {
            if (k == null)
            {
                return;
            }
            if (_Str_2959)
            {
                context.removeLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
                _Str_2959 = false;
            }
            _caption = k;
            if ((((!(_Str_5517)) && (_caption.charAt(0) == "$")) && (_caption.charAt(1) == "{")))
            {
                _Str_2959 = true;
                context.registerLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
            }
            else
            {
                if (_Str_2309 != null)
                {
                    _Str_2309.htmlText = _caption;
                    refreshTextImage();
                }
            }
        }

        override public function set localization(k:String):void
        {
            if (((!(k == null)) && (!(_Str_2309 == null))))
            {
                _Str_2309.htmlText = _Str_8027(k);
                refreshTextImage();
            }
        }
    }
}
