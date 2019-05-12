package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.IUserDefinedRoomEventsCtrl;
    import com.sulake.habbo.roomevents.userdefinedroomevents.WiredFurniture;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;

    public class UserDefinedRoomEventsTriggersCtrl implements IUserDefinedRoomEventsCtrl 
    {
        private var _Str_3624:Array;

        public function UserDefinedRoomEventsTriggersCtrl()
        {
            this._Str_3624 = new Array();
            super();
            this._Str_3624.push(new AvatarSaysSomething());
            this._Str_3624.push(new AvatarWalksOnFurni());
            this._Str_3624.push(new AvatarWalksOffFurni());
            this._Str_3624.push(new TriggerOnce());
            this._Str_3624.push(new ToggleFurni());
            this._Str_3624.push(new TriggerPeriodically());
            this._Str_3624.push(new AvatarEnterRoom());
            this._Str_3624.push(new GameStarts());
            this._Str_3624.push(new GameEnds());
            this._Str_3624.push(new ScoreAchieved());
            this._Str_3624.push(new Collision());
            this._Str_3624.push(new TriggerPeriodicallyLong());
            this._Str_3624.push(new BotReachedStuff());
            this._Str_3624.push(new BotReachedAvatar());
        }

        public function get _Str_26037():Array
        {
            return this._Str_3624;
        }

        public function _Str_9781(k:int):WiredTrigger
        {
            var _local_2:WiredTrigger;
            for each (_local_2 in this._Str_3624)
            {
                if (_local_2.code == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_15652(k:int):WiredFurniture
        {
            return this._Str_9781(k);
        }

        public function _Str_14545(k:Triggerable):Boolean
        {
            return !((k as TriggerDefinition) == null);
        }

        public function _Str_1196():String
        {
            return "trigger";
        }
    }
}
