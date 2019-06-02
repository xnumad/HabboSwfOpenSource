//com.sulake.core.window.utils.IRectLimiter

package com.sulake.core.window.utils{
    public /*dynamic*/ interface IRectLimiter {

        function get minWidth():int;
        function get maxWidth():int;
        function get minHeight():int;
        function get maxHeight():int;
        function set minWidth(k:int):void;
        function set maxWidth(k:int):void;
        function set minHeight(k:int):void;
        function set maxHeight(k:int):void;
        function get isEmpty():Boolean;
        function setEmpty():void;
        function limit():void;

    }
}//package com.sulake.core.window.utils

