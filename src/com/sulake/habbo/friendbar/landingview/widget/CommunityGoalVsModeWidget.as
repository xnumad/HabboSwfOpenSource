package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;

    public class CommunityGoalVsModeWidget extends CommunityGoalWidget 
    {
        private static const NEEDLE_LEVELS:Array = [-3, -2, -1, 0, 1, 2, 3];
        private static const NEEDLE_FRAMES:Array = [0, 0, 4.75, 11.5, 16.25, 23, 23];

        public function CommunityGoalVsModeWidget(k:HabboLandingView, _arg_2:Boolean=false)
        {
            super(k, _arg_2);
        }

        override protected function getCurrentNeedleFrame():int
        {
            if (communityProgress.communityHighestAchievedLevel <= NEEDLE_LEVELS[0])
            {
                return int(Math.round(NEEDLE_FRAMES[0]));
            }
            if (communityProgress.communityHighestAchievedLevel >= NEEDLE_LEVELS[(NEEDLE_LEVELS.length - 1)])
            {
                return int(Math.round(NEEDLE_FRAMES[(NEEDLE_LEVELS.length - 1)]));
            }
            var k:int = ((communityProgress.scoreRemainingUntilNextLevel < 0) ? -1 : 1);
            var _local_2:int = communityProgress.communityHighestAchievedLevel;
            var _local_3:Number = NEEDLE_FRAMES[NEEDLE_LEVELS.indexOf(_local_2)];
            var _local_4:Number = Math.abs((NEEDLE_FRAMES[NEEDLE_LEVELS.indexOf((_local_2 + k))] - NEEDLE_FRAMES[NEEDLE_LEVELS.indexOf(_local_2)]));
            return Math.round((_local_3 + (((communityProgress.percentCompletionTowardsNextLevel / 100) * _local_4) * k)));
        }

        override public function update(k:uint):void
        {
            updateMeter(Math.floor(this.getCurrentNeedleFrame()), false);
        }

        override public function initialize():void
        {
            super.initialize();
            _communityGoalContainer.findChildByName("community_total_status").visible = false;
        }
    }
}
