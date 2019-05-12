package com.sulake.room.renderer
{
    import com.sulake.core.utils.Map;
    import com.sulake.core.runtime.Component;
    import com.sulake.room.object.IRoomObject;
    import flash.utils.getTimer;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.room.utils.RoomGeometry;

    public class RoomRenderer implements IRoomRenderer, IRoomSpriteCanvasContainer 
    {
        private var _objects:Map;
        private var _canvases:Map;
        private var _component:Component;
        private var _disposed:Boolean = false;
        private var _roomObjectVariableAccurateZ:String = null;

        public function RoomRenderer(k:Component)
        {
            this._objects = new Map();
            this._canvases = new Map();
            if (k != null)
            {
                this._component = k;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_12010():String
        {
            return this._roomObjectVariableAccurateZ;
        }

        public function set _Str_12010(k:String):void
        {
            this._roomObjectVariableAccurateZ = k;
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:RoomSpriteCanvas;
            if (this.disposed)
            {
                return;
            }
            if (this._canvases != null)
            {
                k = 0;
                while (k < this._canvases.length)
                {
                    _local_2 = (this._canvases.getWithIndex(k) as RoomSpriteCanvas);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._canvases.dispose();
                this._canvases = null;
            }
            if (this._objects != null)
            {
                this._objects.dispose();
                this._objects = null;
            }
            if (this._component != null)
            {
                this._component = null;
            }
            this._disposed = true;
        }

        public function reset():void
        {
            this._objects.reset();
        }

        public function _Str_16543(k:IRoomObject):String
        {
            if (k != null)
            {
                return String(k.getInstanceId());
            }
            return null;
        }

        public function _Str_17585(k:IRoomObject):void
        {
            if (k == null)
            {
                return;
            }
            this._objects.add(this._Str_16543(k), k);
        }

        public function _Str_16309(k:IRoomObject):void
        {
            var _local_4:RoomSpriteCanvas;
            var _local_2:String = this._Str_16543(k);
            this._objects.remove(_local_2);
            var _local_3:int;
            while (_local_3 < this._canvases.length)
            {
                _local_4 = (this._canvases.getWithIndex(_local_3) as RoomSpriteCanvas);
                if (_local_4 != null)
                {
                    _local_4._Str_17192(_local_2);
                }
                _local_3++;
            }
        }

        public function getRoomObject(k:String):IRoomObject
        {
            return this._objects.getValue(k) as IRoomObject;
        }

        public function _Str_3652(k:int):IRoomObject
        {
            return this._objects.getWithIndex(k) as IRoomObject;
        }

        public function _Str_19106(k:int):String
        {
            return this._objects.getKey(k) as String;
        }

        public function _Str_3391():int
        {
            return this._objects.length;
        }

        public function render():void
        {
            var _local_3:IRoomRenderingCanvas;
            var k:int = getTimer();
            ErrorReportStorage.addDebugData("Canvas count", ("Canvas count: " + this._canvases.length));
            var _local_2:int = (this._canvases.length - 1);
            while (_local_2 >= 0)
            {
                _local_3 = (this._canvases.getWithIndex(_local_2) as IRoomRenderingCanvas);
                if (_local_3 != null)
                {
                    _local_3.render(k);
                }
                _local_2--;
            }
        }

        public function _Str_22057(k:int, _arg_2:int, _arg_3:int, _arg_4:int):IRoomRenderingCanvas
        {
            var _local_6:RoomGeometry;
            var _local_5:IRoomRenderingCanvas = (this._canvases.getValue(String(k)) as IRoomRenderingCanvas);
            if (_local_5 != null)
            {
                _local_5.initialize(_arg_2, _arg_3);
                _local_6 = (_local_5.geometry as RoomGeometry);
                if (_local_6)
                {
                    _local_6.scale = _arg_4;
                }
                return _local_5;
            }
            _local_5 = this._Str_24126(k, _arg_2, _arg_3, _arg_4);
            this._canvases.add(String(k), _local_5);
            return _local_5;
        }

        protected function _Str_24126(k:int, _arg_2:int, _arg_3:int, _arg_4:int):IRoomRenderingCanvas
        {
            return new RoomSpriteCanvas(this, k, _arg_2, _arg_3, _arg_4);
        }

        public function _Str_1664(k:int):IRoomRenderingCanvas
        {
            var _local_2:IRoomRenderingCanvas = (this._canvases.getValue(String(k)) as IRoomRenderingCanvas);
            return _local_2;
        }

        public function _Str_25191(k:int):Boolean
        {
            var _local_2:RoomSpriteCanvas = (this._canvases.remove(String(k)) as RoomSpriteCanvas);
            if (_local_2 != null)
            {
                _local_2.dispose();
            }
            return false;
        }

        public function update(k:uint):void
        {
            var _local_3:RoomSpriteCanvas;
            this.render();
            var _local_2:int = (this._canvases.length - 1);
            while (_local_2 >= 0)
            {
                _local_3 = (this._canvases.getWithIndex(_local_2) as RoomSpriteCanvas);
                if (_local_3 != null)
                {
                    _local_3.update();
                }
                _local_2--;
            }
        }
    }
}
