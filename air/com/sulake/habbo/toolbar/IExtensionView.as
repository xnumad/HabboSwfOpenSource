//com.sulake.habbo.toolbar.IExtensionView

package com.sulake.habbo.toolbar{
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface IExtensionView {

        function set visible(k:Boolean):void;
        function get visible():Boolean;
        function get screenHeight():uint;
        function attachExtension(k:String, _arg_2:IWindow, _arg_3:int=-1, _arg_4:Array=null):void;
        function detachExtension(k:String):void;
        function hasExtension(k:String):Boolean;
        function set extraMargin(k:int):void;
        function get extraMargin():int;
        function refreshItemWindow():void;

    }
}//package com.sulake.habbo.toolbar

