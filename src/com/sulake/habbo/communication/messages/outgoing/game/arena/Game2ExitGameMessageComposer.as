package com.sulake.habbo.communication.messages.outgoing.game.arena
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2ExitGameMessageComposer implements IMessageComposer
    {
        private var _exitToRoomBeforeGame:Boolean;

        public function Game2ExitGameMessageComposer(k:Boolean=true)
        {
            this._exitToRoomBeforeGame = k;
        }

        public function getMessageArray():Array
        {
            return [this._exitToRoomBeforeGame];
        }

        public function dispose():void
        {
        }
    }
}
