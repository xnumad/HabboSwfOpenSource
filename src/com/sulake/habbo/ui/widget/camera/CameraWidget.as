package com.sulake.habbo.ui.widget.camera
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.ui.RoomUI;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.quest.IHabboQuestEngine;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.handler.CameraWidgetHandler;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.session.IRoomSession;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.sulake.habbo.sound.HabboSoundTypesEnum;
    import flash.geom.Rectangle;
    import com.sulake.habbo.communication.messages.incoming.camera.CameraPublishStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.camera.CompetitionStatusMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.camera.RenderRoomMessageComposer;

    public class CameraWidget extends RoomWidgetBase
    {
        private var _component:RoomUI;
        private var _viewFinder:CameraViewFinder;
        private var _photoLab:CameraPhotoLab;
        public var url:String;

        public function CameraWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboConfigurationManager, _arg_5:IHabboLocalizationManager, _arg_6:RoomUI)
        {
            super(k, _arg_2, _arg_3, _arg_5);
            this._component = _arg_6;
            this.handler.widget = this;
            this._viewFinder = new CameraViewFinder(this);
            if (this.roomEngine)
            {
                this.roomEngine.events.addEventListener(RoomEngineEvent.DISPOSED, this.onRoomDisposed);
                this.roomEngine.events.addEventListener(RoomEngineEvent.ROOM_ZOOMED, this.onRoomZoomed);
            }
            this.handler.sendInitCameraMessage();
            var _local_7:IHabboQuestEngine = this.handler.roomDesktop.questEngine;
            if (_local_7 != null)
            {
                _local_7.ensureAchievementsInitialized();
            }
        }

        public function get photoLab():CameraPhotoLab
        {
            return this._photoLab;
        }

        public function get catalog():IHabboCatalog
        {
            return this._component.catalog;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._viewFinder)
            {
                this._viewFinder.dispose();
                this._viewFinder = null;
            }
            if (this._photoLab)
            {
                this._photoLab.dispose();
                this._photoLab = null;
            }
            super.dispose();
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (this.handler) ? this.handler.container : null;
        }

        public function get handler():CameraWidgetHandler
        {
            return _handler as CameraWidgetHandler;
        }

        public function get roomEngine():IRoomEngine
        {
            return (this.container) ? this.container.roomEngine : null;
        }

        public function startTakingPhoto(k:String):void
        {
            if (((this.roomEngine) && (!(this.roomEngine.getRoomCanvasScale() == 1))))
            {
                windowManager.alert(_localizations.getLocalization("camera.zoom.missing.header"), _localizations.getLocalization("camera.zoom.missing.body"), 0, null);
                return;
            }
            if (this.component.getProperty("camera.effects.enabled") == "true")
            {
                CameraPhotoLab._Str_23652(this._component.context.configuration.getProperty("image.library.url"), this._component.getProperty("camera.available.effects"), _localizations);
            }
            if (this._photoLab)
            {
                this._photoLab.dispose();
            }
            this._viewFinder._Str_22715(k);
        }

        public function get component():RoomUI
        {
            return this._component;
        }

        public function getXmlWindow(name:String, layer:uint=1):IWindow
        {
            var asset:IAsset;
            var xmlAsset:XmlAsset;
            var window:IWindow;
            try
            {
                asset = assets.getAssetByName((name + "_xml"));
                xmlAsset = XmlAsset(asset);
                window = windowManager.buildFromXML(XML(xmlAsset.content), layer);
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboNavigator", (((((("Failed to build window " + name) + "_xml, ") + asset) + ", ") + windowManager) + "!"));
                throw (e);
            }
            return window;
        }

        private function onRoomDisposed(k:RoomEngineEvent):void
        {
            this.hide();
        }

        private function onRoomZoomed(k:RoomEngineEvent):void
        {
            if (((this.roomEngine) && (!(this.roomEngine.getRoomCanvasScale() == 1))))
            {
                this.hide();
            }
        }

        private function hide():void
        {
            if (this._viewFinder)
            {
                this._viewFinder.hide();
            }
            if (this._photoLab)
            {
                this._photoLab.dispose();
            }
        }

        public function _Str_23027(k:BitmapData, _arg_2:Matrix, _arg_3:Boolean):Boolean
        {
            var _local_4:IRoomSession = this.container.roomSession;
            return this.roomEngine.snapshotRoomCanvasToBitmap(_local_4.roomId, this.container.getFirstCanvasId(), k, _arg_2, _arg_3);
        }

        public function _Str_23751():void
        {
            this.container._Str_2476.playSound(HabboSoundTypesEnum.CAMERA_SHUTTER);
        }

        public function _Str_24657(k:BitmapData):void
        {
            this._photoLab = new CameraPhotoLab(this);
            this._photoLab._Str_23895(k);
        }
        
        public function _Str_25345(k:String, _arg_2:Boolean=false):void
        {
            if (this._photoLab)
            {
                this._photoLab._Str_19577(k);
                if (_arg_2)
                {
                    this._photoLab.show();
                    this._photoLab._Str_23866();
                }
            }
        }

        public function _Str_14786():Rectangle
        {
            if (this._viewFinder)
            {
                return this._viewFinder._Str_14786();
            }
            return new Rectangle(0, 0, 0, 0);
        }

        public function _Str_25644():void
        {
            if (this._photoLab)
            {
                this._photoLab._Str_22386();
            }
        }

        public function _Str_16763(k:String):void
        {
            if (this._photoLab)
            {
                this._photoLab._Str_16763(k);
            }
        }

        public function _Str_12205(k:CameraPublishStatusMessageEvent):void
        {
            if (this._photoLab)
            {
                this._photoLab._Str_12205(k);
            }
        }

        public function competitionStatus(k:CompetitionStatusMessageEvent):void
        {
            if (this._photoLab)
            {
                this._photoLab.competitionStatus(k);
            }
        }

        public function sendPhotoData():Boolean
        {
            var k:RenderRoomMessageComposer = this._viewFinder.getRenderRoomMessage();
            if (this._photoLab)
            {
                k.addEffectData(this._photoLab._Str_22711());
                k.setZoom(this._photoLab._Str_25820());
            }
            k.compressData();
            if (k.isSendable())
            {
                this.handler.sendPhotoData(k);
                return true;
            }
            return false;
        }
    }
}
