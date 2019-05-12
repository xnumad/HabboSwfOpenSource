package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8182 implements IMessageParser 
    {
        private var _pet:_Str_2848;
        private var _Str_12302:Boolean;


        public function flush():Boolean
        {
            this._pet = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._pet = new _Str_2848(k);
            this._Str_12302 = k.readBoolean();
            return true;
        }

        public function get pet():_Str_2848
        {
            return this._pet;
        }

        public function _Str_19947():Boolean
        {
            return this._Str_12302;
        }
    }
}
