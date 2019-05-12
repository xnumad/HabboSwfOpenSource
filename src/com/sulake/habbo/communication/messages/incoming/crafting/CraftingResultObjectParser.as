package com.sulake.habbo.communication.messages.incoming.crafting
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CraftingResultObjectParser 
    {
        private var _recipeName:String;
        private var _itemName:String;

        public function CraftingResultObjectParser(k:IMessageDataWrapper)
        {
            this._recipeName = k.readString();
            this._itemName = k.readString();
        }

        public function get recipeName():String
        {
            return this._recipeName;
        }

        public function get itemName():String
        {
            return this._itemName;
        }
    }
}
