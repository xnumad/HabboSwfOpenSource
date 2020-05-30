package com.sulake.habbo.communication.messages.outgoing.landingview.votes
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class CommunityGoalVoteMessageComposer implements IMessageComposer
    {
        private var _voteOption:int;

        public function CommunityGoalVoteMessageComposer(k:int)
        {
            this._voteOption = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._voteOption];
        }
    }
}
