//com.sulake.core.window.services.IFocusManagerService

package com.sulake.core.window.services{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFocusWindow;

    public /*dynamic*/ interface IFocusManagerService extends IDisposable {

        function registerFocusWindow(k:IFocusWindow):void;
        function removeFocusWindow(k:IFocusWindow):void;

    }
}//package com.sulake.core.window.services

