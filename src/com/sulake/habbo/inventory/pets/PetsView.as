package com.sulake.habbo.inventory.pets
{
    import com.sulake.habbo.inventory.IInventoryView;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_2848;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.pets.PetCustomPart;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IButtonWindow;

    public class PetsView implements IInventoryView, IGetImageListener 
    {
        private static const _Str_12387:int = 4;

        private const _Str_12512:int = 0;
        private const _Str_4299:int = 1;
        private const _Str_5391:int = 2;
        private const _Str_4660:int = 3;

        private var _windowManager:IHabboWindowManager;
        private var _assetLibrary:IAssetLibrary;
        private var _view:IWindowContainer;
        private var _model:PetsModel;
        private var _disposed:Boolean = false;
        private var _grid:IItemGridWindow;
        private var _roomEngine:IRoomEngine;
        private var _gridItems:Map;
        private var _selectedGridItem:PetsGridItem;
        private var _currentState:int = 0;
        private var _previewImageDownloadId:int;
        private var _isInitialized:Boolean = false;

        public function PetsView(k:PetsModel, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IRoomEngine)
        {
            this._model = k;
            this._assetLibrary = _arg_3;
            this._windowManager = _arg_2;
            this._roomEngine = _arg_4;
            this._gridItems = new Map();
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get isVisible():Boolean
        {
            return ((this._view) && (!(this._view.parent == null))) && (this._view.visible);
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._windowManager = null;
                this._model = null;
                this._view = null;
                this._disposed = true;
            }
        }

        public function update():void
        {
            if (!this._isInitialized)
            {
                return;
            }
            this._Str_7044();
            this._Str_3190(this._selectedGridItem);
            this._Str_6511();
        }

        public function _Str_12321(k:int):void
        {
            if (!this._isInitialized)
            {
                return;
            }
            var _local_2:PetsGridItem = (this._gridItems.remove(k) as PetsGridItem);
            if (_local_2 == null)
            {
                return;
            }
            this._grid._Str_4725(_local_2.window);
            if (this._selectedGridItem == _local_2)
            {
                this._selectedGridItem = null;
                this._Str_9010();
            }
        }

        public function _Str_9947(k:_Str_2848):void
        {
            if (!this._isInitialized)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            if (this._gridItems.getValue(k.id) != null)
            {
                return;
            }
            var _local_2:PetsGridItem = new PetsGridItem(this, k, this._windowManager, this._assetLibrary, this._model._Str_3613(k.id));
            if (_local_2 != null)
            {
                this._grid._Str_2816(_local_2.window);
                this._gridItems.add(k.id, _local_2);
                if (this._selectedGridItem == null)
                {
                    this._Str_9010();
                }
            }
        }

        public function _Str_6675(k:int, _arg_2:Boolean=false):void
        {
            this._model._Str_6675(k, _arg_2);
        }

        public function getWindowContainer():IWindowContainer
        {
            if (!this._isInitialized)
            {
                this.init();
            }
            if (this._view == null)
            {
                return null;
            }
            if (this._view.disposed)
            {
                return null;
            }
            return this._view;
        }

        public function _Str_7828(k:PetsGridItem):void
        {
            if (!this._isInitialized)
            {
                return;
            }
            if (this._selectedGridItem != null)
            {
                this._selectedGridItem.setSelected(false);
            }
            this._selectedGridItem = k;
            if (this._selectedGridItem != null)
            {
                this._selectedGridItem.setSelected(true);
            }
            this._Str_3190(k);
        }

        public function _Str_3820():void
        {
            var _local_2:int;
            if (!this._isInitialized)
            {
                return;
            }
            var k:Map = this._model.pets;
            if (!this._model._Str_18819())
            {
                _local_2 = this._Str_4299;
            }
            else
            {
                if (((!(k)) || (k.length == 0)))
                {
                    _local_2 = this._Str_5391;
                }
                else
                {
                    _local_2 = this._Str_4660;
                }
            }
            if (this._currentState == _local_2)
            {
                return;
            }
            this._currentState = _local_2;
            this._Str_6511();
            if (this._currentState == this._Str_4660)
            {
                this._Str_7044();
                this._Str_3190();
            }
        }

        public function getPetImage(k:_Str_2848, _arg_2:int, _arg_3:Boolean, _arg_4:PetsGridItem=null, _arg_5:int=64, _arg_6:String=null):BitmapData
        {
            var _local_7:PetFigureData = k.figureData;
            var _local_8:BitmapData;
            var _local_9:uint = parseInt(_local_7.color, 16);
            var _local_10:uint;
            var _local_11:Array = [];
            var _local_12:int;
            while (_local_12 < (_local_7.customPartCount * 3))
            {
                _local_11.push(new PetCustomPart(_local_7._Str_3542[_local_12], _local_7._Str_3542[(_local_12 + 1)], _local_7._Str_3542[(_local_12 + 2)]));
                _local_12 = (_local_12 + 3);
            }
            var _local_13:ImageResult = this._roomEngine.getPetImage(_local_7.typeId, _local_7.paletteId, _local_9, new Vector3d((_arg_2 * 45)), _arg_5, this, _arg_3, _local_10, _local_11, _arg_6);
            if (_local_13 != null)
            {
                _local_8 = _local_13.data;
                if (_arg_4 != null)
                {
                    _arg_4._Str_17747 = _local_13.id;
                }
                else
                {
                    if (_arg_3)
                    {
                        this._previewImageDownloadId = _local_13.id;
                    }
                }
            }
            if (_local_8 == null)
            {
                _local_8 = new BitmapData(30, 30, false, 4289374890);
            }
            return _local_8;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            var _local_3:PetsGridItem;
            if (k == this._previewImageDownloadId)
            {
                this._Str_3190(this._selectedGridItem);
                return;
            }
            for each (_local_3 in this._gridItems)
            {
                if (_local_3._Str_17747 == k)
                {
                    _local_3._Str_19232(_arg_2);
                    return;
                }
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_9010():void
        {
            if (((this._gridItems == null) || (this._gridItems.length == 0)))
            {
                this._Str_3190();
                return;
            }
            this._Str_7828(this._gridItems.getWithIndex(0));
        }

        public function _Str_16613(k:int):void
        {
            this._Str_7828(this._gridItems.getValue(k));
        }

        private function _Str_7044():void
        {
            var _local_3:int;
            var _local_4:PetsGridItem;
            if (this._view == null)
            {
                return;
            }
            var k:Array = this._gridItems.getKeys();
            var _local_2:Array = ((this._model.pets) ? this._model.pets.getKeys() : new Array());
            this._grid.lock();
            for each (_local_3 in k)
            {
                if (_local_2.indexOf(_local_3) == -1)
                {
                    this._Str_12321(_local_3);
                }
            }
            for each (_local_3 in _local_2)
            {
                if (k.indexOf(_local_3) == -1)
                {
                    this._Str_9947(this._model.pets.getValue(_local_3));
                }
                _local_4 = this._gridItems.getValue(_local_3);
                _local_4._Str_17526(this._model._Str_3613(_local_3));
            }
            this._grid.unlock();
        }

        private function _Str_9841(k:WindowMouseEvent):void
        {
            if (this._selectedGridItem == null)
            {
                return;
            }
            var _local_2:_Str_2848 = this._selectedGridItem.pet;
            if (_local_2 == null)
            {
                return;
            }
            this._Str_6675(_local_2.id);
        }

        private function _Str_6511():void
        {
            if (this._model.controller._Str_9777 != InventoryCategory.PETS)
            {
                return;
            }
            var k:IWindowContainer = this._model.controller.view._Str_10034;
            var _local_2:IWindowContainer = this._model.controller.view._Str_11062;
            var _local_3:IWindow = this._view.findChildByName("grid");
            var _local_4:IWindow = this._view.findChildByName("preview_container");
            switch (this._currentState)
            {
                case this._Str_4299:
                    if (k)
                    {
                        k.visible = true;
                    }
                    if (_local_2)
                    {
                        _local_2.visible = false;
                    }
                    _local_3.visible = false;
                    _local_4.visible = false;
                    return;
                case this._Str_5391:
                    if (k)
                    {
                        k.visible = false;
                    }
                    if (_local_2)
                    {
                        _local_2.visible = true;
                    }
                    _local_3.visible = false;
                    _local_4.visible = false;
                    return;
                case this._Str_4660:
                    if (k)
                    {
                        k.visible = false;
                    }
                    if (_local_2)
                    {
                        _local_2.visible = false;
                    }
                    _local_3.visible = true;
                    _local_4.visible = true;
                    return;
            }
        }

        private function _Str_3190(k:PetsGridItem=null):void
        {
            var _local_2:BitmapData;
            var _local_3:String;
            var _local_4:String;
            var _local_5:Boolean;
            var _local_16:_Str_2848;
            var _local_17:BitmapData;
            if (this._view == null)
            {
                return;
            }
            var _local_6:int = 64;
            var _local_7:int = 4;
            var _local_8:Boolean = true;
            var _local_9:String;
            this._previewImageDownloadId = -1;
            if (((k == null) || (k.pet == null)))
            {
                _local_2 = new BitmapData(1, 1);
                _local_3 = "";
                _local_4 = "";
                _local_5 = false;
            }
            else
            {
                _local_16 = k.pet;
                _local_3 = _local_16.name;
                if (_local_16.typeId == PetTypeEnum.MONSTERPLANT)
                {
                    _local_7 = 2;
                    _local_8 = true;
                    if (_local_16.level >= 7)
                    {
                        _local_9 = "std";
                    }
                    else
                    {
                        _local_9 = ("grw" + _local_16.level);
                    }
                }
                _local_2 = this.getPetImage(_local_16, _local_7, _local_8, null, _local_6, _local_9);
                _local_5 = true;
            }
            var _local_10:IBitmapWrapperWindow = (this._view.findChildByName("preview_image") as IBitmapWrapperWindow);
            if (_local_10 != null)
            {
                _local_17 = new BitmapData(_local_10.width, _local_10.height);
                _local_17.fillRect(_local_17.rect, 0);
                _local_17.copyPixels(_local_2, _local_2.rect, new Point(((_local_17.width / 2) - (_local_2.width / 2)), ((_local_17.height / 2) - (_local_2.height / 2))));
                _local_10.bitmap = _local_17;
            }
            _local_2.dispose();
            var _local_11:ITextWindow = (this._view.findChildByName("preview_text") as ITextWindow);
            if (_local_11 != null)
            {
                _local_11.caption = _local_3;
            }
            _local_11 = (this._view.findChildByName("preview_description") as ITextWindow);
            if (_local_11 != null)
            {
                _local_11.caption = _local_4;
            }
            var _local_12:Boolean;
            var _local_13:Boolean;
            if (this._model.roomSession != null)
            {
                _local_12 = this._model.roomSession._Str_9439;
                _local_13 = this._model.roomSession.isRoomController;
            }
            var _local_14:String = "";
            if (!_local_13)
            {
                if (_local_12)
                {
                    _local_14 = "${inventory.pets.allowed}";
                }
                else
                {
                    _local_14 = "${inventory.pets.forbidden}";
                }
            }
            _local_11 = (this._view.findChildByName("preview_info") as ITextWindow);
            if (_local_11 != null)
            {
                _local_11.caption = _local_14;
            }
            var _local_15:IButtonWindow = (this._view.findChildByName("place_button") as IButtonWindow);
            if (_local_15 != null)
            {
                if (((_local_5) && ((_local_13) || (_local_12))))
                {
                    _local_15.enable();
                }
                else
                {
                    _local_15.disable();
                }
            }
        }

        private function init():void
        {
            var k:IButtonWindow;
            this._view = this._model.controller.view._Str_9043(InventoryCategory.PETS);
            this._view.visible = false;
            this._grid = (this._view.findChildByName("grid") as IItemGridWindow);
            k = (this._view.findChildByName("place_button") as IButtonWindow);
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, this._Str_9841);
            }
            var _local_2:IBitmapWrapperWindow = (this._view.findChildByName("preview_image") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.DOWN, this._Str_9841);
            }
            this._Str_3190();
            this._Str_3820();
            this._isInitialized = true;
        }
    }
}
