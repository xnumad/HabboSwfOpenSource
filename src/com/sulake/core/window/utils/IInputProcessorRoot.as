package com.sulake.core.window.utils
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;

    public interface IInputProcessorRoot extends IWindow 
    {
        function process(_arg_1:WindowEvent):Boolean;
    }
}
