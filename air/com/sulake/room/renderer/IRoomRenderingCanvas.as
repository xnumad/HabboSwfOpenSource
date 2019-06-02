//com.sulake.room.renderer.IRoomRenderingCanvas

package com.sulake.room.renderer{
    import starling.display.Sprite;
    import flash.geom.Point;
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import starling.display.DisplayObject;
    import starling.display.DisplayObjectContainer;
    import away3d.containers.ObjectContainer3D;
    import com.sulake.room.utils.IRoomGeometry;
    import away3d.cameras.Camera3D;
    import com.sulake.room.object.IRoomObject;

    public /*dynamic*/ interface IRoomRenderingCanvas {

        function dispose():void;
        function pause():void;
        function resume():void;
        function set useMask(k:Boolean):void;
        function initialize(k:int, _arg_2:int):void;
        function get width():int;
        function get height():int;
        function setScreenOffset(k:int, _arg_2:int):void;
        function set screenOffsetX(k:int):void;
        function set screenOffsetY(k:int):void;
        function get screenOffsetX():int;
        function get screenOffsetY():int;
        function get wd2():int;
        function get ht2():int;
        function get roomContainerGPU():Sprite;
        function get scale():Number;
        function setScale(k:Number, _arg_2:Point=null, _arg_3:Point=null):void;
        function render(k:int):void;
        function get displayObject():DisplayObject;
        function get displayObjectContainer():DisplayObjectContainer;
        function get starlingDisplayObject():DisplayObject;
        function get starlingDisplayObjectContainer():DisplayObjectContainer;
        function get objectContainer3D():ObjectContainer3D;
        function get geometry():IRoomGeometry;
        function set mouseListener(k:IRoomRenderingCanvasMouseListener):void;
        function handleMouseEvent(k:int, _arg_2:int, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):Boolean;
        function set camera3D(k:Camera3D):void;
        function set visible(k:Boolean):void;
        function setObjectActiveState(k:IRoomObject, _arg_2:Boolean):void;
        function toggleDebugTools():void;
        function setFollowTarget(k:IRoomObject):void;

    }
}//package com.sulake.room.renderer

