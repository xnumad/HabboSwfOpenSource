package com.sulake.habbo.communication.messages.outgoing.game.arena
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2GameChatMessageComposer implements IMessageComposer
    {
        private var _Str_17731:String;

        public function Game2GameChatMessageComposer(k:String)
        {
            this._Str_17731 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_17731];
        }

        public function dispose():void
        {
            this._Str_17731 = null;
        }
    }
}
