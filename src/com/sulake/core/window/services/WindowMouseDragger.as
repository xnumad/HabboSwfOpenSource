package com.sulake.core.window.services
{
    import flash.display.DisplayObject;

    public class WindowMouseDragger extends WindowMouseOperator implements IMouseDraggingService 
    {
        public function WindowMouseDragger(k:DisplayObject)
        {
            super(k);
        }

        override public function operate(k:int, _arg_2:int):void
        {
            _Str_3282.x = k;
            _Str_3282.y = _arg_2;
            getMousePositionRelativeTo(window, _Str_3282, _Str_3368);
            window.offset((_Str_3368.x - _Str_588.x), (_Str_3368.y - _Str_588.y));
        }
    }
}
