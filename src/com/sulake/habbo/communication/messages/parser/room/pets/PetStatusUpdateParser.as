package com.sulake.habbo.communication.messages.parser.room.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetStatusUpdateParser implements IMessageParser 
    {
        private var _roomIndex:int;
        private var _Str_2388:int;
        private var _canBreed:Boolean;
        private var _canHarvest:Boolean;
        private var _canRevive:Boolean;
        private var _Str_3095:Boolean;


        public function get roomIndex():int
        {
            return this._roomIndex;
        }

        public function get _Str_2508():int
        {
            return this._Str_2388;
        }

        public function get canBreed():Boolean
        {
            return this._canBreed;
        }

        public function get canHarvest():Boolean
        {
            return this._canHarvest;
        }

        public function get canRevive():Boolean
        {
            return this._canRevive;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function get hasBreedingPermission():Boolean
        {
            return this._Str_3095;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomIndex = k.readInteger();
            this._Str_2388 = k.readInteger();
            this._canBreed = k.readBoolean();
            this._canHarvest = k.readBoolean();
            this._canRevive = k.readBoolean();
            this._Str_3095 = k.readBoolean();
            return true;
        }
    }
}
