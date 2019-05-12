package com.sulake.habbo.communication.messages.incoming.crafting
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CraftingResultMessageParser implements IMessageParser 
    {
        private var _success:Boolean;
        private var _result:CraftingResultObjectParser;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._success = k.readBoolean();
            if (this._success)
            {
                this._result = new CraftingResultObjectParser(k);
            }
            return true;
        }

        public function flush():Boolean
        {
            this._success = false;
            return true;
        }

        public function get success():Boolean
        {
            return this._success;
        }

        public function get result():CraftingResultObjectParser
        {
            return this._result;
        }
    }
}
