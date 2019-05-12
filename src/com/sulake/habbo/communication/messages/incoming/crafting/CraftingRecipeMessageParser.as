package com.sulake.habbo.communication.messages.incoming.crafting
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class CraftingRecipeMessageParser implements IMessageParser 
    {
        private var _ingredients:Vector.<CraftinRecipeIngredientParser>;

        public function CraftingRecipeMessageParser()
        {
            this._ingredients = new Vector.<CraftinRecipeIngredientParser>(0);
            super();
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
			var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._ingredients.push(new CraftinRecipeIngredientParser(k));
                _local_3++;
            }
            return true;
        }

        public function flush():Boolean
        {
            this._ingredients = new Vector.<CraftinRecipeIngredientParser>(0);
            return true;
        }

        public function get ingredients():Vector.<CraftinRecipeIngredientParser>
        {
            return this._ingredients;
        }
    }
}
