package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.help.guidehelp.HelpController;
    import com.sulake.habbo.help.guidehelp.GuideSessionController;
    import flash.utils.Timer;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import flash.events.TimerEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.data._Str_5959;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;

    public class GuideHelpManager implements IDisposable 
    {
        private var _habboHelp:HabboHelp;
        private var _guideHelpController:HelpController;
        private var _guideSessionController:GuideSessionController;
        private var _chatReviewReporterFeedbackCtrl:ChatReviewReporterFeedbackCtrl;
        private var _disposed:Boolean = false;
        private var _seenTourPopupDuringSession:Boolean;
        private var _panicRoomId:int;
        private var _panicRoomName:String;
        private var _popupTimer:Timer;

        public function GuideHelpManager(k:HabboHelp)
        {
            this._habboHelp = k;
            this._guideHelpController = new HelpController(this);
            this._guideSessionController = new GuideSessionController(this);
            this._chatReviewReporterFeedbackCtrl = new ChatReviewReporterFeedbackCtrl(this._habboHelp);
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_2752(this.onCreditBalance));
        }

        public function get _Str_2602():HabboHelp
        {
            return this._habboHelp;
        }

        private function onCreditBalance(k:IMessageEvent):void
        {
            if (((((this._habboHelp._Str_19829) && (this._habboHelp._Str_7478)) && (!(this._seenTourPopupDuringSession))) && (!(this._habboHelp.sessionDataManager.isAnyRoomController))))
            {
                this._popupTimer = new Timer(this._Str_17155(), 1);
                this._popupTimer.addEventListener(TimerEvent.TIMER, this._Str_22650);
                this._popupTimer.start();
                this._habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.create", "", this._Str_17155());
                this._habboHelp.trackGoogle("newbieTourWindow", "timer_popupCreated");
            }
        }

        private function _Str_22650(k:TimerEvent):void
        {
            if (this._disposed)
            {
                return;
            }
            this._habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.show", "", this._Str_17155());
            this._habboHelp.trackGoogle("newbieTourWindow", "timer_popupShown");
            this._Str_15702();
        }

        public function _Str_15702():void
        {
            this._guideHelpController._Str_15702();
            this._seenTourPopupDuringSession = true;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._guideHelpController)
            {
                this._guideHelpController.dispose();
                this._guideHelpController = null;
            }
            if (this._guideSessionController)
            {
                this._guideSessionController.dispose();
                this._guideSessionController = null;
            }
            if (this._chatReviewReporterFeedbackCtrl)
            {
                this._chatReviewReporterFeedbackCtrl.dispose();
                this._chatReviewReporterFeedbackCtrl = null;
            }
            if (this._popupTimer)
            {
                this._popupTimer.reset();
                this._popupTimer = null;
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_18976():void
        {
            this._guideSessionController._Str_18976();
        }

        public function _Str_17964(k:_Str_5959):void
        {
            this._guideHelpController._Str_17964(k);
        }

        public function _Str_6255(k:uint):void
        {
            this._guideSessionController._Str_6255(k);
        }

        public function _Str_18954():void
        {
            this._guideSessionController._Str_18954();
        }

        public function _Str_22714(k:String):void
        {
            this._chatReviewReporterFeedbackCtrl.show(k);
        }

        private function _Str_17155():int
        {
            return this._habboHelp.getInteger("guide.help.new.user.tour.popup.delay", 30) * 1000;
        }

        public function _Str_3304(k:HabboToolbarEvent):void
        {
            if (k.type == HabboToolbarEvent.HTE_TOOLBAR_CLICK)
            {
                switch (k._Str_3378)
                {
                    case HabboToolbarIconEnum.HELP:
                        this._habboHelp._Str_14807();
                        return;
                    case HabboToolbarIconEnum.GUIDE:
                        this._Str_18976();
                        return;
                }
            }
        }
    }
}
