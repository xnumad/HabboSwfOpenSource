﻿package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.events._Str_3858;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class UseProductView extends AvatarContextInfoButtonView 
    {
        private static const MODE_NORMAL:int = 0;
        private static const _Str_13718:int = 1;
        private static const _Str_14146:int = 2;
        private static const _Str_15667:int = 3;
        private static const _Str_14658:int = 4;
        private static const _Str_14165:int = 5;
        private static const _Str_12577:int = 6;
        private static const _Str_14611:int = 7;

        private var _mode:int;
        private var _useProductItem:_Str_3858;

        public function UseProductView(k:AvatarInfoWidget)
        {
            super(k);
            _Str_3403 = false;
        }

        public static function setup(k:UseProductView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:_Str_3858):void
        {
            k._useProductItem = _arg_6;
            AvatarContextInfoButtonView.setup(k, _arg_2, _arg_3, _arg_4, _arg_5, false);
        }


        public function get objectId():int
        {
            return this._useProductItem.id;
        }

        public function get _Str_3710():int
        {
            return this._useProductItem._Str_3710;
        }

        override public function dispose():void
        {
            if (window)
            {
                window.removeEventListener(WindowMouseEvent.OVER, _Str_2743);
                window.removeEventListener(WindowMouseEvent.OUT, _Str_2743);
            }
            if (this._useProductItem)
            {
                this._useProductItem.dispose();
            }
            this._useProductItem = null;
            super.dispose();
        }

        private function _Str_18845():void
        {
            var _local_3:IFurnitureData;
            var k:int = this.widget.handler.roomSession.roomId;
            var _local_2:IRoomObject = this.widget.handler.roomEngine.getRoomObject(k, this._useProductItem._Str_3710, RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
            if (_local_2 != null)
            {
                _local_3 = this.widget.handler.getFurniData(_local_2);
            }
            else
            {
                _local_3 = this.widget.handler.container.sessionDataManager.getFloorItemData(this._useProductItem._Str_3710);
            }
            if (!_local_3)
            {
                return;
            }
            this._mode = MODE_NORMAL;
            switch (_local_3.category)
            {
                case FurniCategory.PET_SHAMPOO:
                    this._mode = _Str_13718;
                    return;
                case FurniCategory.PET_CUSTOM_PART:
                    this._mode = _Str_14146;
                    return;
                case FurniCategory.PET_CUSTOM_PART_SHAMPOO:
                    this._mode = _Str_15667;
                    return;
                case FurniCategory.PET_SADDLE:
                    this._mode = _Str_14658;
                    return;
                case FurniCategory.MONSTERPLANT_REVIVAL:
                    this._mode = _Str_14165;
                    return;
                case FurniCategory.MONSTERPLANT_REBREED:
                    this._mode = _Str_12577;
                    return;
                case FurniCategory.MONSTERPLANT_FERTILIZE:
                    this._mode = _Str_14611;
                    return;
                default:
                    Logger.log(("[UseProductView.open()] Unsupported furniture category: " + _local_3.category));
            }
        }

        override protected function updateWindow():void
        {
            var k:XML;
            if ((((!(_widget)) || (!(_widget.assets))) || (!(_widget.windowManager))))
            {
                return;
            }
            this._Str_18845();
            if (_Str_3452)
            {
                activeView = _Str_3113();
            }
            else
            {
                if (!_window)
                {
                    k = (XmlAsset(_widget.assets.getAssetByName("use_product_menu")).content as XML);
                    _window = (_widget.windowManager.buildFromXML(k, 0) as IWindowContainer);
                    if (!_window)
                    {
                        return;
                    }
                    _window.addEventListener(WindowMouseEvent.OVER, _Str_2743);
                    _window.addEventListener(WindowMouseEvent.OUT, _Str_2743);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.CLICK, _Str_4457);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.OVER, _Str_3052);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.OUT, _Str_3052);
                }
                _buttons = (_window.findChildByName("buttons") as IItemListWindow);
                _buttons.procedure = this.buttonEventProc;
                _window.findChildByName("name").caption = _Str_2360;
                _window.visible = false;
                activeView = window;
                this._Str_2771();
            }
        }

        public function _Str_2771():void
        {
            if (((!(_window)) || (!(_buttons))))
            {
                return;
            }
            _buttons.autoArrangeItems = false;
            var k:int = _buttons.numListItems;
            var _local_2:int;
            while (_local_2 < k)
            {
                _buttons.getListItemAt(_local_2).visible = false;
                _local_2++;
            }
            switch (this._mode)
            {
                case MODE_NORMAL:
                    showButton("use_product");
                    break;
                case _Str_13718:
                    showButton("use_product_shampoo");
                    break;
                case _Str_14146:
                    showButton("use_product_custom_part");
                    break;
                case _Str_15667:
                    showButton("use_product_custom_part_shampoo");
                    break;
                case _Str_14658:
                    if (this._useProductItem.replace)
                    {
                        showButton("replace_product_saddle");
                    }
                    else
                    {
                        showButton("use_product_saddle");
                    }
                    break;
                case _Str_14165:
                    showButton("revive_monsterplant");
                    break;
                case _Str_12577:
                    showButton("rebreed_monsterplant");
                    break;
                case _Str_14611:
                    showButton("fertilize_monsterplant");
                    break;
            }
            _buttons.autoArrangeItems = true;
            _buttons.visible = true;
        }

        override protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:RoomWidgetMessage;
            if (disposed)
            {
                return;
            }
            if (((!(_window)) || (_window.disposed)))
            {
                return;
            }
            var _local_3:Boolean;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "button")
                {
                    _local_3 = true;
                    switch (_arg_2.parent.name)
                    {
                        case "use_product":
                        case "use_product_shampoo":
                        case "use_product_custom_part":
                        case "use_product_custom_part_shampoo":
                        case "use_product_saddle":
                        case "replace_product_saddle":
                        case "revive_monsterplant":
                        case "rebreed_monsterplant":
                        case "fertilize_monsterplant":
                            this.widget.showUseProductConfirmation(this._useProductItem._Str_3710, this._useProductItem._Str_5563, this._useProductItem._Str_24139);
                            break;
                    }
                }
                if (_local_4)
                {
                    _widget.messageListener.processWidgetMessage(_local_4);
                }
            }
            else
            {
                super.buttonEventProc(k, _arg_2);
            }
            if (_local_3)
            {
                this.widget.removeUseProductViews();
            }
        }

        private function _Str_6337(k:int):void
        {
            this._mode = k;
            this._Str_2771();
        }

        private function get widget():AvatarInfoWidget
        {
            return _widget as AvatarInfoWidget;
        }
    }
}
