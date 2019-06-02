//com.sulake.habbo.ui.IRoomDesktopGPU

package com.sulake.habbo.ui{
    import __AS3__.vec.Vector;
    import com.sulake.room.object.IRoomObject;
    import flash.geom.Point;
    import com.sulake.habbo.session.IRoomSession;

    public /*dynamic*/ interface IRoomDesktopGPU {

        function showObjectSelector(k:Vector.<IRoomObject>, _arg_2:Point):void;
        function hideObjectSelector():void;
        function get roomSession():IRoomSession;

    }
}//package com.sulake.habbo.ui

