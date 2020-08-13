package com.sulake.habbo.communication.messages.outgoing.game.directory
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2CheckGameDirectoryStatusMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function Game2CheckGameDirectoryStatusMessageComposer()
        {
            this._data = [];
            super();
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
