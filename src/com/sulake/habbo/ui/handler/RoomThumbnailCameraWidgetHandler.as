package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.habbo.ui.widget.camera.RoomThumbnailCameraWidget;
    import com.sulake.habbo.communication.messages.incoming._Str_340._Str_8053;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.communication.messages.outgoing.camera.RenderRoomThumbnailMessageComposer;
    import com.sulake.habbo.window.enum._Str_3023;

    public class RoomThumbnailCameraWidgetHandler implements IRoomWidgetHandler, IDisposable 
    {
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _roomDesktop:RoomDesktop;
        private var _widget:RoomThumbnailCameraWidget;
        private var _thumbnailStatusMessageEvent:_Str_8053;

        public function RoomThumbnailCameraWidgetHandler(k:RoomDesktop)
        {
            this._roomDesktop = k;
        }

        public function get _Str_6647():RoomDesktop
        {
            return this._roomDesktop;
        }

        public function _Str_2609():Array
        {
            return [];
        }

        public function _Str_2607():Array
        {
            return null;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }

        public function set widget(k:RoomThumbnailCameraWidget):void
        {
            this._widget = k;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
            this._thumbnailStatusMessageEvent = new _Str_8053(this._Str_23638);
            this._container.connection.addMessageEvent(this._thumbnailStatusMessageEvent);
        }

        public function dispose():void
        {
            if ((((this._container) && (this._container.connection)) && (this._thumbnailStatusMessageEvent)))
            {
                this._container.connection.removeMessageEvent(this._thumbnailStatusMessageEvent);
            }
        }

        public function get disposed():Boolean
        {
            return false;
        }

        public function _Str_2485(k:Event):void
        {
        }

        public function update():void
        {
        }

        public function get type():String
        {
            return RoomWidgetEnum.ROOM_THUMBNAIL_CAMERA;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function _Str_18593():RenderRoomThumbnailMessageComposer
        {
            return RenderRoomThumbnailMessageComposer(this._roomDesktop.roomEngine._Str_9972(this._widget._Str_5924, this._roomDesktop._Str_14394, true));
        }

        public function _Str_11986(k:RenderRoomThumbnailMessageComposer):void
        {
            this._container.connection.send(k);
        }

        private function _Str_23638(k:_Str_8053):void
        {
            this._widget.destroy();
            if (k.getParser().isOk())
            {
                this._container.windowManager.alert("${navigator.thumbnail.camera.title}", "${navigator.thumbnail.camera.success}", _Str_3023.BUTTON_OK, null);
            }
            else
            {
                if (k.getParser()._Str_25428())
                {
                    this._container.windowManager.alert("${generic.alert.title}", "${camera.render.count.info}", 0, null);
                }
            }
        }
    }
}
