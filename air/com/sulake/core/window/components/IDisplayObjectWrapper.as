//com.sulake.core.window.components.IDisplayObjectWrapper

package com.sulake.core.window.components{
    import com.sulake.core.window.IWindow;
    import flash.display.DisplayObject;

    public /*dynamic*/ interface IDisplayObjectWrapper extends IWindow {

        function setDisplayObject(k:DisplayObject):void;
        function getDisplayObject():DisplayObject;

    }
}//package com.sulake.core.window.components

