package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.help.guidehelp.HelpController;
    import com.sulake.habbo.help.guidehelp.GuideSessionController;
    import flash.utils.Timer;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
    import flash.events.TimerEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.data.PendingGuideTicket;
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
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(this.onRoomEnter));
        }

        public function get habboHelp():HabboHelp
        {
            return this._habboHelp;
        }

        private function onRoomEnter(k:IMessageEvent):void
        {
            if (((((this._habboHelp._Str_19829) && (this._habboHelp.newIdentity)) && (!(this._seenTourPopupDuringSession))) && (!(this._habboHelp.sessionDataManager.isRealNoob))))
            {
                this._popupTimer = new Timer(this.getTourPopupDelay(), 1);
                this._popupTimer.addEventListener(TimerEvent.TIMER, this.onTourPopup);
                this._popupTimer.start();
                this._habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.create", "", this.getTourPopupDelay());
                this._habboHelp.trackGoogle("newbieTourWindow", "timer_popupCreated");
            }
        }

        private function onTourPopup(k:TimerEvent):void
        {
            if (this._disposed)
            {
                return;
            }
            this._habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.show", "", this.getTourPopupDelay());
            this._habboHelp.trackGoogle("newbieTourWindow", "timer_popupShown");
            this.openTourPopup();
        }

        public function openTourPopup():void
        {
            this._guideHelpController.openTourPopup();
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

        public function showGuideTool():void
        {
            this._guideSessionController.showGuideTool();
        }

        public function showPendingTicket(k:PendingGuideTicket):void
        {
            this._guideHelpController.showPendingTicket(k);
        }

        public function createHelpRequest(k:uint):void
        {
            this._guideSessionController.createHelpRequest(k);
        }

        public function openReportWindow():void
        {
            this._guideSessionController.openReportWindow();
        }

        public function showFeedback(k:String):void
        {
            this._chatReviewReporterFeedbackCtrl.show(k);
        }

        private function getTourPopupDelay():int
        {
            return this._habboHelp.getInteger("guide.help.new.user.tour.popup.delay", 30) * 1000;
        }

        public function onHabboToolbarEvent(k:HabboToolbarEvent):void
        {
            if (k.type == HabboToolbarEvent.HTE_TOOLBAR_CLICK)
            {
                switch (k.iconId)
                {
                    case HabboToolbarIconEnum.HELP:
                        this._habboHelp.toggleNewHelpWindow();
                        return;
                    case HabboToolbarIconEnum.GUIDE:
                        this.showGuideTool();
                        return;
                }
            }
        }
    }
}
