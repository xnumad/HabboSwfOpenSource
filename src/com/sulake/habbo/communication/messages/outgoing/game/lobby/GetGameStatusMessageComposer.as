package com.sulake.habbo.communication.messages.outgoing.game.lobby
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetGameStatusMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function GetGameStatusMessageComposer(k:int)
        {
            this._data = [];
            super();
            this._data.push(k);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = [];
        }
    }
}
