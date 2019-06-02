package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.tracking.HabboTracking;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import flash.geom.Point;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.window.IWidget;
    import com.sulake.habbo.window.widgets._Str_2961;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.window.widgets._Str_4520;

    public class InfoStandPetView 
    {
        private static const _Str_5169:int = 162;
        private static const _Str_16449:int = 16;
        private static const _Str_3835:int = 4;
        private static const _Str_5037:uint = 0xDADADA;
        private static const _Str_4952:uint = 0x3A3A3A;
        private static const _Str_18444:uint = 2085362;
        private static const _Str_15917:uint = 39616;
        private static const _Str_17718:uint = 10513106;
        private static const _Str_17091:uint = 8734654;
        private static const _Str_18621:uint = 9094430;
        private static const _Str_16706:uint = 0x5E9D00;
        private static const _Str_18945:uint = 9094430;
        private static const _Str_18838:uint = 0x5E9D00;
        private static const HAPPINESS:String = "happiness";
        private static const EXPERIENCE:String = "experience";
        private static const ENERGY:String = "energy";
        private static const WELLBEING:String = "wellbeing";
        private static const GROWTH:String = "growth";
        private static const _Str_8222:int = 250;
        private static const _Str_4468:int = 25;
        private static const _Str_6207:int = 5;

        private var _catalog:IHabboCatalog;
        private var _habboTracking:IHabboTracking;
        private var _widget:InfoStandWidget;
        private var _window:IItemListWindow;
        private var _border:IBorderWindow;
        private var _buttonsContainer:IWindowContainer;
        private var _infoElements:IItemListWindow;
        private var _petCommadTool:PetCommandTool;
        private var _petData:Map;
        private var _currentPetId:int;

        public function InfoStandPetView(k:InfoStandWidget, _arg_2:String, _arg_3:IHabboCatalog)
        {
            this._widget = k;
            this._catalog = _arg_3;
            this._habboTracking = HabboTracking.getInstance();
            this.createWindow(_arg_2);
            this._petData = new Map();
        }

        public function dispose():void
        {
            this._widget = null;
            this._catalog = null;
            this._habboTracking = null;
            this._border = null;
            this._buttonsContainer = null;
            this._infoElements = null;
            if (this._window)
            {
                this._window.dispose();
            }
            this._window = null;
            if (this._petCommadTool)
            {
                this._petCommadTool.dispose();
            }
            this._petCommadTool = null;
            if (this._petData)
            {
                this._petData.dispose();
                this._petData = null;
            }
        }

        public function get window():IItemListWindow
        {
            return this._window;
        }

        private function updateWindow():void
        {
            if ((((this._infoElements == null) || (this._border == null)) || (this._buttonsContainer == null)))
            {
                return;
            }
            this._buttonsContainer.width = this._buttonsContainer.width;
            this._buttonsContainer.visible = (this._buttonsContainer.width > 0);
            this._infoElements.height = this._infoElements.visibleRegion.height;
            this._border.height = (this._infoElements.height + 20);
            this._window.width = Math.max(this._border.width, this._buttonsContainer.width);
            this._window.height = this._window.visibleRegion.height;
            if (this._border.width < this._buttonsContainer.width)
            {
                this._border.x = (this._window.width - this._border.width);
                this._buttonsContainer.x = 0;
            }
            else
            {
                this._buttonsContainer.x = (this._window.width - this._buttonsContainer.width);
                this._border.x = 0;
            }
            this._widget._Str_10301();
        }

        public function _Str_4497(k:int, _arg_2:BitmapData):void
        {
            if (this._currentPetId == k)
            {
                this.image = _arg_2;
                this.updateWindow();
                this._Str_24040(_arg_2);
            }
        }

        private function _Str_24040(k:BitmapData):void
        {
            if (this._petCommadTool != null)
            {
                this._petCommadTool._Str_21945(k);
            }
        }

        public function update(k:InfoStandPetData):void
        {
            var _local_2:String;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:Number;
            this.name = k.name;
            this.image = k.image;
            this.ownerName = k.ownerName;
            this._Str_24737 = this._widget.localizations.getLocalization(this._Str_24487(k.type, k.unknownRarityLevel));
            this._Str_23761(k._Str_6943, (!(k.type == PetTypeEnum.MONSTERPLANT)));
            this._Str_25526 = k.age;
            this._Str_25746(k.level, k._Str_4276, (!(k.type == PetTypeEnum.MONSTERPLANT)));
            this._Str_25402(k.level, k._Str_3307, k.type);
            this._Str_25516(k.rarityLevel, k.type);
            if (k.type == PetTypeEnum.MONSTERPLANT)
            {
                this._Str_14440("default", false);
                this._Str_14440("monsterplant", true);
                _local_2 = TimeFormatUtil._Str_22740(k.remainingTimeToLive);
                this._Str_9597(WELLBEING, k.remainingTimeToLive, k.maximumTimeToLive, _Str_18838, _Str_18945, _local_2);
                this._Str_22309(GROWTH, k.remainingGrowTime);
                this._Str_2304("petrespect", false);
                if (k.energy > 0)
                {
                    _local_3 = (k.energy as Number);
                    _local_4 = (k._Str_3966 as Number);
                    this._Str_2304("pettreat", ((_local_3 / _local_4) < 0.98));
                }
                else
                {
                    this._Str_2304("pettreat", false);
                }
                this._Str_2304("train", false);
                this._Str_2304("buy_food", false);
                this._Str_2304("kick", false);
                this._Str_2304("pick", k._Str_5114);
                this._Str_16559((k.rarityLevel >= 0), k);
            }
            else
            {
                this._Str_14440("default", true);
                this._Str_14440("monsterplant", false);
                this._Str_2304("petrespect", true);
                this._Str_2304("pettreat", false);
                this._Str_2304("train", k._Str_5175);
                this._Str_2304("pick", k._Str_5175);
                this._Str_2304("buy_food", true);
                this._Str_2304("kick", k._Str_5114);
                this._Str_9597(HAPPINESS, k.happyness, k._Str_4448, _Str_15917, _Str_18444);
                this._Str_9597(EXPERIENCE, k.experience, k._Str_4095, _Str_17091, _Str_17718);
                this._Str_9597(ENERGY, k.energy, k._Str_3966, _Str_16706, _Str_18621);
                this._Str_22251();
            }
            this._Str_2304("move", ((k._Str_5175) && (k.type == PetTypeEnum.MONSTERPLANT)));
            this._Str_2304("rotate", ((k._Str_5175) && (k.type == PetTypeEnum.MONSTERPLANT)));
            this.updateWindow();
            this._currentPetId = k.id;
            this._petData.remove(k.id);
            this._petData.add(k.id, k);
            if ((((this._petCommadTool) && (this._petCommadTool.isVisible())) && (k._Str_5175)))
            {
                _local_5 = this._Str_16104(k.level, k._Str_3307);
                _local_6 = (k.experience / k._Str_4095);
                this._petCommadTool._Str_19046(k.id, k.name, k.image, k.type, (k.level - _local_5), _local_6, (this._Str_19542(k.level, k._Str_3307) - _local_5), k._Str_3307);
            }
        }

        private function _Str_25516(k:int, _arg_2:int):void
        {
            var _local_3:Array = [PetTypeEnum.MONSTERPLANT, PetTypeEnum.GNOME];
            var _local_4:String = ((_arg_2 != PetTypeEnum.MONSTERPLANT) ? "default" : "monsterplant");
            var _local_5:IItemListWindow = this._Str_20171(_local_4);
            var _local_6:ITextWindow = (_local_5.getListItemByName("status_rarity_level") as ITextWindow);
            if (_local_6 == null)
            {
                return;
            }
            _local_6.visible = (_local_3.indexOf(_arg_2) > -1);
            this._widget.localizations.registerParameter("infostand.pet.text.raritylevel", "level", this._widget.localizations.getLocalization(("infostand.pet.raritylevel." + k)));
            this.updateWindow();
        }

        public function _Str_23859():int
        {
            return this._currentPetId;
        }

        public function _Str_24853(k:int, _arg_2:CommandConfiguration):void
        {
            if (this._petCommadTool == null)
            {
                return;
            }
            this._petCommadTool._Str_23216(k, _arg_2);
        }

        private function _Str_24487(k:int, _arg_2:int):String
        {
            return (("pet.breed." + k) + ".") + _arg_2;
        }

        private function _Str_12421(k:int, _arg_2:int, _arg_3:uint, _arg_4:uint):BitmapData
        {
            _arg_2 = Math.max(_arg_2, 1);
            k = Math.max(k, 0);
            if (k > _arg_2)
            {
                k = _arg_2;
            }
            var _local_5:Number = (k / _arg_2);
            var _local_6:int = 1;
            var _local_7:BitmapData = new BitmapData(_Str_5169, _Str_16449, false);
            _local_7.fillRect(new Rectangle(0, 0, _local_7.width, _local_7.height), _Str_5037);
            var _local_8:Rectangle = new Rectangle(_local_6, _local_6, (_local_7.width - (_local_6 * 2)), (_local_7.height - (_local_6 * 2)));
            _local_7.fillRect(_local_8, _Str_4952);
            var _local_9:Rectangle = new Rectangle(_local_6, (_local_6 + _Str_3835), (_local_7.width - (_local_6 * 2)), ((_local_7.height - (_local_6 * 2)) - _Str_3835));
            _local_9.width = (_local_5 * _local_9.width);
            _local_7.fillRect(_local_9, _arg_3);
            var _local_10:Rectangle = new Rectangle(_local_6, _local_6, (_local_7.width - (_local_6 * 2)), _Str_3835);
            _local_10.width = (_local_5 * _local_10.width);
            _local_7.fillRect(_local_10, _arg_4);
            return _local_7;
        }

        public function _Str_19969():void
        {
            var _local_2:int;
            var _local_3:Number;
            if (this._petCommadTool == null)
            {
                this._petCommadTool = new PetCommandTool(this._widget);
            }
            var k:InfoStandPetData = (this._petData.getValue(this._currentPetId) as InfoStandPetData);
            if (k != null)
            {
                this._petCommadTool._Str_3360(true);
                _local_2 = this._Str_16104(k.level, k._Str_3307);
                _local_3 = (k.experience / k._Str_4095);
                this._petCommadTool._Str_19046(k.id, k.name, k.image, k.type, (k.level - _local_2), _local_3, (this._Str_19542(k.level, k._Str_3307) - _local_2), k._Str_3307);
            }
        }

        public function _Str_23384():void
        {
            if (((this._petCommadTool) && (this._petCommadTool._Str_18025() == this._currentPetId)))
            {
                this._petCommadTool._Str_3360(false);
            }
        }

        private function createWindow(k:String):void
        {
            var _local_5:IWindow;
            var _local_6:IBitmapWrapperWindow;
            var _local_12:IWindow;
            var _local_13:BitmapDataAsset;
            var _local_14:BitmapData;
            var _local_15:BitmapDataAsset;
            var _local_16:BitmapData;
            var _local_17:BitmapDataAsset;
            var _local_18:BitmapData;
            var _local_19:BitmapDataAsset;
            var _local_20:BitmapData;
            var _local_21:BitmapDataAsset;
            var _local_22:BitmapData;
            var _local_23:BitmapDataAsset;
            var _local_24:BitmapData;
            var _local_2:XmlAsset = (this._widget.assets.getAssetByName("pet_view") as XmlAsset);
            this._window = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IItemListWindow);
            if (this._window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._border = (this._window.getListItemByName("info_border") as IBorderWindow);
            if (this._border != null)
            {
                this._infoElements = (this._border.findChildByName("infostand_element_list") as IItemListWindow);
            }
            this._window.name = k;
            this._widget.mainContainer.addChild(this._window);
            var _local_3:IWindow = this._border.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            this._buttonsContainer = (this._window.getListItemByName("button_list") as IWindowContainer);
            if (this._buttonsContainer == null)
            {
                return;
            }
            var _local_4:Array = [];
            this._buttonsContainer.groupChildrenWithTag("CMD_BUTTON", _local_4, -1);
            for each (_local_5 in _local_4)
            {
                _local_5.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            }
            _local_6 = (this._border.findChildByName("petrespect_icon") as IBitmapWrapperWindow);
            if (_local_6 != null)
            {
                _local_13 = (this._widget.assets.getAssetByName("icon_petrespect") as BitmapDataAsset);
                _local_14 = (_local_13.content as BitmapData);
                _local_6.bitmap = _local_14.clone();
            }
            var _local_7:IBitmapWrapperWindow = (this._border.findChildByName("status_happiness_icon") as IBitmapWrapperWindow);
            if (_local_7 != null)
            {
                _local_15 = (this._widget.assets.getAssetByName("icon_pet_happiness") as BitmapDataAsset);
                _local_16 = (_local_15.content as BitmapData);
                _local_7.bitmap = _local_16.clone();
            }
            var _local_8:IBitmapWrapperWindow = (this._border.findChildByName("status_experience_icon") as IBitmapWrapperWindow);
            if (_local_8 != null)
            {
                _local_17 = (this._widget.assets.getAssetByName("icon_pet_experience") as BitmapDataAsset);
                _local_18 = (_local_17.content as BitmapData);
                _local_8.bitmap = _local_18.clone();
            }
            var _local_9:IBitmapWrapperWindow = (this._border.findChildByName("status_energy_icon") as IBitmapWrapperWindow);
            if (_local_9 != null)
            {
                _local_19 = (this._widget.assets.getAssetByName("icon_pet_energy") as BitmapDataAsset);
                _local_20 = (_local_19.content as BitmapData);
                _local_9.bitmap = _local_20.clone();
            }
            var _local_10:IBitmapWrapperWindow = (this._border.findChildByName("skill_level_indicator") as IBitmapWrapperWindow);
            if (_local_10 != null)
            {
                _local_21 = (this._widget.assets.getAssetByName("pet_skill_level_0") as BitmapDataAsset);
                _local_22 = (_local_21.content as BitmapData);
                _local_10.bitmap = _local_22.clone();
            }
            var _local_11:IBitmapWrapperWindow = (this._border.findChildByName("status_wellbeing_icon") as IBitmapWrapperWindow);
            if (_local_11 != null)
            {
                _local_23 = (this._widget.assets.getAssetByName("icon_pet_wellbeing") as BitmapDataAsset);
                _local_24 = (_local_23.content as BitmapData);
                _local_11.bitmap = _local_24.clone();
            }
            for each (_local_12 in _local_4)
            {
                if (_local_12.parent)
                {
                    _local_12.parent.width = _local_12.width;
                }
                _local_12.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_17596);
            }
        }

        private function set name(k:String):void
        {
            if (this._infoElements == null)
            {
                return;
            }
            var _local_2:ITextWindow = (this._infoElements.getListItemByName("name_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.text = k;
            _local_2.visible = true;
        }

        private function set image(k:BitmapData):void
        {
            if (this._infoElements == null)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            var _local_2:IWindowContainer = (this._infoElements.getListItemByName("image_container") as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IBitmapWrapperWindow = (_local_2.findChildByName("avatar_image") as IBitmapWrapperWindow);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:BitmapData = new BitmapData(_local_3.width, _local_3.height, true, 0);
            var _local_5:Point = new Point(0, 0);
            _local_5.x = Math.round(((_local_3.width - k.width) / 2));
            _local_5.y = Math.round(((_local_3.height - k.height) / 2));
            _local_4.copyPixels(k, k.rect, _local_5);
            _local_3.bitmap = _local_4;
            _local_3.invalidate();
            this.updateWindow();
        }

        private function _Str_25746(k:int, _arg_2:int, _arg_3:Boolean=true):void
        {
            if (this._infoElements == null)
            {
                return;
            }
            var _local_4:IWindowContainer = (this._infoElements.getListItemByName("image_container") as IWindowContainer);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:ITextWindow = (_local_4.findChildByName("level_text") as ITextWindow);
            if (_local_5 == null)
            {
                return;
            }
            _local_5.visible = _arg_3;
            this._widget.localizations.registerParameter("pet.level", "level", k.toString());
            this._widget.localizations.registerParameter("pet.level", "maxlevel", _arg_2.toString());
            this.updateWindow();
        }

        private function _Str_25402(k:int, _arg_2:Array, _arg_3:int):void
        {
            var _local_8:int;
            var _local_9:BitmapDataAsset;
            var _local_10:BitmapData;
            if (this._infoElements == null)
            {
                return;
            }
            var _local_4:IWindowContainer = (this._infoElements.getListItemByName("image_container") as IWindowContainer);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:IWindow = _local_4.findChildByName("status_skill_text");
            _local_5.visible = ((this._widget.config.getBoolean("pet.enhancements.enabled")) && (_arg_3 == 15));
            var _local_6:ITextWindow = (_local_4.findChildByName("status_skill_text") as ITextWindow);
            if (_local_6 != null)
            {
                _local_6.caption = (("${infostand.pet.text.skill." + _arg_3) + "}");
            }
            var _local_7:IBitmapWrapperWindow = (_local_4.findChildByName("skill_level_indicator") as IBitmapWrapperWindow);
            if (_local_7 != null)
            {
                _local_7.visible = ((this._widget.config.getBoolean("pet.enhancements.enabled")) && (_arg_3 == 15));
                _local_8 = this._Str_22683(k, _arg_2);
                _local_9 = (this._widget.assets.getAssetByName(("pet_skill_level_" + _local_8)) as BitmapDataAsset);
                _local_10 = (_local_9.content as BitmapData);
                _local_7.bitmap = _local_10.clone();
            }
            this.updateWindow();
        }

        private function set ownerName(k:String):void
        {
            this._widget.localizations.registerParameter("infostand.text.petowner", "name", k);
            this.updateWindow();
        }

        private function set _Str_24737(k:String):void
        {
            if (this._infoElements == null)
            {
                return;
            }
            var _local_2:ITextWindow = (this._infoElements.getListItemByName("breed_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.text = k;
            this.updateWindow();
        }

        private function set _Str_25526(k:int):void
        {
            if (this._infoElements == null)
            {
                return;
            }
            var _local_2:ITextWindow = (this._infoElements.getListItemByName("age_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            this._widget.localizations.registerParameter("pet.age", "age", k.toString());
            this.updateWindow();
        }

        private function _Str_23761(k:int, _arg_2:Boolean):void
        {
            this._widget.localizations.registerParameter("infostand.text.petrespect", "count", k.toString());
            if (this._infoElements == null)
            {
                return;
            }
            var _local_3:IWindowContainer = (this._infoElements.getListItemByName("petrespect_container") as IWindowContainer);
            var _local_4:ITextWindow = (_local_3.findChildByName("petrespect_text") as ITextWindow);
            var _local_5:IBitmapWrapperWindow = (_local_3.findChildByName("petrespect_icon") as IBitmapWrapperWindow);
            _local_4.visible = _arg_2;
            _local_5.visible = _arg_2;
            _local_5.x = ((_local_4.x + _local_4.width) + 2);
            this.updateWindow();
        }

        private function _Str_14440(k:String, _arg_2:Boolean):void
        {
            var _local_3:IItemListWindow = this._Str_20171(k);
            if (_local_3 != null)
            {
                _local_3.visible = _arg_2;
            }
        }

        private function _Str_20171(k:String):IItemListWindow
        {
            if (this._infoElements == null)
            {
                return null;
            }
            var _local_2:IWindowContainer = (this._infoElements.getListItemByName("status_container") as IWindowContainer);
            if (_local_2 == null)
            {
                return null;
            }
            return _local_2.findChildByName(("status_item_list_" + k)) as IItemListWindow;
        }

        private function _Str_22309(k:String, _arg_2:int):void
        {
            var _local_3:IWindowContainer;
            var _local_4:IWidgetWindow;
            var _local_6:Boolean;
            var _local_7:Boolean;
            var _local_8:ITextWindow;
            var _local_9:IItemListWindow;
            if (this._infoElements == null)
            {
                return;
            }
            _local_3 = (this._infoElements.getListItemByName("status_container") as IWindowContainer);
            if (_local_3 == null)
            {
                return;
            }
            _local_4 = (_local_3.findChildByName((k + "_status_widget")) as IWidgetWindow);
            var _local_5:IWidget = _local_4.widget;
            if (_local_5 == null)
            {
                return;
            }
            switch (k)
            {
                case GROWTH:
                    (_local_5 as _Str_2961).seconds = _arg_2;
                    _local_6 = (_arg_2 > 0);
                    _local_7 = (!(_local_4.visible == _local_6));
                    _local_4.visible = _local_6;
                    _local_8 = (_local_3.findChildByName((k + "_status_text")) as ITextWindow);
                    if (_local_8 != null)
                    {
                        _local_8.visible = _local_6;
                    }
                    if (_local_7)
                    {
                        _local_9 = (_local_3.findChildByName("status_item_list_monsterplant") as IItemListWindow);
                        if (_local_9 != null)
                        {
                            _local_9.arrangeListItems();
                        }
                    }
                    return;
            }
        }

        private function _Str_9597(k:String, _arg_2:int, _arg_3:int, _arg_4:uint, _arg_5:uint, _arg_6:String=null):void
        {
            var _local_10:BitmapData;
            if (this._infoElements == null)
            {
                return;
            }
            var _local_7:IWindowContainer = (this._infoElements.getListItemByName("status_container") as IWindowContainer);
            if (_local_7 == null)
            {
                return;
            }
            var _local_8:ITextWindow = (_local_7.findChildByName((("status_" + k) + "_value_text")) as ITextWindow);
            if (_local_8 != null)
            {
                _local_8.text = ((_arg_6 != null) ? _arg_6 : ((_arg_2 + "/") + _arg_3));
            }
            var _local_9:IBitmapWrapperWindow = (_local_7.findChildByName((("status_" + k) + "_bitmap")) as IBitmapWrapperWindow);
            if (_local_9 != null)
            {
                _local_10 = this._Str_12421(_arg_2, _arg_3, _arg_4, _arg_5);
                if (_local_10 != null)
                {
                    _local_9.bitmap = _local_10;
                    _local_9.width = _local_10.width;
                    _local_9.height = _local_10.height;
                    _local_9.invalidate();
                }
            }
            this.updateWindow();
        }

        protected function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_2:RoomWidgetMessage;
            var _local_3:String;
            var _local_5:String;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_4:IWindow = (k.target as IWindow);
            switch (_local_4.name)
            {
                case "btn_move":
                    _local_3 = RoomWidgetFurniActionMessage.RWFAM_MOVE;
                    break;
                case "btn_rotate":
                    _local_3 = RoomWidgetFurniActionMessage.RWFUAM_ROTATE;
                    break;
                case "btn_pick":
                    _local_3 = RoomWidgetUserActionMessage.RWUAM_PICKUP_PET;
                    if (((this._petCommadTool) && (this._petCommadTool._Str_18025() == this._currentPetId)))
                    {
                        this._petCommadTool._Str_3360(false);
                    }
                    break;
                case "btn_kick":
                    _local_3 = RoomWidgetUserActionMessage.RWUAM_PICKUP_PET;
                    if (((this._petCommadTool) && (this._petCommadTool._Str_18025() == this._currentPetId)))
                    {
                        this._petCommadTool._Str_3360(false);
                    }
                    break;
                case "btn_train":
                    this._Str_19969();
                    break;
                case "btn_buy_food":
                    if (this._catalog)
                    {
                        this._catalog.openCatalogPage(CatalogPageName.PET_ACCESSORIES);
                        if (((this._habboTracking) && (!(this._habboTracking.disposed))))
                        {
                            this._habboTracking.trackGoogle("infostandBuyPetFoodButton", "click");
                        }
                    }
                    break;
                case "btn_petrespect":
                    this._widget.userData._Str_2985--;
                    this._Str_22251();
                    _local_3 = RoomWidgetUserActionMessage._Str_6480;
                    break;
                case "btn_pettreat":
                    _local_3 = RoomWidgetUserActionMessage.RWUAM_TREAT_PET;
                    break;
            }
            if (_local_3 != null)
            {
                if (((_local_3 == RoomWidgetFurniActionMessage.RWFAM_MOVE) || (_local_3 == RoomWidgetFurniActionMessage.RWFUAM_ROTATE)))
                {
                    _local_6 = this._widget.petData.roomIndex;
                    _local_7 = RoomObjectCategoryEnum.CONST_100;
                    _local_2 = new RoomWidgetFurniActionMessage(_local_3, _local_6, _local_7, -1, _local_5);
                    this._widget.messageListener.processWidgetMessage(_local_2);
                }
                else
                {
                    _local_8 = this._widget.petData.id;
                    _local_2 = new RoomWidgetUserActionMessage(_local_3, _local_8);
                    this._widget.messageListener.processWidgetMessage(_local_2);
                }
            }
            this.updateWindow();
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this._widget.close();
        }

        private function _Str_22251():void
        {
            var k:int = this._widget.userData._Str_2985;
            this._widget.localizations.registerParameter("infostand.button.petrespect", "count", k.toString());
            this._Str_2304("petrespect", (k > 0));
        }

        protected function _Str_2304(k:String, _arg_2:Boolean):void
        {
            if (this._buttonsContainer == null)
            {
                return;
            }
            var _local_3:IWindow = this._buttonsContainer.getChildByName(k);
            if (_local_3 != null)
            {
                _local_3.visible = _arg_2;
                this._Str_18168();
            }
        }

        protected function _Str_17596(k:WindowEvent):void
        {
            var _local_2:IWindow = k.window.parent;
            if (((_local_2) && (_local_2.tags.indexOf("CMD_BUTTON_REGION") > -1)))
            {
                _local_2.width = k.window.width;
            }
        }

        private function _Str_18168():void
        {
            var _local_5:IWindow;
            var k:int = _Str_8222;
            this._buttonsContainer.width = k;
            var _local_2:Array = [];
            this._buttonsContainer.groupChildrenWithTag("CMD_BUTTON_REGION", _local_2, -1);
            var _local_3:int = k;
            var _local_4:int;
            for each (_local_5 in _local_2)
            {
                if (_local_5.visible)
                {
                    if ((_local_3 - _local_5.width) < 0)
                    {
                        _local_3 = k;
                        _local_4 = (_local_4 + (_Str_4468 + _Str_6207));
                    }
                    _local_5.x = (_local_3 - _local_5.width);
                    _local_5.y = _local_4;
                    _local_3 = (_local_5.x - _Str_6207);
                }
            }
            this._buttonsContainer.height = (_local_4 + _Str_4468);
            this.updateWindow();
        }

        private function _Str_22683(k:int, _arg_2:Array):int
        {
            var _local_4:int;
            var _local_3:int;
            for each (_local_4 in _arg_2)
            {
                if (((_local_4 > 0) && (k >= _local_4)))
                {
                    _local_3++;
                }
            }
            return _local_3;
        }

        private function _Str_16104(k:int, _arg_2:Array):int
        {
            var _local_4:int;
            var _local_3:int;
            for each (_local_4 in _arg_2)
            {
                if (_local_4 <= k)
                {
                    _local_3 = _local_4;
                }
                else
                {
                    break;
                }
            }
            return _local_3;
        }

        private function _Str_19542(k:int, _arg_2:Array):int
        {
            var _local_3:int = this._Str_16104(k, _arg_2);
            var _local_4:int = _arg_2.indexOf(_local_3);
            var _local_5:int = _local_3;
            if (_local_4 < (_arg_2.length - 1))
            {
                _local_5 = _arg_2[(_local_4 + 1)];
            }
            return _local_5;
        }

        private function _Str_16559(k:Boolean, _arg_2:InfoStandPetData):void
        {
            if (this._infoElements == null)
            {
                return;
            }
            var _local_3:IWindowContainer = (this._infoElements.getListItemByName("status_container") as IWindowContainer);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:IWidgetWindow = (_local_3.findChildByName("rarity_item_overlay_widget") as IWidgetWindow);
            var _local_5:IWidget = _local_4.widget;
            if (_local_5 == null)
            {
                return;
            }
            var _local_6:_Str_4520 = _Str_4520(_local_5);
            _local_6.rarityLevel = _arg_2.rarityLevel;
        }
    }
}
