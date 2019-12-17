package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IFloatingElement;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.ILayoutNameProvider;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IDisableAwareElement;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgressMessageEvent;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_5046;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_4438;
    import com.sulake.habbo.communication.messages.incoming.quest.CommunityGoalProgress;

    public class CommunityGoalScoreCounterElementHandler implements IElementHandler, IDisposable, IFloatingElement, ILayoutNameProvider, IDisableAwareElement 
    {
        private var _landingView:HabboLandingView;
        private var _window:IWindowContainer;
        private var _floating:Boolean;
        private var _pollTimer:Timer;
        private var _counter_initialized:Boolean;


        public function dispose():void
        {
            if (this._landingView)
            {
                this._landingView.communicationManager.removeHabboConnectionMessageEvent(new CommunityGoalProgressMessageEvent(this._Str_5286));
                this._landingView = null;
            }
            if (this._pollTimer)
            {
                this._pollTimer.stop();
                this._pollTimer.removeEventListener(TimerEvent.TIMER, this._Str_10015);
                this._pollTimer = null;
            }
            this._window = null;
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            this._landingView = k;
            this._window = IWindowContainer(_arg_2);
            var _local_5:int = _arg_3[1];
            var _local_6:int = _arg_3[2];
            var _local_7:int = _arg_3[3];
            this._floating = (_arg_3[4] == "true");
            var _local_8:IWidgetWindow = IWidgetWindow(this._window.findChildByName("running_number_widget"));
            var _local_9:_Str_5046 = _Str_5046(_local_8.widget);
            _local_9._Str_4056 = _local_5;
            _local_9._Str_9087 = _local_6;
            if (this._floating)
            {
                this._window.x = int(_arg_3[5]);
                this._window.y = int(_arg_3[6]);
            }
            this._landingView.communicationManager.addHabboConnectionMessageEvent(new CommunityGoalProgressMessageEvent(this._Str_5286));
            this._pollTimer = new Timer(_local_7);
            this._pollTimer.addEventListener(TimerEvent.TIMER, this._Str_10015);
        }

        public function disable():void
        {
            this._pollTimer.stop();
        }

        public function refresh():void
        {
            this._landingView.send(new _Str_4438());
            this._counter_initialized = false;
            this._pollTimer.start();
        }

        public function _Str_7806(k:Boolean):Boolean
        {
            return this._floating;
        }

        public function get layoutName():String
        {
            return "element_community_goal_score";
        }

        private function _Str_5286(k:CommunityGoalProgressMessageEvent):void
        {
            var _local_2:CommunityGoalProgress;
            var _local_3:IWidgetWindow;
            var _local_4:_Str_5046;
            if (this._landingView)
            {
                _local_2 = k.getParser().data;
                _local_3 = IWidgetWindow(this._window.findChildByName("running_number_widget"));
                _local_4 = _Str_5046(_local_3.widget);
                if (this._counter_initialized)
                {
                    _local_4.number = _local_2._Str_12030;
                }
                else
                {
                    _local_4._Str_19520 = _local_2._Str_12030;
                    this._counter_initialized = true;
                }
            }
        }

        private function _Str_10015(k:TimerEvent):void
        {
            this._landingView.send(new _Str_4438());
        }
    }
}
