package com.sulake.habbo.ui.widget.crafting.controller
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.ui.widget.crafting.renderer.CraftingMixerItemRenderer;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.core.window.components.IItemGridWindow;
    import __AS3__.vec.*;
    import com.sulake.habbo.ui.widget.crafting.*;

    public class CraftingMixerController extends CraftingGridControllerBase 
    {
        private static const _Str_17735:int = 10;

        private var _renderers:Vector.<CraftingMixerItemRenderer>;

        public function CraftingMixerController(k:CraftingWidget)
        {
            super(k);
            this._renderers = new Vector.<CraftingMixerItemRenderer>(0);
        }

        override public function dispose():void
        {
            this._Str_21521();
            super.dispose();
        }

        public function _Str_21521():void
        {
            var _local_2:CraftingMixerItemRenderer;
            var k:int;
            while (k < this._renderers.length)
            {
                _local_2 = this._renderers[k];
                if (_local_2)
                {
                    _local_2.returnItemToInventory();
                }
                k++;
            }
            this._renderers.length = 0;
            if (this.container)
            {
                this.container.destroyGridItems();
            }
            if (((_Str_2268) && (_Str_2268.inventoryCtrl)))
            {
                _Str_2268.inventoryCtrl.updateItemCounts();
            }
        }

        public function clearItems():void
        {
            this._Str_21521();
            if (this.container)
            {
                this.container.destroyGridItems();
            }
        }

        public function canAdd():Boolean
        {
            return this._renderers.length < _Str_17735;
        }

        public function addItemToMixer(k:CraftingFurnitureItem, _arg_2:int):Boolean
        {
            if (!this.container)
            {
                return false;
            }
            var _local_3:IWindowContainer = getItemTemplate();
            var _local_4:CraftingMixerItemRenderer = new CraftingMixerItemRenderer(k, (_local_3.clone() as IWindowContainer), _Str_2268);
            _local_4._Str_18598 = _arg_2;
            this.container._Str_2816(_local_4.window);
            this._renderers.push(_local_4);
            if (_Str_2268.inSecretRecipeMode)
            {
                _Str_2268.mixerContentChanged(this._Str_16929());
            }
            return true;
        }

        public function removeListItem(k:CraftingMixerItemRenderer):void
        {
            var _local_3:CraftingMixerItemRenderer;
            if (!this.container)
            {
                return;
            }
            var _local_2:int;
            while (_local_2 < this._renderers.length)
            {
                _local_3 = this._renderers[_local_2];
                if (_local_3 == k)
                {
                    this._renderers.splice(_local_2, 1);
                    if (_local_3.window)
                    {
                        this.container._Str_4725(_local_3.window);
                        this.container._Str_11488();
                    }
                    _local_3.returnItemToInventory();
                    _Str_2268.inventoryCtrl.updateItemCounts();
                    _Str_2268.mixerContentChanged(this._Str_16929());
                    return;
                }
                _local_2++;
            }
        }

        public function _Str_16929():Vector.<int>
        {
            var _local_3:CraftingMixerItemRenderer;
            var k:Vector.<int> = new Vector.<int>(0);
            var _local_2:int;
            while (_local_2 < this._renderers.length)
            {
                _local_3 = this._renderers[_local_2];
                if (_local_3)
                {
                    k.push(_local_3._Str_18598);
                }
                _local_2++;
            }
            return k;
        }

        private function get container():IItemGridWindow
        {
            return (mainWindow) ? (mainWindow.findChildByName("itemgrid_mixer") as IItemGridWindow) : null;
        }
    }
}
