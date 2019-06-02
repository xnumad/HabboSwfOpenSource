package com.sulake.habbo.inventory.bots
{
    import com.sulake.habbo.inventory.IInventoryView;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.parser.inventory.bots._Str_3013;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IButtonWindow;

    public class BotsView implements IInventoryView, IAvatarImageListener 
    {
        private const _Str_12512:int = 0;
        private const _Str_4299:int = 1;
        private const _Str_5391:int = 2;
        private const _Str_4660:int = 3;

        private var _windowManager:IHabboWindowManager;
        private var _assetLibrary:IAssetLibrary;
        private var _view:IWindowContainer;
        private var _model:BotsModel;
        private var _disposed:Boolean = false;
        private var _grid:IItemGridWindow;
        private var _roomEngine:IRoomEngine;
        private var _avatarRenderer:IAvatarRenderManager;
        private var _gridItems:Map;
        private var _selectedGridItem:BotGridItem;
        private var _currentState:int = 0;
        private var _previewImageDownloadId:int;
        private var _isInitialized:Boolean = false;

        public function BotsView(k:BotsModel, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IRoomEngine, _arg_5:IAvatarRenderManager)
        {
            this._model = k;
            this._assetLibrary = _arg_3;
            this._windowManager = _arg_2;
            this._roomEngine = _arg_4;
            this._avatarRenderer = _arg_5;
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
            this._windowManager = null;
            this._avatarRenderer = null;
            this._roomEngine = null;
            this._assetLibrary = null;
            this._model = null;
            this._view = null;
            this._disposed = true;
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

        public function removeItem(k:int):void
        {
            if (!this._isInitialized)
            {
                return;
            }
            var _local_2:BotGridItem = (this._gridItems.remove(k) as BotGridItem);
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

        public function _Str_2822(k:_Str_3013):void
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
            var _local_2:BotGridItem = new BotGridItem(this, k, this._windowManager, this._assetLibrary, this._model._Str_3613(k.id));
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

        public function _Str_7009(k:int, _arg_2:Boolean=false):void
        {
            this._model._Str_7009(k, _arg_2);
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

        public function _Str_7828(k:BotGridItem):void
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
            var k:Map = this._model.items;
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

        public function _Str_20649(k:_Str_3013):BitmapData
        {
            var _local_2:int = 3;
            return this._Str_9836(k, _local_2, false, AvatarScaleType.LARGE);
        }

        public function _Str_9836(k:_Str_3013, _arg_2:int, _arg_3:Boolean, _arg_4:String):BitmapData
        {
            var _local_6:BitmapData;
            var _local_5:IAvatarImage = this._avatarRenderer.createAvatarImage(k.figure, _arg_4, k.gender, this);
            _local_5.setDirection(AvatarSetType.FULL, _arg_2);
            if (_arg_3)
            {
                _local_6 = _local_5._Str_818(AvatarSetType.FULL);
            }
            else
            {
                _local_6 = _local_5._Str_818(AvatarSetType.HEAD);
            }
            _local_5.dispose();
            return _local_6;
        }

        public function _Str_840(k:String):void
        {
            var _local_2:BotGridItem;
            if (this.disposed)
            {
                return;
            }
            for each (_local_2 in this._gridItems)
            {
                if (_local_2.data.figure == k)
                {
                    _local_2._Str_3523(this._Str_20649(_local_2.data));
                }
            }
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
            var _local_4:BotGridItem;
            if (this._view == null)
            {
                return;
            }
            var k:Array = this._gridItems.getKeys();
            var _local_2:Array = ((this._model.items) ? this._model.items.getKeys() : new Array());
            this._grid.lock();
            for each (_local_3 in k)
            {
                if (_local_2.indexOf(_local_3) == -1)
                {
                    this.removeItem(_local_3);
                }
            }
            for each (_local_3 in _local_2)
            {
                if (k.indexOf(_local_3) == -1)
                {
                    this._Str_2822(this._model.items.getValue(_local_3));
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
            var _local_2:_Str_3013 = this._selectedGridItem.data;
            if (_local_2 == null)
            {
                return;
            }
            this._Str_7009(_local_2.id);
        }

        private function _Str_3545(k:WindowEvent, _arg_2:IWindow):void
        {
        }

        private function _Str_6511():void
        {
            if (this._model.controller._Str_9777 != InventoryCategory.BOTS)
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

        private function _Str_3190(k:BotGridItem=null):void
        {
            var _local_2:BitmapData;
            var _local_3:String;
            var _local_4:String;
            var _local_5:Boolean;
            var _local_12:_Str_3013;
            var _local_13:BitmapData;
            if (this._view == null)
            {
                return;
            }
            this._previewImageDownloadId = -1;
            if (((k == null) || (k.data == null)))
            {
                _local_2 = new BitmapData(1, 1);
                _local_3 = "";
                _local_4 = "";
                _local_5 = false;
            }
            else
            {
                _local_12 = k.data;
                _local_3 = _local_12.name;
                _local_4 = _local_12.motto;
                _local_2 = this._Str_9836(_local_12, 4, true, AvatarScaleType.LARGE);
                _local_5 = true;
            }
            var _local_6:IBitmapWrapperWindow = (this._view.findChildByName("preview_image") as IBitmapWrapperWindow);
            if (_local_6 != null)
            {
                _local_13 = new BitmapData(_local_6.width, _local_6.height);
                _local_13.fillRect(_local_13.rect, 0);
                _local_13.copyPixels(_local_2, _local_2.rect, new Point(((_local_13.width / 2) - (_local_2.width / 2)), ((_local_13.height / 2) - (_local_2.height / 2))));
                _local_6.bitmap = _local_13;
            }
            _local_2.dispose();
            var _local_7:ITextWindow = (this._view.findChildByName("bot_name") as ITextWindow);
            if (_local_7 != null)
            {
                _local_7.caption = _local_3;
            }
            _local_7 = (this._view.findChildByName("bot_description") as ITextWindow);
            if (_local_7 != null)
            {
                _local_7.caption = _local_4;
            }
            var _local_8:Boolean;
            var _local_9:Boolean;
            if (this._model.roomSession != null)
            {
                _local_8 = this._model.roomSession._Str_18311;
                _local_9 = this._model.roomSession.isRoomController;
            }
            var _local_10:String = "";
            if (!_local_9)
            {
                if (_local_8)
                {
                    _local_10 = "${inventory.bots.allowed}";
                }
                else
                {
                    _local_10 = "${inventory.bots.forbidden}";
                }
            }
            _local_7 = (this._view.findChildByName("preview_info") as ITextWindow);
            if (_local_7 != null)
            {
                _local_7.caption = _local_10;
            }
            var _local_11:IButtonWindow = (this._view.findChildByName("place_button") as IButtonWindow);
            if (_local_11 != null)
            {
                if (((_local_5) && ((_local_9) || (_local_8))))
                {
                    _local_11.enable();
                }
                else
                {
                    _local_11.disable();
                }
            }
        }

        private function _Str_22778():void
        {
        }

        private function init():void
        {
            var k:IButtonWindow;
            this._view = this._model.controller.view._Str_9043(InventoryCategory.BOTS);
            this._view.visible = false;
            this._view.procedure = this._Str_3545;
            this._Str_22778();
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
            this._Str_9010();
            this._isInitialized = true;
        }
    }
}
