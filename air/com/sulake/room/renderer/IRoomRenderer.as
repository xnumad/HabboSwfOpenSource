//com.sulake.room.renderer.IRoomRenderer

package com.sulake.room.renderer{
    public /*dynamic*/ interface IRoomRenderer extends IRoomRendererBase {

        function set roomObjectVariableAccurateZ(k:String):void;
        function createCanvas(k:int, _arg_2:int, _arg_3:int, _arg_4:int):IRoomRenderingCanvas;
        function createCanvas3d(k:int, _arg_2:int, _arg_3:int, _arg_4:int):IRoomRenderingCanvas;
        function getCanvas(k:int):IRoomRenderingCanvas;
        function disposeCanvas(k:int):Boolean;

    }
}//package com.sulake.room.renderer

