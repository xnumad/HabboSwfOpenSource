package com.sulake.habbo.communication.messages.parser.room.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetTrainingPanelMessageParser implements IMessageParser 
    {
        private var _petId:int;
        private var _commands:Array;
        private var _enabledCommands:Array;


        public function get id():int
        {
            return this._petId;
        }

        public function get commands():Array
        {
            return this._commands;
        }

        public function get enabledCommands():Array
        {
            return this._enabledCommands;
        }

        public function flush():Boolean
        {
            this._petId = -1;
            this._commands = null;
            this._enabledCommands = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
		
            if (k == null)
            {
                return false;
            }
            this._petId = k.readInteger();
            var _local_2:int = k.readInteger();
            this._commands = new Array();
            while (_local_2-- > 0)
            {
                this._commands.push(k.readInteger());
            }
            var _local_3:int = k.readInteger();
            this._enabledCommands = new Array();
            while (_local_3-- > 0)
            {
                this._enabledCommands.push(k.readInteger());
            }
            return true;
        }
    }
}
