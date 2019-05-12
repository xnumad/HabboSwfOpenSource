package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetCommandsUpdateEvent extends RoomSessionEvent 
    {
        public static const PET_COMMANDS:String = "RSPIUE_ENABLED_PET_COMMANDS";

        private var _petId:int;
        private var _allCommandIds:Array;
        private var _enabledCommandIds:Array;

        public function RoomSessionPetCommandsUpdateEvent(k:IRoomSession, id:int, commands:Array, enabledCommands:Array, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS, k, _arg_5, _arg_6);
            this._petId = id;
            this._allCommandIds = commands;
            this._enabledCommandIds = enabledCommands;
        }

        public function get id():int
        {
            return this._petId;
        }

        public function get commands():Array
        {
            return this._allCommandIds;
        }

        public function get enabledCommands():Array
        {
            return this._enabledCommandIds;
        }
    }
}
