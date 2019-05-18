package com.sulake.habbo.help.guidehelp
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.help.HabboHelp;
    import com.sulake.habbo.help.GuideHelpManager;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.help.enum._Str_2849;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.outgoing._Str_84._Str_3719;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import flash.utils.getTimer;
    import com.sulake.habbo.window.widgets._Str_5483;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.habbo.communication.messages.parser.help.data._Str_5959;

    public class HelpController implements IDisposable 
    {
        private var _habboHelp:HabboHelp;
        private var _guideHelp:GuideHelpManager;
        private var _disposed:Boolean = false;
        private var _helpDialog:_Str_2784;
        private var _tourPopup:IWindowContainer;
        private var _tourPopupShowTime:int;
        private var _pendingRequestWindow:IWindowContainer;

        public function HelpController(k:GuideHelpManager)
        {
            this._habboHelp = k._Str_2602;
            this._guideHelp = k;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this.closeWindow();
            this._Str_13765();
            this._habboHelp = null;
            this._guideHelp = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_2826():void
        {
            if (((this._helpDialog == null) && (!(this.disposed))))
            {
                this._helpDialog = this._guideHelp._Str_2602._Str_4804("main_help");
                this._helpDialog._Str_2429.procedure = this._Str_18394;
            }
        }

        public function closeWindow():void
        {
            if (this._helpDialog != null)
            {
                this._helpDialog.dispose();
                this._helpDialog = null;
            }
        }

        private function _Str_18394(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:ICheckBoxWindow;
            if (((this.disposed) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this.closeWindow();
                    return;
                case "tour_button":
                    this._guideHelp._Str_6255(((this._habboHelp._Str_7478) ? _Str_2849._Str_4268 : _Str_2849._Str_4749));
                    this._habboHelp.trackGoogle("helpWindow", "click_userTour");
                    this.closeWindow();
                    return;
                case "bully_button":
                    this.closeWindow();
                    this._habboHelp._Str_14807();
                    this._habboHelp.trackGoogle("helpWindow", "click_reportBully");
                    return;
                case "instructions_button":
                    this._guideHelp._Str_6255(_Str_2849._Str_7052);
                    this._habboHelp.trackGoogle("helpWindow", "click_instructions");
                    this.closeWindow();
                    return;
                case "self_help_link":
                    HabboWebTools.openWebPage(this._habboHelp.getProperty("zendesk.url"), "habboMain");
                    this._habboHelp.trackGoogle("helpWindow", "click_selfHelp");
                    this.closeWindow();
                    return;
                case "habboway_link":
                    if (this._habboHelp.getBoolean("habboway.enabled"))
                    {
                        this._habboHelp.showHabboWay();
                    }
                    else
                    {
                        HabboWebTools.openWebPage(this._habboHelp.getProperty("habboway.url"), "habboMain");
                    }
                    this._habboHelp.trackGoogle("helpWindow", "click_habboWay");
                    this.closeWindow();
                    return;
                case "safetybooklet_link":
                    this._habboHelp._Str_8723();
                    this._habboHelp.trackGoogle("helpWindow", "click_showSafetyBooklet");
                    this.closeWindow();
                    return;
                case "emergency_button":
                    _local_3 = (IWindowContainer(this._helpDialog._Str_2429).findChildByName("leave_room") as ICheckBoxWindow);
                    if (((!(_local_3 == null)) && (_local_3._Str_2365)))
                    {
                        this._habboHelp._Str_2488(new _Str_3719());
                    }
                    this.closeWindow();
                    this._habboHelp._Str_22356();
                    this._habboHelp.trackGoogle("helpWindow", "click_emergency");
                    return;
            }
        }

        public function _Str_15702():void
        {
            if (((this._tourPopup == null) && (!(this.disposed))))
            {
                this._tourPopupShowTime = getTimer();
                this._tourPopup = (this._guideHelp._Str_2602.getXmlWindow("welcome_tour_popup") as IWindowContainer);
                this._tourPopup.center();
                this._tourPopup.y = (this._tourPopup.y * 0.25);
                this._tourPopup.procedure = this._Str_23264;
            }
        }

        private function _Str_13765():void
        {
            if (this._tourPopup != null)
            {
                this._tourPopup.dispose();
                this._tourPopup = null;
            }
        }

        private function _Str_23264(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((this.disposed) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            var _local_3:int = int(((this._tourPopupShowTime - getTimer()) / 1000));
            switch (_arg_2.name)
            {
                case "refuse_tour":
                    this._habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.cancel", "", _local_3);
                    this._habboHelp.trackGoogle("newbieTourWindow", "click_refuseTour");
                    this._Str_13765();
                    return;
                case "header_button_close":
                    this._habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.dismiss", "", _local_3);
                    this._habboHelp.trackGoogle("newbieTourWindow", "click_closeWindow");
                    this._Str_13765();
                    return;
                case "take_tour":
                    this._guideHelp._Str_6255(_Str_2849._Str_4268);
                    this._habboHelp.tracking.trackEventLog("Help", "", "tour.new_user.accept", "", _local_3);
                    this._habboHelp.trackGoogle("newbieTourWindow", "click_acceptTour");
                    this._Str_13765();
                    return;
            }
        }

        public function _Str_17964(k:_Str_5959):void
        {
            var _local_2:String;
            if (k._Str_17256)
            {
                _local_2 = "pending_guide_session";
            }
            else
            {
                switch (k.type)
                {
                    case _Str_2849._Str_4268:
                    case _Str_2849._Str_4749:
                        _local_2 = "pending_tour_request";
                        break;
                    case _Str_2849._Str_7052:
                        _local_2 = "pending_instructions_request";
                        break;
                    case _Str_2849._Str_8260:
                        _local_2 = "pending_bully_request";
                        break;
                    default:
                        return;
                }
            }
            this._pendingRequestWindow = (this._habboHelp.getXmlWindow(_local_2) as IWindowContainer);
            this._pendingRequestWindow.center();
            this._pendingRequestWindow.procedure = this._Str_18728;
            if (k._Str_17256)
            {
                return;
            }
            switch (k.type)
            {
                case _Str_2849._Str_7052:
                    this._pendingRequestWindow.findChildByName("description").caption = k.description;
                    _Str_5483(IWidgetWindow(this._pendingRequestWindow.findChildByName("timestamp")).widget).timeStamp = (new Date().getTime() - (k._Str_20952 * 1000));
                    return;
                case _Str_2849._Str_8260:
                    this._pendingRequestWindow.findChildByName("user_name").caption = k._Str_25260;
                    _Str_2483(IWidgetWindow(this._pendingRequestWindow.findChildByName("user_avatar")).widget).figure = k._Str_25026;
                    _Str_5483(IWidgetWindow(this._pendingRequestWindow.findChildByName("timestamp")).widget).timeStamp = (new Date().getTime() - (k._Str_20952 * 1000));
                    this._habboHelp.localization.registerParameter("guide.pending.bully.room", "room", k.roomName);
                    return;
            }
        }

        private function _Str_18728(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                    case "close_button":
                        if (((!(this._pendingRequestWindow == null)) && (!(this._pendingRequestWindow.disposed))))
                        {
                            this._pendingRequestWindow.dispose();
                            this._pendingRequestWindow = null;
                        }
                        return;
                }
            }
        }
    }
}
