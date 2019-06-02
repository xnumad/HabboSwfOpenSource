//com.sulake.core.window.components.IFocusWindow

package com.sulake.core.window.components{
    import com.sulake.core.runtime.IDisposable;

    public /*dynamic*/ interface IFocusWindow extends IDisposable {

        function get focused():Boolean;
        function focus():Boolean;
        function unfocus():Boolean;

    }
}//package com.sulake.core.window.components

