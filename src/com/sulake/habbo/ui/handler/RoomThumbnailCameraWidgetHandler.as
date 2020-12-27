package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.habbo.ui.widget.camera.RoomThumbnailCameraWidget;
    import com.sulake.habbo.communication.messages.incoming.camera.ThumbnailStatusMessageEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.communication.messages.outgoing.camera.RenderRoomThumbnailMessageComposer;
    import com.sulake.habbo.window.enum.HabboAlertDialogFlag;

    public class RoomThumbnailCameraWidgetHandler implements IRoomWidgetHandler, IDisposable 
    {
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _roomDesktop:RoomDesktop;
        private var _widget:RoomThumbnailCameraWidget;
        private var _thumbnailStatusMessageEvent:ThumbnailStatusMessageEvent;

        public function RoomThumbnailCameraWidgetHandler(k:RoomDesktop)
        {
            this._roomDesktop = k;
        }

        public function get _Str_6647():RoomDesktop
        {
            return this._roomDesktop;
        }

        public function getProcessedEvents():Array
        {
            return [];
        }

        public function getWidgetMessages():Array
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
            this._thumbnailStatusMessageEvent = new ThumbnailStatusMessageEvent(this._Str_23638);
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

        public function processEvent(k:Event):void
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

        public function collectPhotoData():RenderRoomThumbnailMessageComposer
        {
            return RenderRoomThumbnailMessageComposer(this._roomDesktop.roomEngine.getRenderRoomMessage(this._widget.viewPort, this._roomDesktop.roomBackgroundColor, true));
        }

        public function sendPhotoData(k:RenderRoomThumbnailMessageComposer):void
        {
            this._container.connection.send(k);
        }

        private function _Str_23638(k:ThumbnailStatusMessageEvent):void
        {
            this._widget.destroy();
            if (k.getParser().isOk())
            {
                this._container.windowManager.alert("${navigator.thumbnail.camera.title}", "${navigator.thumbnail.camera.success}", HabboAlertDialogFlag.BUTTON_OK, null);
            }
            else
            {
                if (k.getParser().isRenderLimitHit())
                {
                    this._container.windowManager.alert("${generic.alert.title}", "${camera.render.count.info}", 0, null);
                }
            }
        }
    }
}
