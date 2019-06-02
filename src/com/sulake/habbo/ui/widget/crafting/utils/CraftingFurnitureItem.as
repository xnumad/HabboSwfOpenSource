package com.sulake.habbo.ui.widget.crafting.utils
{
    import flash.events.EventDispatcher;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class CraftingFurnitureItem extends EventDispatcher 
    {
        private var _productCode:String;
        private var _furnitureData:IFurnitureData;
        private var _inventoryIds:Vector.<int>;
        private var _mixerIds:Vector.<int>;

        public function CraftingFurnitureItem(k:String, _arg_2:IFurnitureData)
        {
            this._productCode = k;
            this._furnitureData = _arg_2;
            this._inventoryIds = new Vector.<int>(0);
            this._mixerIds = new Vector.<int>(0);
        }

        public function get furnitureData():IFurnitureData
        {
            return this._furnitureData;
        }

        public function get productCode():String
        {
            return this._productCode;
        }

        public function get typeId():int
        {
            return (this._furnitureData) ? this._furnitureData.id : -1;
        }

        public function get countInInventory():int
        {
            return (this._inventoryIds) ? this._inventoryIds.length : 0;
        }

        public function set _Str_23988(k:Vector.<int>):void
        {
            this._inventoryIds = k;
        }

        public function getItemToMixer():int
        {
            if (this.countInInventory == 0)
            {
                return 0;
            }
            var k:int = this._inventoryIds.shift();
            this._mixerIds.push(k);
            return k;
        }

        public function returnItemToInventory(k:int):void
        {
            this._inventoryIds.push(k);
            this._mixerIds.splice(this._mixerIds.indexOf(k), 1);
        }
    }
}
