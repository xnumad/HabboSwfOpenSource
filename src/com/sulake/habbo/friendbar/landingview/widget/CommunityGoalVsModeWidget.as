package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;

    public class CommunityGoalVsModeWidget extends CommunityGoalWidget 
    {
        private static const _Str_5698:Array = [-3, -2, -1, 0, 1, 2, 3];
        private static const _Str_7755:Array = [0, 0, 4.75, 11.5, 16.25, 23, 23];

        public function CommunityGoalVsModeWidget(k:HabboLandingView, _arg_2:Boolean=false)
        {
            super(k, _arg_2);
        }

        override protected function getCurrentNeedleFrame():int
        {
            if (_Str_6672.communityHighestAchievedLevel <= _Str_5698[0])
            {
                return int(Math.round(_Str_7755[0]));
            }
            if (_Str_6672.communityHighestAchievedLevel >= _Str_5698[(_Str_5698.length - 1)])
            {
                return int(Math.round(_Str_7755[(_Str_5698.length - 1)]));
            }
            var k:int = ((_Str_6672.scoreRemainingUntilNextLevel < 0) ? -1 : 1);
            var _local_2:int = _Str_6672.communityHighestAchievedLevel;
            var _local_3:Number = _Str_7755[_Str_5698.indexOf(_local_2)];
            var _local_4:Number = Math.abs((_Str_7755[_Str_5698.indexOf((_local_2 + k))] - _Str_7755[_Str_5698.indexOf(_local_2)]));
            return Math.round((_local_3 + (((_Str_6672.percentCompletionTowardsNextLevel / 100) * _local_4) * k)));
        }

        override public function update(k:uint):void
        {
            _Str_17006(Math.floor(this.getCurrentNeedleFrame()), false);
        }

        override public function initialize():void
        {
            super.initialize();
            _Str_3186.findChildByName("community_total_status").visible = false;
        }
    }
}
