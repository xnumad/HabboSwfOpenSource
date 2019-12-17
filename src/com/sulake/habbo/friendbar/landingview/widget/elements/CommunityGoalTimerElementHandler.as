package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgressMessageEvent;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_4438;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgress;

    public class CommunityGoalTimerElementHandler extends AbstractTimerElementHandler 
    {
        override public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(k, _arg_2, _arg_3, _arg_4);
            k.communicationManager.addHabboConnectionMessageEvent(new CommunityGoalProgressMessageEvent(this._Str_5286));
        }

        override public function refresh():void
        {
            landingView.send(new _Str_4438());
        }

        private function _Str_5286(k:CommunityGoalProgressMessageEvent):void
        {
            var _local_2:CommunityGoalProgress = k.getParser().data;
            _Str_14169(((_local_2._Str_13028) ? 0 : _local_2._Str_24637));
        }
    }
}
