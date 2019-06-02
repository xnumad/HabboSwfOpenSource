package com.sulake.habbo.ui.widget.furniture.petpackage
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.components.IFrameWindow;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events._Str_3085;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenPetPackageMessage;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class PetPackageFurniWidget extends ConversionTrackingWidget 
    {
        private static const _Str_22236:int = 26;

        private var _window:IFrameWindow;
        private var _typeId:int = -1;
        private var _objectId:int = -1;
        private var _petImage:BitmapData;
        private var _openPetPackageRequested:Boolean = false;

        public function PetPackageFurniWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        override public function dispose():void
        {
            this._Str_2718();
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_3085.RWOPPUE_OPEN_PET_PACKAGE_REQUESTED, this.onObjectUpdate);
            k.addEventListener(_Str_3085.RWOPPUE_OPEN_PET_PACKAGE_RESULT, this.onObjectUpdate);
            k.addEventListener(_Str_3085.RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE, this.onObjectUpdate);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_3085.RWOPPUE_OPEN_PET_PACKAGE_REQUESTED, this.onObjectUpdate);
            k.removeEventListener(_Str_3085.RWOPPUE_OPEN_PET_PACKAGE_RESULT, this.onObjectUpdate);
            k.removeEventListener(_Str_3085.RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE, this.onObjectUpdate);
            super.unregisterUpdateEvents(k);
        }

        private function onObjectUpdate(event:_Str_3085):void
        {
            var nameValidationStatus:int;
            var nameValidationInfo:String;
            var error:String;
            var resultMessage:String;
            switch (event.type)
            {
                case _Str_3085.RWOPPUE_OPEN_PET_PACKAGE_REQUESTED:
                    this._Str_2718();
                    this._objectId = event._Str_1577;
                    this._petImage = event.image;
                    this._typeId = event.typeId;
                    this._Str_3030();
                    this._Str_18625();
                    return;
                case _Str_3085.RWOPPUE_OPEN_PET_PACKAGE_RESULT:
                    if (!this._openPetPackageRequested)
                    {
                        return;
                    }
                    this._openPetPackageRequested = false;
                    nameValidationStatus = event.nameValidationStatus;
                    nameValidationInfo = event.nameValidationInfo;
                    switch (nameValidationStatus)
                    {
                        case 0:
                            this._Str_2718();
                            return;
                        case 1:
                            error = "long";
                            break;
                        case 2:
                            error = "short";
                            break;
                        case 3:
                            error = "chars";
                            break;
                        default:
                            error = "bobba";
                    }
                    resultMessage = this._Str_4902(error, nameValidationInfo);
                    windowManager.alert("${widgets.petpackage.alert.petname.title}", resultMessage, 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
                case _Str_3085.RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE:
                    if (event._Str_1577 != this._objectId)
                    {
                        return;
                    }
                    this._petImage = event.image;
                    this._Str_18625();
                    return;
            }
        }

        private function _Str_4902(k:String, _arg_2:String):String
        {
            var _local_3:String = ("catalog.alert.petname." + k);
            var _local_4:* = (_local_3 + ".additionalInfo");
            localizations.registerParameter(_local_4, "additional_info", _arg_2);
            var _local_5:String = localizations.getLocalization(_local_3);
            var _local_6:String = localizations.getLocalization(_local_4);
            if (((((!(_arg_2 == null)) && (_arg_2.length > 0)) && (!(_local_6 == null))) && (_local_6.length > 0)))
            {
                _local_5 = _local_6;
            }
            return _local_5;
        }

        private function _Str_2718():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._objectId = -1;
            this._openPetPackageRequested = false;
            this._petImage = null;
        }

        private function _Str_3030():void
        {
            var _local_4:IWindow;
            if (this._objectId < 0)
            {
                return;
            }
            var k:IAsset = ((this._petImage != null) ? assets.getAssetByName("petpackage") : assets.getAssetByName("petpackage_new"));
            var _local_2:XmlAsset = XmlAsset(k);
            if (_local_2 == null)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._window = (windowManager.buildFromXML(XML(_local_2.content)) as IFrameWindow);
            this._window.center();
            var _local_3:IWindow = this._window.header.findChildByTag("close");
            if (_local_3)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_3046);
            }
            _local_4 = this._window.findChildByName("pick_name");
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            _local_4 = this._window.findChildByName("cancel");
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            this._window.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            this._Str_18625();
        }

        private function _Str_18625():void
        {
            var _local_2:Point;
            if (((this._petImage == null) || (this._window == null)))
            {
                return;
            }
            var k:IBitmapWrapperWindow = (this._window.findChildByName("pet_image") as IBitmapWrapperWindow);
            if (k != null)
            {
                k.bitmap = new BitmapData(k.width, k.height, true, 0);
                _local_2 = new Point(((k.width - this._petImage.width) / 2), ((k.height - this._petImage.height) / 2));
                k.bitmap.copyPixels(this._petImage, this._petImage.rect, _local_2);
            }
        }

        private function _Str_3046(k:WindowEvent):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_2718();
        }

        private function _Str_3132(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "pick_name":
                    this._Str_24245();
                    return;
                case "cancel":
                    this._Str_2718();
                    return;
            }
        }

        private function _Str_24245():void
        {
            var message:RoomWidgetOpenPetPackageMessage;
            if (((this._openPetPackageRequested) || (this._objectId == -1)))
            {
                return;
            }
            var name:String = this.getName();
            if (((name == null) || (name.length < 1)))
            {
                windowManager.alert("${widgets.petpackage.alert.petname.title}", "${catalog.alert.petname.short}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                {
                    k.dispose();
                });
                return;
            }
            if (messageListener != null)
            {
                this._openPetPackageRequested = true;
                message = new RoomWidgetOpenPetPackageMessage(RoomWidgetOpenPetPackageMessage.RWOPPM_OPEN_PET_PACKAGE, this._objectId, name);
                messageListener.processWidgetMessage(message);
            }
        }

        private function getName():String
        {
            var k:ITextFieldWindow;
            if (this._window)
            {
                k = (this._window.findChildByName("input") as ITextFieldWindow);
                if (k)
                {
                    return k.text;
                }
            }
            return null;
        }
    }
}
