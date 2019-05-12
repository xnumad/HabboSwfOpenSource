package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetBoughtNotificationMessageParser implements IMessageParser 
    {
        private var _gift:Boolean;
        private var _pet:_Str_2848;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._gift = k.readBoolean();
            this._pet = new _Str_2848(k);
            return true;
        }

        public function get gift():Boolean
        {
            return this._gift;
        }

        public function get pet():_Str_2848
        {
            return this._pet;
        }
    }
}
