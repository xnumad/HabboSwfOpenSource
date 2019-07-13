package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.utils.Map;
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.IAsset;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectOperationEnum;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.inventory.enum.FurniCategory;

    public class BreedPetsResultView implements IDisposable, IGetImageListener 
    {
        private static const ELEMENT_LIST:String = "element_list";
        private static const PREVIEW_LIST:String = "preview_list";
        private static const PREVIEW_BUTTONLIST:String = "preview_buttonlist";
        private static const ELEM_SEED1_ITEMLIST:String = "seed1_itemlist";
        private static const ELEM_SEED2_ITEMLIST:String = "seed2_itemlist";
        private static const ELEM_SEED1_BUTTONLIST:String = "seed1_buttonlist";
        private static const ELEM_SEED2_BUTTONLIST:String = "seed2_buttonlist";
        private static const HEADER_BUTTON_CLOSE:String = "header_button_close";
        private static const CLOSE_BUTTON:String = "close_button";
        private static const SAVE_BUTTON:String = "save_button";
        private static const ELEM_PLACE_BUTTON1:String = "place_button1";
        private static const ELEM_PLACE_BUTTON2:String = "place_button2";
        private static const ELEM_PICK_BUTTON1:String = "pick_button1";
        private static const ELEM_PICK_BUTTON2:String = "pick_button2";
        private static const PREVIEW_IMAGE:String = "preview_image";
        private static const ELEM_PREVIEW_IMAGE2:String = "preview_image2";
        private static const PREVIEW_IMAGE_REGION:String = "preview_image_region";
        private static const ELEM_PREVIEW_IMAGE_REGION2:String = "preview_image_region2";
        private static const BUTTON_LIST:String = "button_list";
        private static const DESCRIPTION:String = "description";
        private static const DESCRIPTION_SORRY:String = "description_sorry";
        private static const INFO:String = "info";
        private static const INFO_SORRY:String = "info_sorry";
        private static const ELEM_INFO_MUTATE1:String = "info_mutate1";
        private static const ELEM_INFO_MUTATE2:String = "info_mutate2";
        private static const OK_BUTTON:String = "ok_button";

        private var _window:IFrameWindow;
        private var _disposed:Boolean = false;
        private var _Str_2268:AvatarInfoWidget;
        private var _windowManager:IHabboWindowManager;
        private var _assets:IAssetLibrary;
        private var _Str_2879:Map;
        private var _Str_3111:BreedPetsResultData;
        private var _resultData2:BreedPetsResultData;
        private var _Str_10220:Boolean;

        public function BreedPetsResultView(k:AvatarInfoWidget)
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

        public function open(k:BreedPetsResultData, _arg_2:BreedPetsResultData):void
        {
            this._Str_3111 = k;
            this._resultData2 = _arg_2;
            this._Str_3248();
            this.show();
        }

        private function _Str_3993(k:int, _arg_2:String):BitmapData
        {
            var _local_3:BitmapData;
            var _local_5:int;
            var _local_4:ImageResult = this._Str_2268.handler.container.roomEngine.getFurnitureImage(k, new Vector3d(90, 0, 0), 64, this, 0, null, -1, -1, null);
            if (_local_4 != null)
            {
                _local_5 = _local_4.id;
                if (_local_5 > 0)
                {
                    this._Str_2879.add(_local_5, _arg_2);
                }
                _local_3 = _local_4.data;
            }
            return _local_3;
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
            var _local_8:String;
            var k:IFurnitureData = this._Str_2268.handler.container.sessionDataManager.getFloorItemData(this._Str_3111.classId);
            var _local_2:IFurnitureData = this._Str_2268.handler.container.sessionDataManager.getFloorItemData(this._resultData2.classId);
            this._Str_2268.localizations.registerParameter("breedpetsresult.widget.seed1.name", "name", ((k != null) ? k.localizedName : ""));
            this._Str_2268.localizations.registerParameter("breedpetsresult.widget.seed2.name", "name", ((_local_2 != null) ? _local_2.localizedName : ""));
            this._Str_2268.localizations.registerParameter("breedpetsresult.widget.seed1.description", "name", this._Str_3111.userName);
            this._Str_2268.localizations.registerParameter("breedpetsresult.widget.seed2.description", "name", this._resultData2.userName);
            this._Str_2268.localizations.registerParameter("breedpetsresult.widget.seed1.raritylevel", "level", this._Str_3111.rarityLevel.toString());
            this._Str_2268.localizations.registerParameter("breedpetsresult.widget.seed2.raritylevel", "level", this._resultData2.rarityLevel.toString());
            var _local_3:int = this._Str_2268.handler.container.sessionDataManager.userId;
            var _local_4:* = (this._Str_3111.userId == _local_3);
            var _local_5:* = (this._resultData2.userId == _local_3);
            var _local_6:Boolean = ((_local_4) || (_local_5));
            if (!_local_6)
            {
                _local_8 = "";
                if (((!(this._Str_3111.userName == null)) && (!(this._Str_3111.userName == ""))))
                {
                    _local_8 = this._Str_3111.userName;
                }
                else
                {
                    if (((!(this._resultData2.userName == null)) && (!(this._resultData2.userName == ""))))
                    {
                        _local_8 = this._resultData2.userName;
                    }
                }
                this._Str_2268.localization.registerParameter("breedpetsresult.widget.text.sorry", "name", _local_8);
            }
            if (!this._window)
            {
                this._window = (this._windowManager.buildFromXML((this._assets.getAssetByName("breed_pets_result_xml").content as XML)) as IFrameWindow);
                this._Str_2471(HEADER_BUTTON_CLOSE);
            }
            this._window.center();
            this._window.visible = true;
            this._Str_2513(ELEM_SEED1_BUTTONLIST, false);
            this._Str_2513(ELEM_SEED2_BUTTONLIST, false);
            this._Str_2513(ELEM_PLACE_BUTTON1, false);
            this._Str_2513(ELEM_PICK_BUTTON1, false);
            this._Str_2513(ELEM_PLACE_BUTTON2, false);
            this._Str_2513(ELEM_PICK_BUTTON2, false);
            this._Str_2513(CLOSE_BUTTON, false);
            if (_local_4)
            {
                this._Str_2513(ELEM_PLACE_BUTTON1, true);
                this._Str_2513(ELEM_SEED1_BUTTONLIST, true);
            }
            if (_local_5)
            {
                this._Str_2513(ELEM_PLACE_BUTTON2, true);
                this._Str_2513(ELEM_SEED2_BUTTONLIST, true);
            }
            if (_local_6)
            {
                this._Str_2513(PREVIEW_BUTTONLIST, true);
            }
            this._Str_2513(ELEM_SEED2_ITEMLIST, true);
            if (this._resultData2.stuffId == -1)
            {
                this._Str_2513(ELEM_SEED2_ITEMLIST, false);
            }
            this._Str_2513(DESCRIPTION, true);
            this._Str_2513(INFO, true);
            this._Str_2513(DESCRIPTION_SORRY, false);
            this._Str_2513(INFO, false);
            this._Str_2513(BUTTON_LIST, false);
            this._Str_2513(CLOSE_BUTTON, false);
            if (!_local_6)
            {
                this._Str_2513(PREVIEW_BUTTONLIST, false);
                this._Str_2513(DESCRIPTION, false);
                this._Str_2513(INFO, false);
                this._Str_2513(SAVE_BUTTON, false);
                this._Str_2513(ELEM_PLACE_BUTTON1, false);
                this._Str_2513(ELEM_PICK_BUTTON1, false);
                this._Str_2513(ELEM_PLACE_BUTTON2, false);
                this._Str_2513(ELEM_PICK_BUTTON2, false);
                this._Str_2513(BUTTON_LIST, true);
                this._Str_2513(DESCRIPTION_SORRY, true);
                this._Str_2513(INFO_SORRY, true);
                this._Str_2513(CLOSE_BUTTON, true);
            }
            this._Str_2513(ELEM_INFO_MUTATE1, false);
            this._Str_2513(ELEM_INFO_MUTATE2, false);
            if (this._Str_3111._Str_4788)
            {
                this._Str_2513(ELEM_INFO_MUTATE1, true);
            }
            if (this._resultData2._Str_4788)
            {
                this._Str_2513(ELEM_INFO_MUTATE2, true);
            }
            this._Str_2471(SAVE_BUTTON);
            this._Str_2471(HEADER_BUTTON_CLOSE);
            this._Str_2471(CLOSE_BUTTON);
            this._Str_2471(ELEM_PLACE_BUTTON1);
            this._Str_2471(ELEM_PLACE_BUTTON2);
            this._Str_2471(ELEM_PICK_BUTTON1);
            this._Str_2471(ELEM_PICK_BUTTON2);
            this._Str_2471(PREVIEW_IMAGE_REGION);
            this._Str_2471(ELEM_PREVIEW_IMAGE_REGION2);
            var _local_7:BitmapData = this._Str_3993(k.id, PREVIEW_IMAGE);
            this._Str_3060(((_local_7 != null) ? _local_7 : new BitmapData(10, 10)), PREVIEW_IMAGE);
            _local_7 = this._Str_3993(k.id, ELEM_PREVIEW_IMAGE2);
            this._Str_3060(((_local_7 != null) ? _local_7 : new BitmapData(10, 10)), ELEM_PREVIEW_IMAGE2);
            this.arrangeListItems();
            this._window.invalidate();
        }

        private function _Str_2513(k:String, _arg_2:Boolean):void
        {
            var _local_3:IWindow = this._window.findChildByName(k);
            if (_local_3 != null)
            {
                _local_3.visible = _arg_2;
            }
        }

        private function arrangeListItems():void
        {
            this._Str_3441(ELEM_SEED1_ITEMLIST);
            this._Str_3441(ELEM_SEED2_ITEMLIST);
            this._Str_3441(ELEM_SEED1_BUTTONLIST);
            this._Str_3441(ELEM_SEED2_BUTTONLIST);
            this._Str_3441(PREVIEW_BUTTONLIST);
            this._Str_3441(BUTTON_LIST);
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

        public function close():void
        {
            if (this._Str_2268)
            {
                this._Str_2268._Str_24769(this);
            }
        }

        public function show():void
        {
            this._Str_10220 = false;
            if (this._window)
            {
                this._window.visible = true;
            }
        }

        private function hide():void
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
                case CLOSE_BUTTON:
                    this.close();
                    return;
                case ELEM_PLACE_BUTTON1:
                    this._Str_10220 = this._Str_7009(this._Str_3111.stuffId);
                    if (this._Str_10220)
                    {
                        this.close();
                    }
                    return;
                case ELEM_PLACE_BUTTON2:
                    this._Str_10220 = this._Str_7009(this._resultData2.stuffId);
                    if (this._Str_10220)
                    {
                        this.close();
                    }
                    return;
                case ELEM_PICK_BUTTON1:
                    this._Str_19552(this._Str_3111.stuffId);
                    return;
                case ELEM_PICK_BUTTON2:
                    this._Str_19552(this._resultData2.stuffId);
                    return;
                case PREVIEW_IMAGE_REGION:
                    this._Str_21990(this._Str_3111.stuffId);
                    return;
                case ELEM_PREVIEW_IMAGE_REGION2:
                    this._Str_21990(this._resultData2.stuffId);
                    return;
                case OK_BUTTON:
                    this.hide();
                    return;
                case SAVE_BUTTON:
                    this.hide();
                    return;
            }
        }

        private function _Str_21990(k:int):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:IFurnitureItem = this._Str_17630(k);
            if (_local_2 != null)
            {
                this._Str_2268.handler.container.inventory._Str_4511(InventoryCategory.FURNI);
                return true;
            }
            var _local_3:IRoomObject = this._Str_8946(k);
            if (_local_3 != null)
            {
                _local_4 = this._Str_2268.handler.container.roomSession.roomId;
                _local_5 = RoomObjectCategoryEnum.CONST_10;
                this._Str_2268.handler.container.roomEngine._Str_5538(_local_4, _local_3.getId(), _local_5);
                return true;
            }
            return false;
        }

        private function _Str_19552(k:int):Boolean
        {
            var _local_2:IRoomObject = this._Str_8946(k);
            if (_local_2 != null)
            {
                this._Str_2268.handler.container.roomEngine.updateObjectWallItemData(_local_2.getId(), RoomObjectCategoryEnum.CONST_10, RoomObjectOperationEnum.OBJECT_PICKUP);
                return true;
            }
            return false;
        }

        private function _Str_7009(k:int):Boolean
        {
            var _local_2:IFurnitureItem = this._Str_17630(k);
            return this._Str_5337(_local_2);
        }

        private function _Str_8946(k:int):IRoomObject
        {
            var _local_2:int = this._Str_2268.handler.container.roomSession.roomId;
            var _local_3:int = RoomObjectCategoryEnum.CONST_10;
            var _local_4:IRoomObject = this._Str_2268.handler.container.roomEngine.getRoomObject(_local_2, k, _local_3);
            return _local_4;
        }

        private function _Str_17630(k:int):IFurnitureItem
        {
            if (this._Str_2268 == null)
            {
                return null;
            }
            var _local_2:IHabboInventory = this._Str_2268.handler.container.inventory;
            if (_local_2 == null)
            {
                return null;
            }
            var _local_3:IFurnitureItem = _local_2._Str_18856(-(k));
            return _local_3;
        }

        private function _Str_5337(k:IFurnitureItem):Boolean
        {
            if (((k == null) || (this._Str_2268 == null)))
            {
                return false;
            }
            var _local_2:IHabboInventory = this._Str_2268.handler.container.inventory;
            if (_local_2 == null)
            {
                return false;
            }
            var _local_3:Boolean;
            if ((((k.category == FurniCategory._Str_3683) || (k.category == FurniCategory._Str_3639)) || (k.category == FurniCategory._Str_3432)))
            {
                _local_3 = false;
            }
            else
            {
                _local_3 = _local_2._Str_12029(k);
            }
            return _local_3;
        }

        public function _Str_17192(k:int):void
        {
            if (((this._Str_3111 == null) || (this._resultData2 == null)))
            {
                return;
            }
            if (((this._Str_3111.stuffId == k) || (this._resultData2.stuffId == k)))
            {
                this._Str_16499();
                this.show();
            }
        }

        public function _Str_23033(k:int):void
        {
            if (((this._Str_3111 == null) || (this._resultData2 == null)))
            {
                return;
            }
            if (((this._Str_3111.stuffId == k) || (this._resultData2.stuffId == k)))
            {
                this._Str_16499();
                this.show();
            }
        }

        public function _Str_16499():void
        {
            this._Str_2771(this._Str_3111, ELEM_PLACE_BUTTON1, ELEM_PICK_BUTTON1);
            this._Str_2771(this._resultData2, ELEM_PLACE_BUTTON2, ELEM_PICK_BUTTON2);
            this.arrangeListItems();
        }

        private function _Str_2771(k:BreedPetsResultData, _arg_2:String, _arg_3:String):void
        {
            var _local_11:IFurnitureItem;
            if (((this._window == null) || (k == null)))
            {
                return;
            }
            var _local_4:int = this._Str_2268.handler.container.sessionDataManager.userId;
            var _local_5:* = (k.userId == _local_4);
            var _local_6:Boolean;
            var _local_7:Boolean;
            var _local_8:IRoomObject = this._Str_8946(k.stuffId);
            if (_local_8 != null)
            {
                _local_7 = true;
            }
            if (!_local_7)
            {
                _local_11 = this._Str_17630(k.stuffId);
                if (_local_11 != null)
                {
                    _local_6 = true;
                }
            }
            var _local_9:IWindow = this._window.findChildByName(_arg_2);
            var _local_10:IWindow = this._window.findChildByName(_arg_3);
            if (_local_9 != null)
            {
                _local_9.visible = false;
                if (_local_5)
                {
                    if (_local_6)
                    {
                        _local_9.visible = true;
                    }
                    if (((!(_local_6)) && (!(_local_7))))
                    {
                        _local_9.visible = true;
                    }
                }
            }
            if (_local_10 != null)
            {
                _local_10.visible = false;
                if (_local_5)
                {
                    if (_local_7)
                    {
                        _local_10.visible = true;
                    }
                }
            }
        }
    }
}
