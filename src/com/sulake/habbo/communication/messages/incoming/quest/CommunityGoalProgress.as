package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityGoalProgress implements IDisposable 
    {
        private var _Str_20278:Boolean;
        private var _personalContributionScore:int;
        private var _Str_22026:int;
        private var _Str_19093:int;
        private var _communityHighestAchievedLevel:int;
        private var _scoreRemainingUntilNextLevel:int;
        private var _percentCompletionTowardsNextLevel:int;
        private var _Str_3087:String;
        private var _Str_19794:int;
        private var _Str_12198:Array;

        public function CommunityGoalProgress(k:IMessageDataWrapper):void
        {
            this._Str_12198 = [];
            super();
            this._Str_20278 = k.readBoolean();
            this._personalContributionScore = k.readInteger();
            this._Str_22026 = k.readInteger();
            this._Str_19093 = k.readInteger();
            this._communityHighestAchievedLevel = k.readInteger();
            this._scoreRemainingUntilNextLevel = k.readInteger();
            this._percentCompletionTowardsNextLevel = k.readInteger();
            this._Str_3087 = k.readString();
            this._Str_19794 = k.readInteger();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_12198.push(k.readInteger());
                _local_3++;
            }
        }

        public function dispose():void
        {
            this._Str_12198 = null;
        }

        public function get disposed():Boolean
        {
            return this._Str_12198 == null;
        }

        public function get _Str_13028():Boolean
        {
            return this._Str_20278;
        }

        public function get personalContributionScore():int
        {
            return this._personalContributionScore;
        }

        public function get _Str_10549():int
        {
            return this._Str_22026;
        }

        public function get _Str_12030():int
        {
            return this._Str_19093;
        }

        public function get communityHighestAchievedLevel():int
        {
            return this._communityHighestAchievedLevel;
        }

        public function get scoreRemainingUntilNextLevel():int
        {
            return this._scoreRemainingUntilNextLevel;
        }

        public function get percentCompletionTowardsNextLevel():int
        {
            return this._percentCompletionTowardsNextLevel;
        }

        public function get _Str_24637():int
        {
            return this._Str_19794;
        }

        public function get _Str_20155():Array
        {
            return this._Str_12198;
        }

        public function get goalCode():String
        {
            return this._Str_3087;
        }
    }
}
