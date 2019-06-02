package com.sulake.habbo.communication.messages.parser.room.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetStatusUpdateParser implements IMessageParser 
    {
        private var _Str_2775:int;
        private var _Str_2388:int;
        private var _Str_3101:Boolean;
        private var _Str_3297:Boolean;
        private var _Str_3284:Boolean;
        private var _Str_3095:Boolean;


        public function get roomIndex():int
        {
            return this._Str_2775;
        }

        public function get _Str_2508():int
        {
            return this._Str_2388;
        }

        public function get canBreed():Boolean
        {
            return this._Str_3101;
        }

        public function get canHarvest():Boolean
        {
            return this._Str_3297;
        }

        public function get canRevive():Boolean
        {
            return this._Str_3284;
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
            this._Str_2775 = k.readInteger();
            this._Str_2388 = k.readInteger();
            this._Str_3101 = k.readBoolean();
            this._Str_3297 = k.readBoolean();
            this._Str_3284 = k.readBoolean();
            this._Str_3095 = k.readBoolean();
            return true;
        }
    }
}
