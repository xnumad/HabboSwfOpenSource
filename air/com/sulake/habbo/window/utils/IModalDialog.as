//com.sulake.habbo.window.utils.IModalDialog

package com.sulake.habbo.window.utils{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;

    public /*dynamic*/ interface IModalDialog extends IDisposable {

        function get rootWindow():IWindow;
        function get background():IBitmapWrapperWindow;

    }
}//package com.sulake.habbo.window.utils

