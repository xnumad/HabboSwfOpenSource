package com.sulake.habbo.communication.messages.parser.room.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetInfoMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetBreedingResultParser implements IMessageParser 
    {
        private var _Str_3111:PetInfoMessageParser;
        private var _Str_11472:PetInfoMessageParser;


        public function get _Str_3713():PetInfoMessageParser
        {
            return this._Str_3111;
        }

        public function get _Str_5840():PetInfoMessageParser
        {
            return this._Str_11472;
        }

        public function flush():Boolean
        {
            return true;
        }

        private function _Str_19638(k:IMessageDataWrapper):PetInfoMessageParser
        {
            var _local_2:int = k.readInteger();
            var _local_3:int = k.readInteger();
            var _local_4:String = k.readString();
            var _local_5:int = k.readInteger();
            var _local_6:String = k.readString();
            var _local_7:int = k.readInteger();
            var _local_8:Boolean = k.readBoolean();
            return new PetInfoMessageParser(_local_2, _local_3, _local_4, _local_5, _local_6, _local_7, _local_8);
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_3111 = this._Str_19638(k);
            this._Str_11472 = this._Str_19638(k);
            return true;
        }
    }
}
