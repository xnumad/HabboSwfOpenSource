package com.sulake.habbo.communication.messages.outgoing.quest
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RedeemCommunityGoalPrizeMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function RedeemCommunityGoalPrizeMessageComposer(communityGoalId:int)
        {
            this._data = [];
            super();
            this._data.push(communityGoalId);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = null;
        }
    }
}
