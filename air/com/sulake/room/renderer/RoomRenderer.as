//com.sulake.room.renderer.RoomRenderer

package com.sulake.room.renderer{
    import com.sulake.core.utils.MapString;
    import com.sulake.core.runtime.Component;
    import com.sulake.room.object.IRoomObject;

    public class RoomRenderer implements IRoomRenderer, IRoomSpriteCanvasContainer {

        private var _objects:MapString;
        private var _canvases:MapString;
        private var _component:Component;
        private var _disposed:Boolean;
        private var _roomObjectVariableAccurateZ:String;
        private var _canvas3d:IRoomRenderingCanvas;

        public function RoomRenderer(k:Component);

        public function get disposed():Boolean;

        public function get roomObjectVariableAccurateZ():String;

        public function set roomObjectVariableAccurateZ(k:String):void;

        public function dispose():void;

        public function reset():void;

        public function getRoomObjectIdentifier(k:IRoomObject):String;

        public function feedRoomObject(k:IRoomObject):void;

        public function removeRoomObject(k:IRoomObject):void;

        public function getRoomObject(k:String):IRoomObject;

        public function getRoomObjectWithIndex(k:int):IRoomObject;

        public function getRoomObjectIdWithIndex(k:int):String;

        public function getRoomObjectCount():int;

        public function render():void;

        public function createCanvas(k:int, _arg_2:int, _arg_3:int, _arg_4:int):IRoomRenderingCanvas;

        public function createCanvas3d(k:int, _arg_2:int, _arg_3:int, _arg_4:int):IRoomRenderingCanvas;

        protected function createCanvasInstance(k:int, _arg_2:int, _arg_3:int, _arg_4:int):IRoomRenderingCanvas;

        public function getCanvas(k:int):IRoomRenderingCanvas;

        public function disposeCanvas(k:int):Boolean;

        public function update(k:uint):void;


    }
}//package com.sulake.room.renderer

