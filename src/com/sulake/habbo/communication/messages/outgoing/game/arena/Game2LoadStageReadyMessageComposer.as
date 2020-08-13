package com.sulake.habbo.communication.messages.outgoing.game.arena
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2LoadStageReadyMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function Game2LoadStageReadyMessageComposer(k:int)
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
