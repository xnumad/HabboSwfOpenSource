package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FlatControllersMessageParser implements IMessageParser
    {
        private var _roomId:int;
        private var _controllers:Array;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomId = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._controllers.push(new FlatControllerData(k));
                _local_3++;
            }
            return true;
        }

        public function flush():Boolean
        {
            this._controllers = [];
            return true;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get controllers():Array
        {
            return this._controllers;
        }
    }
}
