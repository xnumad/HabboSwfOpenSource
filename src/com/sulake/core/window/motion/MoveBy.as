package com.sulake.core.window.motion
{
    import com.sulake.core.window.IWindow;

    public class MoveBy extends MoveTo 
    {
        public function MoveBy(k:IWindow, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        public override final function start():void
        {
            _endX = (target.x + _endX);
            _endY = (target.y + _endY);
            super.start();
        }
    }
}
