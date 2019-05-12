package com.sulake.core.window.services
{
    import flash.display.DisplayObject;
    import com.sulake.core.window.enum.WindowParam;

    public class WindowMouseScaler extends WindowMouseOperator implements IMouseScalingService 
    {
        public function WindowMouseScaler(k:DisplayObject)
        {
            super(k);
        }

        override public function operate(k:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            if (!window.disposed)
            {
                _local_3 = ((_Str_829 & WindowParam.WINDOW_PARAM_HORIZONTAL_MOUSE_SCALING_TRIGGER) ? (k - _Str_3282.x) : 0);
                _local_4 = ((_Str_829 & WindowParam.WINDOW_PARAM_VERTICAL_MOUSE_SCALING_TRIGGER) ? (_arg_2 - _Str_3282.y) : 0);
                window.scale(_local_3, _local_4);
            }
        }
    }
}
