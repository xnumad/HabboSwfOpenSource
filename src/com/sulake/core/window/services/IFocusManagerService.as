package com.sulake.core.window.services
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFocusWindow;

    public interface IFocusManagerService extends IDisposable 
    {
        function registerFocusWindow(_arg_1:IFocusWindow):void;
        function removeFocusWindow(_arg_1:IFocusWindow):void;
    }
}
