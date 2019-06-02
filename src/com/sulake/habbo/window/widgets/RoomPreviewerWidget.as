package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.habbo.room.preview.RoomPreviewer;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.display.DisplayObject;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import flash.geom.Point;
    import com.sulake.core.window.IWindow;
    import flash.display.Bitmap;
    import flash.display.BitmapData;

    public class RoomPreviewerWidget implements _Str_4709 
    {
        public static const ROOM_PREVIEWER:String = "room_previewer";
        private static const ROOM_PREVIEWER_SCALE:String = (ROOM_PREVIEWER + ":scale");
        private static const ROOM_PREVIEWER_OFFSET_X:String = (ROOM_PREVIEWER + ":offsetx");
        private static const ROOM_PREVIEWER_OFFSET_Y:String = (ROOM_PREVIEWER + ":offsety");
        private static const ROOM_PREVIEWER_ZOOM:String = (ROOM_PREVIEWER + ":zoom");
        private static const PROPERTY_SCALE:PropertyStruct = new PropertyStruct(ROOM_PREVIEWER_SCALE, RoomPreviewer.SCALE_NORMAL, PropertyStruct.INT, false, [RoomPreviewer.SCALE_SMALL, RoomPreviewer.SCALE_NORMAL]);
        private static const PROPERTY_OFFSET_X:PropertyStruct = new PropertyStruct(ROOM_PREVIEWER_OFFSET_X, 0, PropertyStruct.INT, false);
        private static const PROPERTY_OFFSET_Y:PropertyStruct = new PropertyStruct(ROOM_PREVIEWER_OFFSET_Y, 0, PropertyStruct.INT, false);
        private static const PROPERTY_ZOOM:PropertyStruct = new PropertyStruct(ROOM_PREVIEWER_ZOOM, 1, PropertyStruct.INT, false);
        private static var _Str_12060:int = 2;

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _root:IWindowContainer;
        private var _roomCanvas:IDisplayObjectWrapper;
        private var _roomPreviewer:RoomPreviewer;
        private var _scale:int;
        private var _offsetX:int = 0;
        private var _offsetY:int = 0;
        private var _zoom:int;

        public function RoomPreviewerWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            var _local_3:DisplayObject;
            this._scale = int(PROPERTY_SCALE.value);
            this._zoom = int(PROPERTY_ZOOM.value);
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._roomPreviewer = new RoomPreviewer(_arg_2.roomEngine, _Str_12060++);
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("room_previewer_xml").content as XML)) as IWindowContainer);
            this._roomCanvas = (this._root.findChildByName("room_canvas") as IDisplayObjectWrapper);
            if (this._roomPreviewer)
            {
                this._root.addEventListener(WindowMouseEvent.CLICK, this._Str_24167);
                this._root.addEventListener(WindowEvent.WINDOW_EVENT_RESIZE, this._Str_25015);
                this._roomPreviewer.reset(false);
                _local_3 = this._roomPreviewer.getRoomCanvas(this._roomCanvas.width, this._roomCanvas.height);
                if (_local_3 != null)
                {
                    this._roomCanvas.setDisplayObject(_local_3);
                }
            }
            this._widgetWindow._Str_2429 = this._root;
            this._root.width = this._widgetWindow.width;
            this._root.height = this._widgetWindow.height;
            this._roomPreviewer.modifyRoomCanvas(this._root.width, this._root.height);
        }

        public function get scale():int
        {
            return this._scale;
        }

        public function set scale(scale:int):void
        {
            this._scale = scale;
            this.refresh();
        }

        public function get offsetX():int
        {
            return this._offsetX;
        }

        public function set offsetX(offsetX:int):void
        {
            this._offsetX = offsetX;
            this.refresh();
        }

        public function get offsetY():int
        {
            return this._offsetY;
        }

        public function set offsetY(offsetY:int):void
        {
            this._offsetY = offsetY;
            this.refresh();
        }

        public function get zoom():int
        {
            return this._zoom;
        }

        public function set zoom(zoom:int):void
        {
            this._zoom = zoom;
            this.refresh();
        }

        public function get properties():Array
        {
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(PROPERTY_SCALE.withValue(this._scale));
            k.push(PROPERTY_OFFSET_X.withValue(this._offsetX));
            k.push(PROPERTY_OFFSET_Y.withValue(this._offsetY));
            k.push(PROPERTY_ZOOM.withValue(this._zoom));
            return k;
        }

        public function set properties(k:Array):void
        {
            for each (var property:PropertyStruct in k)
            {
                switch (property.key)
                {
                    case ROOM_PREVIEWER_SCALE:
                        this.scale = int(property.value);
                        break;
                    case ROOM_PREVIEWER_OFFSET_X:
                        this.offsetX = int(property.value);
                        break;
                    case ROOM_PREVIEWER_OFFSET_Y:
                        this.offsetY = int(property.value);
                        break;
                    case ROOM_PREVIEWER_ZOOM:
                        this.zoom = int(property.value);
                        break;
                }
            }
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._roomPreviewer)
                {
                    this._roomPreviewer.dispose();
                    this._roomPreviewer = null;
                }
                if (this._root != null)
                {
                    this._root.dispose();
                    this._root = null;
                }
                if (this._widgetWindow != null)
                {
                    this._widgetWindow._Str_2429 = null;
                    this._widgetWindow = null;
                }
                this._windowManager = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }

        private function refresh():void
        {
            var k:DisplayObject;
            if (this._roomPreviewer)
            {
                if ((this._scale == RoomPreviewer.SCALE_NORMAL))
                {
                    this._roomPreviewer.zoomIn();
                }
                else
                {
                    this._roomPreviewer.zoomOut();
                }
                this._roomPreviewer._Str_16605 = new Point(this._offsetX, this._offsetY);
                k = this._roomCanvas.getDisplayObject();
                k.scaleX = (k.scaleY = this.zoom);
                k.x = this.offsetX;
                k.y = this.offsetY;
            }
        }

        public function toString():String
        {
            return "RoomPreviewerWidget";
        }

        private function onClick(k:WindowMouseEvent):void
        {
        }

        private function _Str_25015(k:WindowEvent, _arg_2:IWindow=null):void
        {
            var _local_3:int = k.window.width;
            var _local_4:int = k.window.height;
            this._roomPreviewer.modifyRoomCanvas(_local_3, _local_4);
        }

        private function _Str_24167(k:WindowMouseEvent):void
        {
            this._roomPreviewer._Str_15499();
        }

        public function get _Str_26451():RoomPreviewer
        {
            return this._roomPreviewer;
        }

        public function _Str_9202(k:BitmapData):void
        {
            var _local_2:Bitmap = new Bitmap(k);
            _local_2.scaleX = 2;
            _local_2.scaleY = 2;
            this._roomCanvas.setDisplayObject(_local_2);
        }
    }
}


