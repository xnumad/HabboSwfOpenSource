//com.sulake.core.window.ILinkEventTracker

package com.sulake.core.window{
    public /*dynamic*/ interface ILinkEventTracker {

        function get linkPattern():String;
        function linkReceived(k:String):void;

    }
}//package com.sulake.core.window

