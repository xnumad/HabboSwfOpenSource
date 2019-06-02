package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.core.utils.Map;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;

    public class NestBreedingSuccessView implements IDisposable, IGetImageListener 
    {
        private static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        private static const CANCEL_BUTTON:String = "cancel_button";
        private static const BUTTON_OK:String = "button.ok";

        private var _window:IFrameWindow;
        private var _isDisposed:Boolean = false;
        private var _widget:AvatarInfoWidget;
        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _petData:RoomUserData;
        private var _petId:int;
        private var _imageCallbackIds:Map;
        private var _rarityCategory:int;

        public function NestBreedingSuccessView(k:AvatarInfoWidget)
        {
            this._widget = k;
            this._windowManager = k.windowManager;
            this._assets = this._widget.assets;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._isDisposed = true;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function open(k:int, _arg_2:int):void
        {
            this._petId = k;
            this._petData = this._widget.handler.roomSession.userDataManager.getUserDataByIndex(k);
            if (this._petData == null)
            {
                Logger.log("Couldn't find the correct pet.");
                return;
            }
            this._rarityCategory = _arg_2;
            this._Str_3248();
            this._window.visible = true;
        }

        private function _Str_3248():void
        {
            if (!this._window)
            {
                this._window = (this._windowManager.buildFromXML((this._assets.getAssetByName("nestBreedingSuccess_xml").content as XML)) as IFrameWindow);
                this._Str_2471(HEADER_BUTTON_CLOSE);
            }
            this._window.center();
            this._window.visible = true;
            this._Str_2471(BUTTON_OK);
            this._window.findChildByName("pet.name").caption = this._petData.name;
            this._window.findChildByName("pet.raritycategory").caption = (("${breedpets.nestbreeding.success.raritycategory." + this._rarityCategory) + "}");
            var k:BitmapData = this._Str_3993(this._petData.figure, "pet_image");
            this._Str_3060(((k != null) ? k : new BitmapData(10, 10)), "pet_image");
            this._window.invalidate();
        }

        public function close():void
        {
            if (this._window)
            {
                this._window.visible = false;
            }
        }

        private function _Str_2471(k:String):void
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onMouseClick);
            }
        }

        private function onMouseClick(k:WindowMouseEvent):void
        {
            switch (k.target.name)
            {
                case HEADER_BUTTON_CLOSE:
                case CANCEL_BUTTON:
                    this.close();
                    return;
                case BUTTON_OK:
                    this.close();
                    return;
            }
        }

        private function _Str_3993(k:String, _arg_2:String, _arg_3:int=64):BitmapData
        {
            var _local_5:BitmapData;
            var _local_8:int;
            var _local_4:PetFigureData = new PetFigureData(k);
            var _local_6:String = "std";
            var _local_7:ImageResult = this._widget.handler.roomEngine.getPetImage(_local_4.typeId, _local_4.paletteId, _local_4.color, new Vector3d(90), _arg_3, this, true, 0, _local_4._Str_3542, _local_6);
            if (_local_7 != null)
            {
                _local_8 = _local_7.id;
                if (_local_8 > 0)
                {
                    this._imageCallbackIds.add(_local_8, _arg_2);
                }
                _local_5 = _local_7.data;
            }
            return _local_5;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (this.disposed)
            {
                return;
            }
            var _local_3:String = this._imageCallbackIds.getValue(k);
            if (_local_3 != null)
            {
                this._Str_3060(_arg_2, _local_3);
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_3060(k:BitmapData, _arg_2:String):void
        {
            if (((!(this._window)) || (!(k))))
            {
                return;
            }
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName(_arg_2) as IBitmapWrapperWindow);
            _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0xFFFFFF);
            var _local_4:Point = new Point(((_local_3.width - k.width) / 2), ((_local_3.height - k.height) / 2));
            _local_3.bitmap.copyPixels(k, k.rect, _local_4, null, null, true);
        }
    }
}
