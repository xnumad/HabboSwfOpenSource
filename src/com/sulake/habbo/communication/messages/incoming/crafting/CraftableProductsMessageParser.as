package com.sulake.habbo.communication.messages.incoming.crafting
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class CraftableProductsMessageParser implements IMessageParser 
    {
        private var _recipes:Vector.<CraftingResultObjectParser>;
        private var _ingredients:Vector.<String>;

        public function CraftableProductsMessageParser()
        {
            this._recipes = new Vector.<CraftingResultObjectParser>(0);
            this._ingredients = new Vector.<String>(0);
            super();
        }

        public function flush():Boolean
        {
            this._recipes = new Vector.<CraftingResultObjectParser>(0);
            this._ingredients = new Vector.<String>(0);
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
			var _local_3:int;
            var _local_2:int = k.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._recipes.push(new CraftingResultObjectParser(k));
                _local_3++;
            }
            _local_2 = k.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._ingredients.push(k.readString());
                _local_3++;
            }
            return true;
        }

        public function get recipes():Vector.<CraftingResultObjectParser>
        {
            return this._recipes;
        }

        public function get ingredients():Vector.<String>
        {
            return this._ingredients;
        }

        public function isActive():Boolean
        {
            return (this._recipes.length > 0) || (this._ingredients.length > 0);
        }
    }
}
