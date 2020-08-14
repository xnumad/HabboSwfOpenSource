package com.sulake.habbo.communication.messages.outgoing.game.lobby
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetUserGameAchievementsMessageComposer implements IMessageComposer
    {
        private var _Str_2634:int;

        public function GetUserGameAchievementsMessageComposer(k:int)
        {
            this._Str_2634 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2634];
        }

        public function dispose():void
        {
        }
    }
}
