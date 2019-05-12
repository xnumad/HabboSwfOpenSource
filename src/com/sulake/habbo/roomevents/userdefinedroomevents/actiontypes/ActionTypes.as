package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.IUserDefinedRoomEventsCtrl;
    import com.sulake.habbo.roomevents.userdefinedroomevents.WiredFurniture;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
	import com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes.CallAnotherStack;

    public class ActionTypes implements IUserDefinedRoomEventsCtrl 
    {
        private var _types:Array;

        public function ActionTypes()
        {
            this._types = new Array();
            super();
            this._types.push(new ToggleFurniState());
            this._types.push(new Reset());
            this._types.push(new SetFurniStateTo());
            this._types.push(new MoveFurni());
            this._types.push(new GiveScore());
            this._types.push(new Chat());
            this._types.push(new Teleport());
            this._types.push(new JoinTeam());
            this._types.push(new LeaveTeam());
            this._types.push(new Chase());
            this._types.push(new Flee());
            this._types.push(new MoveToDirection());
            this._types.push(new GiveScoreToPredefinedTeam());
            this._types.push(new ToggleToRandomState());
            this._types.push(new MoveFurniTo());
            this._types.push(new GiveReward());
            this._types.push(new CallAnotherStack());
            this._types.push(new KickFromRoom());
            this._types.push(new MuteUser());
            this._types.push(new BotTeleport());
            this._types.push(new BotMove());
            this._types.push(new BotTalk());
            this._types.push(new BotGiveHandItem());
            this._types.push(new BotFollowAvatar());
            this._types.push(new BotChangeFigure());
            this._types.push(new BotTalkDirectToAvatar());
        }

        public function get _Str_24294():Array
        {
            return this._types;
        }

        public function _Str_9781(k:int):DefaultActionType
        {
            var _local_2:DefaultActionType;
            for each (_local_2 in this._types)
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
            return !((k as ActionDefinition) == null);
        }

        public function _Str_1196():String
        {
            return "action";
        }
    }
}
