package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.incoming.quest.ConcurrentUsersGoalProgressMessageEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_8012;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_11277;

    public class ConcurrentUsersInfoElementHandler implements IElementHandler, IDisposable 
    {
        private static const _Str_5992:int = 0;
        private static const _Str_4158:int = 1;
        private static const _Str_17668:int = 2;
        private static const _Str_17429:int = 3;
        private static const _Str_9724:int = 5000;

        private var _landingView:HabboLandingView;
        private var _widget:GenericWidget;
        private var _localizationKey:String;
        private var _state:int = -1;
        private var _userCount:int = -1;
        private var _userCountGoal:int = -1;
        private var _window:IWindowContainer;
        private var _updateTimer:Timer;
        private var _isDisposed:Boolean = false;

        public function ConcurrentUsersInfoElementHandler()
        {
            this._updateTimer = new Timer(_Str_9724);
            this._updateTimer.addEventListener(TimerEvent.TIMER, this._Str_11704);
        }

        private function _Str_11704(k:TimerEvent):void
        {
            if ((((this._window == null) || (this._window.visible == false)) || (!(this._landingView._Str_24563))))
            {
                return;
            }
            this.refresh();
        }

        public function dispose():void
        {
            if (this._updateTimer)
            {
                this._updateTimer.stop();
            }
            this._updateTimer = null;
            this._isDisposed = true;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            this._widget = _arg_4;
            this._landingView = k;
            this._window = (_arg_2 as IWindowContainer);
            this._localizationKey = _arg_3[1];
            this._window.findChildByName("users_desc").caption = (("${" + this._localizationKey) + "}");
            var _local_5:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(this._window.findChildByName("badge_image"));
            var _local_6:String = ((_arg_3.length > 2) ? _arg_3[2] : "ConcurrentUsersReward");
            var _local_7:* = (("${image.library.url}album1584/" + _local_6) + ".gif");
            _local_5.assetUri = _local_7;
            this._Str_5681();
            _arg_2.procedure = this._Str_17374;
            k.communicationManager.addHabboConnectionMessageEvent(new ConcurrentUsersGoalProgressMessageEvent(this._Str_16345));
            this._updateTimer.start();
        }

        public function refresh():void
        {
            this._landingView.send(new _Str_8012());
        }

        private function _Str_5681():void
        {
            var k:String = "landing.view.concurrentusers.caption";
            var _local_2:String = "landing.view.concurrentusers.bodytext";
            this._landingView.windowManager.registerLocalizationParameter(this._localizationKey, "userCount", this._userCount.toString());
            this._landingView.windowManager.registerLocalizationParameter(this._localizationKey, "userGoal", this._userCountGoal.toString());
            this._landingView.windowManager.registerLocalizationParameter("landing.view.concurrentusers.bodytext", "userCount", this._userCount.toString());
            this._landingView.windowManager.registerLocalizationParameter("landing.view.concurrentusers.bodytext", "userGoal", this._userCountGoal.toString());
            this._landingView.windowManager.registerLocalizationParameter("landing.view.concurrentusers.bodytext", "domain", this._landingView.localizationManager.getLocalization("landing.view.hotel.domain", "Habbo"));
            switch (this._state)
            {
                case _Str_5992:
                    this._window.findChildByName("state.active").visible = true;
                    this._window.findChildByName("state.achieved").visible = false;
                    break;
                case _Str_4158:
                    this._window.findChildByName("state.active").visible = true;
                    this._window.findChildByName("state.achieved").visible = false;
                    break;
                case _Str_17668:
                    if (this._updateTimer)
                    {
                        this._updateTimer.stop();
                    }
                    k = (k + ".success");
                    _local_2 = (_local_2 + ".success");
                    this._window.findChildByName("state.active").visible = false;
                    this._window.findChildByName("state.active").enable();
                    this._window.findChildByName("state.achieved").visible = true;
                    this._window.findChildByName("action_button").visible = true;
                    break;
                case _Str_17429:
                    if (this._updateTimer)
                    {
                        this._updateTimer.stop();
                    }
                    k = (k + ".success");
                    _local_2 = (_local_2 + ".success");
                    this._window.findChildByName("state.active").visible = false;
                    this._window.findChildByName("state.achieved").visible = true;
                    this._window.findChildByName("action_button").visible = false;
                    break;
            }
            var _local_3:TextElementHandler = (this._widget._Str_19931("bodytext") as TextElementHandler);
            if (_local_3)
            {
                _local_3._Str_14499 = _local_2;
            }
            var _local_4:TextElementHandler = (this._widget._Str_19931("caption") as TextElementHandler);
            if (_local_4)
            {
                _local_4._Str_14499 = k;
            }
        }

        private function _Str_16345(k:ConcurrentUsersGoalProgressMessageEvent):void
        {
            this._state = k.getParser().state;
            this._userCount = k.getParser().userCount;
            this._userCountGoal = k.getParser()._Str_21827;
            this._Str_5681();
        }

        private function _Str_17374(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.onClick();
            }
        }

        protected function onClick():void
        {
            this._landingView.send(new _Str_11277());
            this._landingView.send(new _Str_8012());
            this._window.findChildByName("state.active").disable();
        }
    }
}
