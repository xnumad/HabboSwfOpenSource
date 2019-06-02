package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarPlayingGameMessage extends RoomObjectUpdateStateMessage 
    {
        private var _isPlayingGame:Boolean;

        public function RoomObjectAvatarPlayingGameMessage(k:Boolean=false)
        {
            this._isPlayingGame = k;
        }

        public function get isPlayingGame():Boolean
        {
            return this._isPlayingGame;
        }
    }
}
