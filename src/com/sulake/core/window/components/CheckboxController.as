package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.events.WindowEvent;

    public class CheckboxController extends SelectableController implements ICheckBoxWindow 
    {
        protected static const _CAPTION_TEXT:String = "_CAPTION_TEXT";

        public function CheckboxController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
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

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            if (k == this)
            {
                switch (_arg_2.type)
                {
                    case WindowMouseEvent.UP:
                        if (_Str_2365)
                        {
                            unselect();
                        }
                        else
                        {
                            select();
                        }
                        break;
                }
            }
            return super.update(k, _arg_2);
        }
    }
}
