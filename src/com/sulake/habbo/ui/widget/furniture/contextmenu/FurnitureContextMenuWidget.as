package com.sulake.habbo.ui.widget.furniture.contextmenu
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.ui.widget.contextmenu.IContextMenuParentWidget;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.runtime.Component;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.widget.furniture.guildfurnicontextmenu.GuildFurnitureContextMenuView;
    import com.sulake.habbo.ui.widget.furniture.effectbox.EffectBoxOpenDialogView;
    import com.sulake.habbo.ui.widget.furniture.mysterybox.MysteryBoxContextMenuView;
    import com.sulake.habbo.ui.widget.furniture.mysterytrophy.MysteryTrophyOpenDialogView;
    import com.sulake.habbo.ui.widget.furniture.mysterybox.MysteryBoxOpenDialogView;
    import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniContextMenuView;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.groups.IHabboGroupsManager;
    import com.sulake.habbo.ui.handler.FurnitureContextMenuWidgetHandler;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.ui.widget.contextmenu.ContextInfoView;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.friendlist.IHabboFriendsList;

    public class FurnitureContextMenuWidget extends ConversionTrackingWidget implements IContextMenuParentWidget, IUpdateReceiver 
    {
        private var _component:Component;
        private var _view:FurnitureContextInfoView;
        private var _selectedObject:IRoomObject = null;
        private var _cachedGuildFurniContextView:GuildFurnitureContextMenuView;
        private var _cachedRandomTeleportContextView:RandomTeleportContextMenuView;
        private var _cachedMonsterPlantSeedContextView:MonsterPlantSeedContextMenuView;
        private var _cachedMonsterPlantSeedConfirmationView:MonsterPlantSeedConfirmationView;
        private var _cachedEffectBoxOpenDialogView:EffectBoxOpenDialogView;
        private var _cachedMysteryBoxContextView:MysteryBoxContextMenuView;
        private var _cachedMysteryTrophyOpenDialogView:MysteryTrophyOpenDialogView;
        private var _cachedMysteryBoxOpenDialogView:MysteryBoxOpenDialogView;
        private var _cachedFriendFurnitureContextView:FriendFurniContextMenuView;
        private var _cachedUsableFurnitureContextView:GenericUsableFurnitureContextMenuView;
        private var _catalog:IHabboCatalog;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _cachedPurchasableClothingConfirmationView:PurchasableClothingConfirmationView;

        public function FurnitureContextMenuWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboConfigurationManager, _arg_5:IHabboLocalizationManager, _arg_6:Component, _arg_7:IHabboGroupsManager, _arg_8:IHabboCatalog)
        {
            super(k, _arg_2, _arg_3, _arg_5);
            this._component = _arg_6;
            this._cachedGuildFurniContextView = new GuildFurnitureContextMenuView(this, _arg_7, _arg_2);
            this._cachedRandomTeleportContextView = new RandomTeleportContextMenuView(this);
            this._cachedMonsterPlantSeedContextView = new MonsterPlantSeedContextMenuView(this);
            this._cachedMysteryBoxContextView = new MysteryBoxContextMenuView(this);
            this._cachedFriendFurnitureContextView = new FriendFurniContextMenuView(this);
            this._cachedUsableFurnitureContextView = new GenericUsableFurnitureContextMenuView(this);
            this._cachedMonsterPlantSeedConfirmationView = new MonsterPlantSeedConfirmationView(this);
            this._cachedMysteryBoxOpenDialogView = new MysteryBoxOpenDialogView(this);
            this._cachedEffectBoxOpenDialogView = new EffectBoxOpenDialogView(this);
            this._cachedMysteryTrophyOpenDialogView = new MysteryTrophyOpenDialogView(this);
            this._cachedPurchasableClothingConfirmationView = new PurchasableClothingConfirmationView(this);
            this._catalog = _arg_8;
            this.handler.widget = this;
            this.handler.roomEngine.events.addEventListener(RoomEngineObjectEvent.REMOVED, this._Str_4159);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            this._component.removeUpdateReceiver(this);
            this.removeView(this._view, false);
            this._cachedGuildFurniContextView.dispose();
            this._cachedGuildFurniContextView = null;
            this._cachedRandomTeleportContextView.dispose();
            this._cachedRandomTeleportContextView = null;
            this._cachedMonsterPlantSeedContextView.dispose();
            this._cachedMonsterPlantSeedContextView = null;
            this._cachedMonsterPlantSeedConfirmationView.dispose();
            this._cachedMonsterPlantSeedConfirmationView = null;
            this._cachedMysteryBoxContextView.dispose();
            this._cachedMysteryBoxContextView = null;
            this._cachedMysteryBoxOpenDialogView.dispose();
            this._cachedMysteryBoxOpenDialogView = null;
            this._cachedFriendFurnitureContextView.dispose();
            this._cachedFriendFurnitureContextView = null;
            this._cachedUsableFurnitureContextView.dispose();
            this._cachedUsableFurnitureContextView = null;
            this._cachedEffectBoxOpenDialogView.dispose();
            this._cachedEffectBoxOpenDialogView = null;
            this._cachedMysteryTrophyOpenDialogView.dispose();
            this._cachedMysteryTrophyOpenDialogView = null;
            this._cachedPurchasableClothingConfirmationView.dispose();
            this._cachedPurchasableClothingConfirmationView = null;
            this._catalog = null;
            super.dispose();
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function get handler():FurnitureContextMenuWidgetHandler
        {
            return _Str_2470 as FurnitureContextMenuWidgetHandler;
        }

        public function get roomEngine():IRoomEngine
        {
            return (this._container) ? this._container.roomEngine : null;
        }

        public function _Str_22969(k:IRoomObject):void
        {
            if (((!(this._selectedObject == null)) && (this._selectedObject.getId() == k.getId())))
            {
                this.removeView(this._view, false);
                this._component.removeUpdateReceiver(this);
                this._selectedObject = null;
            }
        }

        public function _Str_24867(k:IRoomObject, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:Boolean, _arg_6:Boolean):void
        {
            this._selectedObject = k;
            this._cachedGuildFurniContextView._Str_2994 = _arg_2;
            this._cachedGuildFurniContextView._Str_8815 = _arg_4;
            this._cachedGuildFurniContextView._Str_7536 = _arg_5;
            this._cachedGuildFurniContextView._Str_9506 = _arg_6;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            this._view = this._cachedGuildFurniContextView;
            FurnitureContextInfoView.setup(this._view, k, _arg_3);
            this._component.registerUpdateReceiver(this, 10);
        }

        public function _Str_23454(k:IRoomObject, _arg_2:int):void
        {
            this._selectedObject = k;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            this._cachedRandomTeleportContextView.objectCategory = _arg_2;
            this._view = this._cachedRandomTeleportContextView;
            FurnitureContextInfoView.setup(this._view, k);
            this._component.registerUpdateReceiver(this, 10);
        }

        public function _Str_23088(k:IRoomObject, _arg_2:int):void
        {
            this._selectedObject = k;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            this._cachedMonsterPlantSeedContextView.objectCategory = _arg_2;
            this._view = this._cachedMonsterPlantSeedContextView;
            FurnitureContextInfoView.setup(this._view, k);
            this._component.registerUpdateReceiver(this, 10);
        }

        public function _Str_20801(k:IRoomObject):void
        {
            this._selectedObject = k;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            if (!this._cachedMonsterPlantSeedConfirmationView)
            {
                this._cachedMonsterPlantSeedConfirmationView = new MonsterPlantSeedConfirmationView(this);
            }
            this._cachedMonsterPlantSeedConfirmationView.open(k.getId());
        }

        public function _Str_24748(k:IRoomObject):void
        {
            this._selectedObject = k;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            if (!this._cachedPurchasableClothingConfirmationView)
            {
                this._cachedPurchasableClothingConfirmationView = new PurchasableClothingConfirmationView(this);
            }
            this._cachedPurchasableClothingConfirmationView.open(k.getId());
        }

        public function _Str_22510(k:IRoomObject):void
        {
            this._selectedObject = k;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            if (!this._cachedEffectBoxOpenDialogView)
            {
                this._cachedEffectBoxOpenDialogView = new EffectBoxOpenDialogView(this);
            }
            this._cachedEffectBoxOpenDialogView.open(k.getId());
        }

        public function _Str_25152(k:IRoomObject):void
        {
            this._selectedObject = k;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            if (!this._cachedMysteryTrophyOpenDialogView)
            {
                this._cachedMysteryTrophyOpenDialogView = new MysteryTrophyOpenDialogView(this);
            }
            this._cachedMysteryTrophyOpenDialogView.open(k.getId());
        }

        private function _Str_25681():void
        {
            if (this._cachedMonsterPlantSeedConfirmationView != null)
            {
                this._cachedMonsterPlantSeedConfirmationView.close();
            }
        }

        public function _Str_25785(k:IRoomObject):void
        {
            this._selectedObject = k;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            if (this._cachedMysteryBoxContextView == null)
            {
                this._cachedMysteryBoxContextView = new MysteryBoxContextMenuView(this);
            }
            this._cachedMysteryBoxContextView._Str_23546 = this.handler.container.isOwnerOfFurniture(k);
            this._cachedMysteryBoxContextView.show();
            this._view = this._cachedMysteryBoxContextView;
            FurnitureContextInfoView.setup(this._view, k);
            this._component.registerUpdateReceiver(this, 10);
        }

        public function _Str_25158(k:IRoomObject):void
        {
            this._selectedObject = k;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            if (this._cachedFriendFurnitureContextView == null)
            {
                this._cachedFriendFurnitureContextView = new FriendFurniContextMenuView(this);
            }
            this._cachedFriendFurnitureContextView.show();
            this._view = this._cachedFriendFurnitureContextView;
            FurnitureContextInfoView.setup(this._view, k);
            this._component.registerUpdateReceiver(this, 10);
        }

        public function _Str_23812(k:IRoomObject, _arg_2:int):void
        {
            this._selectedObject = k;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            if (this._cachedUsableFurnitureContextView == null)
            {
                this._cachedUsableFurnitureContextView = new GenericUsableFurnitureContextMenuView(this);
            }
            this._cachedUsableFurnitureContextView.show();
            this._cachedUsableFurnitureContextView.objectCategory = _arg_2;
            this._view = this._cachedUsableFurnitureContextView;
            FurnitureContextInfoView.setup(this._view, k);
            this._component.registerUpdateReceiver(this, 10);
        }

        public function _Str_20629(k:IRoomObject):void
        {
            this._selectedObject = k;
            if (this._view != null)
            {
                this.removeView(this._view, false);
            }
            this._cachedMysteryBoxOpenDialogView._Str_24779(k);
        }

        public function removeView(k:ContextInfoView, _arg_2:Boolean):void
        {
            if (k)
            {
                k.hide(false);
                if (k == this._view)
                {
                    this._view = null;
                }
            }
        }

        public function update(k:uint):void
        {
            if (((this._view) && (this._selectedObject)))
            {
                this._view.update(this.handler._Str_25023(this._selectedObject.getId()), this.handler._Str_22398(this._selectedObject.getId()), k);
            }
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        private function _Str_4159(k:RoomEngineObjectEvent):void
        {
            var _local_2:int;
            if (k.category == RoomObjectCategoryEnum.CONST_10)
            {
                _local_2 = k._Str_1577;
                if (((!(this._selectedObject == null)) && (this._selectedObject.getId() == _local_2)))
                {
                    this.removeView(this._view, false);
                    this._Str_25681();
                    this._component.removeUpdateReceiver(this);
                    this._selectedObject = null;
                }
            }
        }

        public function get friendList():IHabboFriendsList
        {
            return null;
        }
    }
}
