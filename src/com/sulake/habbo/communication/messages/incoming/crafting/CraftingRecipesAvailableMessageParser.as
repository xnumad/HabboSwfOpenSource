package com.sulake.habbo.communication.messages.incoming.crafting
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CraftingRecipesAvailableMessageParser implements IMessageParser 
    {
        private var _hasRecipes:Boolean;
        private var _count:int;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._count = k.readInteger();
            this._hasRecipes = k.readBoolean();
            return true;
        }

        public function flush():Boolean
        {
            this._count = 0;
            this._hasRecipes = false;
            return true;
        }

        public function get count():int
        {
            return this._count;
        }

        public function get hasRecipes():Boolean
        {
            return this._hasRecipes;
        }
    }
}
