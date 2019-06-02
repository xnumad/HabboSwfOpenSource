package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.RoomUserData;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.IAsset;
    import flash.geom.Point;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class BreedMonsterPlantsConfirmationView implements IDisposable, IGetImageListener 
    {
        private static const _Str_13053:int = 0;
        private static const _Str_15445:int = 1;
        private static const ELEMENT_LIST:String = "element_list";
        private static const PREVIEW_LIST:String = "preview_list";
        private static const ELEM_PLANT1_ITEMLIST:String = "plant1_itemlist";
        private static const ELEM_PLANT2_ITEMLIST:String = "plant2_itemlist";
        private static const DESCRIPTION:String = "description";
        private static const REQUEST:String = "request";
        private static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        private static const SAVE_BUTTON:String = "save_button";
        private static const ACCEPT_BUTTON:String = "accept_button";
        private static const CANCEL_BUTTON:String = "cancel_button";
        private static const OK_BUTTON:String = "ok_button";
        private static const BUTTON_LIST:String = "button_list";

        private var _window:IFrameWindow;
        private var _disposed:Boolean = false;
        private var _Str_2268:AvatarInfoWidget;
        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _Str_2879:Map;
        private var _Str_3748:int;
        private var _Str_4105:int;
        private var _roomUserData:RoomUserData;
        private var _petData2:RoomUserData;
        private var _state:int = 0;

        public function BreedMonsterPlantsConfirmationView(k:AvatarInfoWidget)
        {
            this._Str_2268 = k;
            this._windowManager = k.windowManager;
            this._assets = this._Str_2268.assets;
            this._Str_2879 = new Map();
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._Str_2879 != null)
            {
                this._Str_2879.dispose();
            }
            this._Str_2879 = null;
        }

        public function get _Str_3710():int
        {
            return this._Str_3748;
        }

        public function get _Str_5563():int
        {
            return this._Str_4105;
        }

        public function open(k:int, _arg_2:int, _arg_3:Boolean):void
        {
            this._Str_3748 = k;
            this._Str_4105 = _arg_2;
            this._roomUserData = this._Str_2268.handler.roomSession.userDataManager.getUserDataByIndex(k);
            this._petData2 = this._Str_2268.handler.roomSession.userDataManager.getUserDataByIndex(_arg_2);
            this._state = ((_arg_3) ? _Str_15445 : _Str_13053);
            this._Str_3248();
            this._window.visible = true;
        }

        private function _Str_3993(k:String, _arg_2:String):BitmapData
        {
            var _local_4:BitmapData;
            var _local_7:int;
            var _local_3:PetFigureData = new PetFigureData(k);
            var _local_5:String = "std";
            var _local_6:ImageResult = this._Str_2268.handler.roomEngine.getPetImage(_local_3.typeId, _local_3.paletteId, _local_3.color, new Vector3d(90), 64, this, true, 0, _local_3._Str_3542, _local_5);
            if (_local_6 != null)
            {
                _local_7 = _local_6.id;
                if (_local_7 > 0)
                {
                    this._Str_2879.add(_local_7, _arg_2);
                }
                _local_4 = _local_6.data;
            }
            return _local_4;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (this.disposed)
            {
                return;
            }
            var _local_3:String = this._Str_2879.getValue(k);
            if (_local_3 != null)
            {
                this._Str_3060(_arg_2, _local_3);
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_3248():void
        {
            this._Str_2268.localizations.registerParameter("breedpets.widget.title", "name", this._roomUserData.name);
            this._Str_2268.localizations.registerParameter("breedpets.widget.plant1.name", "name", this._roomUserData.name);
            this._Str_2268.localizations.registerParameter("breedpets.widget.plant2.name", "name", this._petData2.name);
            this._Str_2268.localizations.registerParameter("breedpets.widget.plant1.description", "name", this._roomUserData.ownerName);
            this._Str_2268.localizations.registerParameter("breedpets.widget.plant2.description", "name", this._petData2.ownerName);
            this._Str_2268.localizations.registerParameter("breedpets.widget.plant1.raritylevel", "level", this._roomUserData.rarityLevel.toString());
            this._Str_2268.localizations.registerParameter("breedpets.widget.plant2.raritylevel", "level", this._petData2.rarityLevel.toString());
            this._Str_2268.localizations.registerParameter("breedpets.widget.request", "name", this._petData2.ownerName);
            if (!this._window)
            {
                this._window = (this._windowManager.buildFromXML((this._assets.getAssetByName("breed_pets_confirmation_xml").content as XML)) as IFrameWindow);
                this._Str_2471(HEADER_BUTTON_CLOSE);
            }
            this._window.center();
            this._window.visible = true;
            this._Str_2471(SAVE_BUTTON);
            this._Str_2471(ACCEPT_BUTTON);
            this._Str_2471(CANCEL_BUTTON);
            this._Str_2513(DESCRIPTION, false);
            this._Str_2513(REQUEST, false);
            this._Str_2513(SAVE_BUTTON, false);
            this._Str_2513(SAVE_BUTTON, false);
            this._Str_2513(ACCEPT_BUTTON, false);
            this._Str_2513(CANCEL_BUTTON, true);
            this._Str_2513(CANCEL_BUTTON, true);
            switch (this._state)
            {
                case _Str_13053:
                    this._Str_2513(DESCRIPTION, true);
                    this._Str_2513(SAVE_BUTTON, true);
                    break;
                case _Str_15445:
                    this._Str_2513(REQUEST, true);
                    this._Str_2513(ACCEPT_BUTTON, true);
                    break;
            }
            var k:BitmapData = this._Str_3993(this._roomUserData.figure, "preview_image");
            this._Str_3060(((k != null) ? k : new BitmapData(10, 10)), "preview_image");
            k = this._Str_3993(this._petData2.figure, "preview_image2");
            this._Str_3060(((k != null) ? k : new BitmapData(10, 10)), "preview_image2");
            this.arrangeListItems();
            this._window.invalidate();
        }

        private function arrangeListItems():void
        {
            this._Str_3441(BUTTON_LIST);
            this._Str_3441(ELEM_PLANT1_ITEMLIST);
            this._Str_3441(ELEM_PLANT2_ITEMLIST);
            this._Str_3441(PREVIEW_LIST);
            this._Str_3441(ELEMENT_LIST);
            this._window._Str_5665();
        }

        private function _Str_3441(k:String):void
        {
            var _local_2:IItemListWindow = (this._window.findChildByName(k) as IItemListWindow);
            if (_local_2 != null)
            {
                _local_2.arrangeListItems();
            }
        }

        private function _Str_3060(k:BitmapData, _arg_2:String):void
        {
            var _local_6:BitmapData;
            if (((!(this._window)) || (!(k))))
            {
                return;
            }
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName(_arg_2) as IBitmapWrapperWindow);
            _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height);
            var _local_4:IAsset = (this._assets.getAssetByName("breed_pets_preview_bg_png") as IAsset);
            if (_local_4)
            {
                _local_6 = (_local_4.content as BitmapData);
                _local_3.bitmap.copyPixels(_local_6, _local_6.rect, new Point(0, 0));
            }
            var _local_5:Point = new Point(((_local_3.width - k.width) / 2), ((_local_3.height - k.height) / 2));
            _local_3.bitmap.copyPixels(k, k.rect, _local_5, null, null, true);
        }

        private function close():void
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

        private function _Str_2513(k:String, _arg_2:Boolean):void
        {
            var _local_3:IWindow = this._window.findChildByName(k);
            if (_local_3 != null)
            {
                _local_3.visible = _arg_2;
            }
        }

        private function onMouseClick(k:WindowMouseEvent):void
        {
            switch (k.target.name)
            {
                case HEADER_BUTTON_CLOSE:
                case CANCEL_BUTTON:
                    this._Str_2268._Str_19339(this._Str_3748, this._Str_4105);
                    this.close();
                    return;
                case OK_BUTTON:
                    this.close();
                    return;
                case ACCEPT_BUTTON:
                    this.close();
                    this._Str_2268._Str_24933(this._Str_3748, this._Str_4105);
                    return;
                case SAVE_BUTTON:
                    this._Str_2268._Str_22619(this._Str_3748, this._Str_4105);
                    if (this._roomUserData.ownerId != this._petData2.ownerId)
                    {
                        this._Str_2268._Str_23724(this._Str_3710, this._Str_4105);
                    }
                    this.close();
                    return;
            }
        }
    }
}
