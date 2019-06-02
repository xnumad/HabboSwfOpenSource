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
    import com.sulake.habbo.ui.widget.events._Str_5914;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import flash.geom.Point;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class ConfirmPetBreedingView implements IDisposable, IGetImageListener 
    {
        private static const ELEMENT_LIST:String = "element_list";
        private static const PREVIEW_LIST:String = "preview_list";
        private static const ELEM_PET1_ITEMLIST:String = "pet1_itemlist";
        private static const ELEM_PET2_ITEMLIST:String = "pet2_itemlist";
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
        private var _Str_25917:Boolean = false;
        private var _Str_2595:int;
        private var _rarityCategories:Array;
        private var _resultPetTypeId:int;

        public function ConfirmPetBreedingView(k:AvatarInfoWidget)
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

        public function open(k:int, _arg_2:int, _arg_3:int, _arg_4:Array, _arg_5:int, _arg_6:int, _arg_7:int):void
        {
            this._Str_3748 = k;
            this._Str_4105 = _arg_2;
            this._roomUserData = this._Str_2268.handler.roomSession.userDataManager.getUserDataByIndex(k);
            this._petData2 = this._Str_2268.handler.roomSession.userDataManager.getUserDataByIndex(_arg_2);
            this._roomUserData._Str_3897 = _arg_6;
            this._petData2._Str_3897 = _arg_7;
            this._rarityCategories = _arg_4;
            this._resultPetTypeId = _arg_5;
            this._Str_2595 = _arg_3;
            this._Str_3248();
            this._window.visible = true;
        }

        private function _Str_3993(k:String, _arg_2:String, _arg_3:int=64):BitmapData
        {
            var _local_5:BitmapData;
            var _local_8:int;
            var _local_4:PetFigureData = new PetFigureData(k);
            var _local_6:String = "std";
            var _local_7:ImageResult = this._Str_2268.handler.roomEngine.getPetImage(_local_4.typeId, _local_4.paletteId, _local_4.color, new Vector3d(90), _arg_3, this, true, 0, _local_4._Str_3542, _local_6);
            if (_local_7 != null)
            {
                _local_8 = _local_7.id;
                if (_local_8 > 0)
                {
                    this._Str_2879.add(_local_8, _arg_2);
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
            var _local_4:_Str_5914;
            var _local_5:IItemListWindow;
            var _local_6:int;
            var _local_7:PetFigureData;
            var _local_8:IBitmapWrapperWindow;
            this._Str_2268.localizations.registerParameter("breedpets.widget.title", "name", this._roomUserData.name);
            this._Str_2268.localizations.registerParameter("breedpets.widget.pet1.name", "name", this._roomUserData.name);
            this._Str_2268.localizations.registerParameter("breedpets.widget.pet2.name", "name", this._petData2.name);
            this._Str_2268.localizations.registerParameter("breedpets.widget.pet1.description", "name", this._roomUserData.ownerName);
            this._Str_2268.localizations.registerParameter("breedpets.widget.pet2.description", "name", this._petData2.ownerName);
            this._Str_2268.localizations.registerParameter("breedpets.widget.pet1.level", "level", this._roomUserData._Str_3897.toString());
            this._Str_2268.localizations.registerParameter("breedpets.widget.pet2.level", "level", this._petData2._Str_3897.toString());
            this._Str_2268.localizations.registerParameter("breedpets.widget.request", "name", this._petData2.ownerName);
            if (!this._window)
            {
                this._window = (this._windowManager.buildFromXML((this._assets.getAssetByName("confirm_pet_breeding_xml").content as XML)) as IFrameWindow);
                this._Str_2471(HEADER_BUTTON_CLOSE);
            }
            this._window.center();
            this._window.visible = true;
            this._Str_2471(SAVE_BUTTON);
            this._Str_2471(CANCEL_BUTTON);
            this.enable();
            var k:BitmapData = this._Str_3993(this._roomUserData.figure, "preview_image");
            this._Str_3060(((k != null) ? k : new BitmapData(10, 10)), "preview_image");
            k = this._Str_3993(this._petData2.figure, "preview_image2");
            this._Str_3060(((k != null) ? k : new BitmapData(10, 10)), "preview_image2");
            var _local_2:IBitmapWrapperWindow = (this._windowManager.buildFromXML((this._assets.getAssetByName("pet_breeding_pet_preview_xml").content as XML)) as IBitmapWrapperWindow);
            var _local_3:int = 1;
            for each (_local_4 in this._rarityCategories)
            {
                this._Str_2268.localizations.registerParameter(("breedpets.confirmation.widget.raritycategory." + _local_3), "percent", _local_4._Str_12554.toString());
                _local_5 = (this._window.findChildByName(("breeds" + _local_3)) as IItemListWindow);
                _local_5.removeListItems();
                for each (_local_6 in _local_4.breeds)
                {
                    _local_7 = new PetFigureData([this._resultPetTypeId, _local_6].join(" "));
                    _local_8 = (_local_2.clone() as IBitmapWrapperWindow);
                    _local_8.name = ("breed." + _local_6);
                    _local_8.bitmap = new BitmapData(_local_8.width, _local_8.height, true, 0xFFFFFF);
                    if (_local_5)
                    {
                        _local_5.addListItem(_local_8);
                    }
                    k = this._Str_3993(_local_7.figureString, _local_8.name, 64);
                    this._Str_3060(((k != null) ? k : new BitmapData(25, 25, true, 0xFFFFFF)), _local_8.name);
                }
                _local_3++;
            }
            this.arrangeListItems();
            (this._window.findChildByName("puppy.name.input") as ITextFieldWindow).setSelection(0, 0);
            this._window.invalidate();
        }

        private function arrangeListItems():void
        {
            this._Str_3441(BUTTON_LIST);
            this._Str_3441(ELEM_PET1_ITEMLIST);
            this._Str_3441(ELEM_PET2_ITEMLIST);
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
            if (((!(this._window)) || (!(k))))
            {
                return;
            }
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName(_arg_2) as IBitmapWrapperWindow);
            _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0xFFFFFF);
            var _local_4:Point = new Point(((_local_3.width - k.width) / 2), ((_local_3.height - k.height) / 2));
            _local_3.bitmap.copyPixels(k, k.rect, _local_4, null, null, true);
        }

        public function close():void
        {
            if (this._window)
            {
                this._window.visible = false;
            }
        }

        private function disable():void
        {
            this._Str_2513(DESCRIPTION, false, false);
            this._Str_2513(REQUEST, false, false);
            this._Str_2513(CANCEL_BUTTON, false, true);
            this._Str_2513(DESCRIPTION, false, true);
            this._Str_2513(SAVE_BUTTON, false, true);
        }

        public function enable():void
        {
            this._Str_2513(DESCRIPTION, false, false);
            this._Str_2513(REQUEST, false, false);
            this._Str_2513(CANCEL_BUTTON, true, true);
            this._Str_2513(DESCRIPTION, true, true);
            this._Str_2513(SAVE_BUTTON, true, true);
        }

        private function _Str_2471(k:String):void
        {
            var _local_2:IWindow = this._window.findChildByName(k);
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onMouseClick);
            }
        }

        private function _Str_2513(k:String, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_4:IWindow = this._window.findChildByName(k);
            if (_local_4 != null)
            {
                _local_4.visible = _arg_3;
                if (_arg_2)
                {
                    _local_4.enable();
                }
                else
                {
                    _local_4.disable();
                }
            }
        }

        private function onMouseClick(k:WindowMouseEvent):void
        {
            var _local_2:String;
            switch (k.target.name)
            {
                case HEADER_BUTTON_CLOSE:
                case CANCEL_BUTTON:
                    this._Str_2268._Str_24617(this._Str_2595);
                    this.close();
                    return;
                case OK_BUTTON:
                    this.disable();
                    return;
                case SAVE_BUTTON:
                    _local_2 = this._window.findChildByName("puppy.name.input").caption;
                    if (_local_2.length == 0)
                    {
                        this._windowManager.simpleAlert("${breedpets.confirmation.alert.title}", "${breedpets.confirmation.alert.name.required.head}", "${breedpets.confirmation.alert.name.required.desc}");
                    }
                    else
                    {
                        this._Str_2268._Str_23246(this._Str_2595, _local_2, this._roomUserData._Str_2394, this._petData2._Str_2394);
                        this.disable();
                    }
                    return;
            }
        }
    }
}
