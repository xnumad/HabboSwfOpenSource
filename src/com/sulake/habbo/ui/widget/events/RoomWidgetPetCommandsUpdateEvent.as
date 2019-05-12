package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPetCommandsUpdateEvent extends RoomWidgetUpdateEvent 
    {
        public static const PET_COMMANDS:String = "RWPCUE_PET_COMMANDS";
        public static const OPEN_PET_TRAINING:String = "RWPCUE_OPEN_PET_TRAINING";
        public static const CLOSE_PET_TRAINING:String = "RWPCUE_CLOSE_PET_TRAINING";

        private var _id:int;
        private var _allCommands:Array;
        private var _enabledCommands:Array;

        public function RoomWidgetPetCommandsUpdateEvent(k:int, commands:Array, enabledCommands:Array, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS, _arg_4, _arg_5);
            this._id = k;
            this._allCommands = commands;
            this._enabledCommands = enabledCommands;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get commands():Array
        {
            return this._allCommands;
        }

        public function get enabledCommands():Array
        {
            return this._enabledCommands;
        }
    }
}
