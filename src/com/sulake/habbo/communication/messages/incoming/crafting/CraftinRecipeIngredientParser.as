package com.sulake.habbo.communication.messages.incoming.crafting
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CraftinRecipeIngredientParser 
    {
        private var _count:int;
        private var _itemName:String;

        public function CraftinRecipeIngredientParser(k:IMessageDataWrapper)
        {
            this._count = k.readInteger();
            this._itemName = k.readString();
        }

        public function get count():int
        {
            return this._count;
        }

        public function get itemName():String
        {
            return this._itemName;
        }
    }
}
