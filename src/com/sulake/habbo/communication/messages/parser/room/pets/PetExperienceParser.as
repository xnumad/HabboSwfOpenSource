package com.sulake.habbo.communication.messages.parser.room.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetExperienceParser implements IMessageParser 
    {
        private var _petId:int = -1;
        private var _petRoomIndex:int = -1;
        private var _gainedExperience:int = 0;


        public function get _Str_2508():int
        {
            return this._petId;
        }

        public function get petRoomIndex():int
        {
            return this._petRoomIndex;
        }

        public function get _Str_18578():int
        {
            return this._gainedExperience;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._petId = k.readInteger();
            this._petRoomIndex = k.readInteger();
            this._gainedExperience = k.readInteger();
            return true;
        }
    }
}
