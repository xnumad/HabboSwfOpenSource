//com.sulake.habbo.toolbar.IHabboToolbar

package com.sulake.habbo.toolbar{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import com.sulake.core.window.motion.Motion;

    public /*dynamic*/ interface IHabboToolbar extends IUnknown {

        function get events():IEventDispatcher;
        function getIconLocation(k:String):Rectangle;
        function createTransitionToIcon(k:String, _arg_2:BitmapData, _arg_3:int, _arg_4:int):Motion;
        function setToolbarState(k:String):void;
        function setIconBitmap(k:String, _arg_2:BitmapData):void;
        function getRect():Rectangle;
        function get extensionView():IExtensionView;
        function setIconVisibility(k:String, _arg_2:Boolean):void;
        function toggleWindowVisibility(k:String):void;
        function set onDuty(k:Boolean):void;
        function get toolBarAreaWidth():int;

    }
}//package com.sulake.habbo.toolbar

