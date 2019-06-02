//com.sulake.core.window.IInputEventTracker

package com.sulake.core.window{
    import com.sulake.core.window.events.WindowEvent;

    public /*dynamic*/ interface IInputEventTracker {

        function eventReceived(k:WindowEvent, _arg_2:IWindow):void;

    }
}//package com.sulake.core.window

