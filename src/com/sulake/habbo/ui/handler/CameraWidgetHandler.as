package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.camera.CameraWidget;
    import com.sulake.habbo.communication.messages.incoming._Str_340._Str_7565;
    import com.sulake.habbo.communication.messages.incoming._Str_340._Str_7027;
    import com.sulake.habbo.communication.messages.incoming._Str_340._Str_5617;
    import com.sulake.habbo.communication.messages.incoming._Str_340._Str_5371;
    import com.sulake.habbo.communication.messages.incoming._Str_340._Str_7662;
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.habbo.communication.messages.outgoing.camera.RequestCameraConfigurationComposer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.outgoing.camera.PurchasePhotoMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.camera.PublishPhotoMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.camera.PhotoCompetitionMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.camera.RenderRoomMessageComposer;

    public class CameraWidgetHandler implements IRoomWidgetHandler, IDisposable 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _widget:CameraWidget;
        private var _cameraStorageUrlMessageEvent:_Str_7565;
        private var _cameraPurchaseOKMessageEvent:_Str_7027;
        private var _cameraPublishStatusMessageEvent:_Str_5617;
        private var _competitionStatusMessageEvent:_Str_5371;
        private var _initCameraMessageEvent:_Str_7662;
        private var _roomDesktop:RoomDesktop;
        private var _creditPrice:int = 999;
        private var _ducketPrice:int = 999;
        private var _publishDucketPrice:int = 999;

        public function CameraWidgetHandler(k:RoomDesktop)
        {
            this._roomDesktop = k;
        }

        public function get _Str_20642():int
        {
            return this._creditPrice;
        }

        public function get _Str_19681():int
        {
            return this._ducketPrice;
        }

        public function get _Str_22201():int
        {
            return this._publishDucketPrice;
        }

        public function get type():String
        {
            return RoomWidgetEnum.CAMERA;
        }

        public function get _Str_6647():RoomDesktop
        {
            return this._roomDesktop;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            if (((this._container) && (this._container.toolbar)))
            {
                this._container.toolbar.events.removeEventListener(HabboToolbarEvent.HTE_ICON_CAMERA, this._Str_21956);
            }
            this._container = k;
            if (((this._container) && (this._container.toolbar)))
            {
                this._container.toolbar.events.addEventListener(HabboToolbarEvent.HTE_ICON_CAMERA, this._Str_21956);
            }
            this._cameraStorageUrlMessageEvent = new _Str_7565(this._Str_23768);
            this._cameraPurchaseOKMessageEvent = new _Str_7027(this._Str_16050);
            this._cameraPublishStatusMessageEvent = new _Str_5617(this._Str_22298);
            this._competitionStatusMessageEvent = new _Str_5371(this._Str_24681);
            this._initCameraMessageEvent = new _Str_7662(this._Str_23954);
            this._container.connection.addMessageEvent(this._cameraStorageUrlMessageEvent);
            this._container.connection.addMessageEvent(this._cameraPurchaseOKMessageEvent);
            this._container.connection.addMessageEvent(this._cameraPublishStatusMessageEvent);
            this._container.connection.addMessageEvent(this._competitionStatusMessageEvent);
            this._container.connection.addMessageEvent(this._initCameraMessageEvent);
        }

        public function _Str_23224():void
        {
            if (this._container.sessionDataManager.isPerkAllowed(PerkEnum.CAMERA))
            {
                this._container.connection.send(new RequestCameraConfigurationComposer());
            }
        }

        private function _Str_23954(k:_Str_7662):void
        {
            this._creditPrice = k._Str_2273()._Str_23524();
            this._ducketPrice = k._Str_2273()._Str_22790();
            this._publishDucketPrice = k._Str_2273()._Str_22604();
        }

        private function _Str_16050(k:_Str_7027):void
        {
            if (this._widget)
            {
                this._widget._Str_25644();
            }
        }

        private function _Str_22298(k:_Str_5617):void
        {
            if (this._widget)
            {
                this._widget._Str_12205(k);
            }
        }

        private function _Str_24681(k:_Str_5371):void
        {
            if (this._widget)
            {
                this._widget._Str_10685(k);
            }
        }

        private function _Str_23768(k:_Str_7565):void
        {
            if (!this._widget)
            {
                return;
            }
            var _local_2:String = k._Str_2273().url;
            this._widget._Str_16763(_local_2);
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function _Str_2607():Array
        {
            return null;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }

        public function _Str_2609():Array
        {
            return [];
        }

        public function _Str_2485(k:Event):void
        {
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            if (((this._container) && (this.container.connection)))
            {
                this._container.connection.removeMessageEvent(this._cameraStorageUrlMessageEvent);
                this._container.connection.removeMessageEvent(this._cameraPurchaseOKMessageEvent);
                this._container.connection.removeMessageEvent(this._cameraPublishStatusMessageEvent);
                this._container.connection.removeMessageEvent(this._competitionStatusMessageEvent);
                this._container.connection.removeMessageEvent(this._initCameraMessageEvent);
            }
            this._disposed = true;
            this._container = null;
            this._roomDesktop = null;
            this._widget = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set widget(k:CameraWidget):void
        {
            this._widget = k;
        }

        private function _Str_21956(k:HabboToolbarEvent):void
        {
            if (k.type == HabboToolbarEvent.HTE_ICON_CAMERA)
            {
                if (this._widget)
                {
                    this._widget._Str_10821(k._Str_4856);
                }
            }
        }

        public function _Str_22190(k:String, _arg_2:Function):void
        {
            this._roomDesktop._Str_22190(k, _arg_2);
        }

        public function _Str_19098(k:String, _arg_2:Function):void
        {
            this._roomDesktop._Str_19098(k, _arg_2);
        }

        public function _Str_23090(PhotoId:String):void
        {
            this._container.connection.send(new PurchasePhotoMessageComposer(PhotoId));
        }

        public function _Str_23550():void
        {
            this._container.connection.send(new PublishPhotoMessageComposer());
        }

        public function _Str_24461():void
        {
            this._container.connection.send(new PhotoCompetitionMessageComposer());
        }

        public function _Str_18593():RenderRoomMessageComposer
        {
            return this._roomDesktop.roomEngine._Str_9972(this._widget._Str_14786(), this._roomDesktop._Str_14394) as RenderRoomMessageComposer;
        }

        public function _Str_11986(k:RenderRoomMessageComposer):void
        {
            this._container.connection.send(k);
        }
    }
}
