package com.sulake.habbo.help.guidehelp
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.widgets._Str_5480;
    import com.sulake.habbo.help.HabboHelp;
    import com.sulake.habbo.help.GuideHelpManager;
    import com.sulake.core.window.IWindowContainer;
    import flash.geom.Point;
    import com.sulake.core.window.components.IWidgetWindow;
    import flash.utils.Timer;
    import __AS3__.vec.Vector;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionAttachedEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionDetachedEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionStartedEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionEndedEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionRequesterRoomEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionInvitedToGuideRoomEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionPartnerIsTypingEvent;
    import com.sulake.habbo.communication.messages.incoming.perk._Str_3277;
    import com.sulake.habbo.communication.messages.incoming.help._Str_8903;
    import com.sulake.habbo.communication.messages.incoming.help._Str_8747;
    import com.sulake.habbo.communication.messages.incoming.help._Str_9097;
    import com.sulake.habbo.communication.messages.incoming.help._Str_8464;
    import com.sulake.habbo.communication.messages.incoming.help._Str_9409;
    import com.sulake.habbo.communication.messages.incoming.help._Str_10860;
    import com.sulake.habbo.communication.messages.parser.help._Str_4393;
    import com.sulake.habbo.help.enum._Str_2849;
    import com.sulake.habbo.help.enum.GuideSessionStateEnum;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7293;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_4553;
    import com.sulake.habbo.communication.messages.parser.help._Str_7652;
    import com.sulake.habbo.communication.messages.parser.help._Str_6404;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionStartedMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionEndedMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionErrorMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionRequesterRoomMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionInvitedToGuideRoomMessageParser;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionPartnerIsTypingMessageParser;
    import com.sulake.habbo.communication.messages.parser.perk.PerkAllowancesMessageParser;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.habbo.communication.messages.parser.help._Str_7083;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.messages.parser.help._Str_7534;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2863;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.session.talent.TalentEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_364._Str_3075;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.sound.HabboSoundConstants;
    import com.sulake.habbo.window.widgets._Str_2961;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7016;
    import com.sulake.habbo.window.widgets._Str_2789;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7364;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_10522;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_7077;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_4434;
    import mx.utils.StringUtil;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_10003;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_8134;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_4981;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_5876;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_11135;
    import com.sulake.habbo.window.widgets._Str_3904;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_11187;
    import com.sulake.habbo.communication.messages.outgoing.help._Str_11748;
    import __AS3__.vec.*;

    public class GuideSessionController implements IDisposable, _Str_5480 
    {
        private static const _Str_12638:int = 0;
        private static const _Str_14376:int = 1;
        private static const _Str_13767:int = 2;
        private static const _Str_13522:int = 0;
        private static const _Str_13205:int = 1;
        private static const _Str_7012:int = 2;
        private static const _Str_17188:int = -1;
        private static const _Str_10084:int = 0;
        private static const _Str_9791:int = 1;
        private static const _Str_10906:int = 2;
        private static const _Str_18329:int = 3000;
        private static const _Str_16534:int = 500;
        private static const _Str_6777:Array = ["waiting", "ok", "bad", "very_bad", "refused", "searching"];
        private static const _Str_17966:Array = ["waiting", "ok", "bad", "very_bad", "inconclusive", "searching"];
        private static const _Str_10603:String = "${guide.bully.request.guide.results.outcome.";
        private static const HELP_CHAT_REVIEW_DECISION_:String = "help_chat_review_decision_";

        private var _habboHelp:HabboHelp;
        private var _guideHelp:GuideHelpManager;
        private var _window:IWindowContainer;
        private var _reportWindow:IWindowContainer;
        private var _sessionData:GuideSessionData;
        private var _windowPosition:Point;
        private var _onDuty:Boolean = false;
        private var _handleHelperRequests:Boolean;
        private var _handleGuardianRequests:Boolean;
        private var _handleGuideRequests:Boolean;
        private var _resubmitDescription:Boolean = false;
        private var _chatMsg:IWidgetWindow;
        private var _chatMsgNotification:IWindowContainer;
        private var _chatMsgReminder:IWindowContainer;
        private var _disposed:Boolean = false;
        private var _typingTimer:Timer;
        private var _lastMessageTypedLength:int;
        private var _lastTypingInfo:Boolean;
        private var _waitingAnimationTimer:Timer;
        private var _waitingAnimationData:Vector.<AnimationData>;
        private var _idleCheckTimer:Timer;
        private var _idleCheckLastActivity:int;

        public function GuideSessionController(k:GuideHelpManager)
        {
            this._windowPosition = new Point(120, 80);
            super();
            this._habboHelp = k._Str_2602;
            this._guideHelp = k;
            this._sessionData = new GuideSessionData();
            this._chatMsg = IWidgetWindow(this._habboHelp.getXmlWindow("chat_msg"));
            this._chatMsgNotification = IWindowContainer(this._habboHelp.getXmlWindow("chat_msg_notification"));
            this._chatMsgReminder = IWindowContainer(this._habboHelp.getXmlWindow("chat_msg_reminder"));
            this._handleHelperRequests = this._habboHelp.getBoolean("guidetool.handle.help_requests");
            this._handleGuardianRequests = this._habboHelp.getBoolean("guidetool.handle.chat_reviews");
            this._handleGuideRequests = this._habboHelp.getBoolean("guidetool.handle.tour_requests");
            this._habboHelp.context.displayObjectContainer.stage.addEventListener(MouseEvent.MOUSE_MOVE, this._Str_3983);
            this._waitingAnimationData = new Vector.<AnimationData>();
            this._waitingAnimationTimer = new Timer(_Str_16534);
            this._waitingAnimationTimer.addEventListener(TimerEvent.TIMER, this._Str_22173);
            this._waitingAnimationTimer.start();
            this._idleCheckLastActivity = getTimer();
            this._idleCheckTimer = new Timer(5000);
            this._idleCheckTimer.addEventListener(TimerEvent.TIMER, this._Str_19672);
            this._idleCheckTimer.start();
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideSessionAttachedEvent(this.onGuideSessionAttached));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideSessionDetachedEvent(this.onGuideSessionDetached));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideSessionStartedEvent(this.onGuideSessionStarted));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideSessionEndedEvent(this.onGuideSessionEnded));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideSessionErrorEvent(this.onGuideSessionError));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideSessionEvent(this.onGuideSessionMessage));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideSessionRequesterRoomEvent(this.onGuideSessionRequesterRoom));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideSessionInvitedToGuideRoomEvent(this.onGuideSessionInvitedToGuideRoom));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new GuideSessionPartnerIsTypingEvent(this.onGuideSessionPartnerIsTyping));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_3277(this.onPerkAllowances));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_8903(this._window9));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_8747(this._Str_23266));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_9097(this._Str_24700));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_8464(this._Str_24456));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_9409(this._Str_22443));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_10860(this._Str_25179));
        }

        private static function _Str_13055(k:int):int
        {
            var _local_2:int = _Str_4393._Str_14199;
            switch (k)
            {
                case _Str_10084:
                    _local_2 = _Str_4393._Str_18915;
                    break;
                case _Str_9791:
                    _local_2 = _Str_4393._Str_16095;
                    break;
                case _Str_10906:
                    _local_2 = _Str_4393._Str_16785;
                    break;
                case _Str_17188:
                    _local_2 = _Str_4393._Str_17026;
                    break;
            }
            return _local_2;
        }


        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._idleCheckTimer != null)
            {
                this._idleCheckTimer.stop();
                this._idleCheckTimer.removeEventListener(TimerEvent.TIMER, this._Str_19672);
                this._idleCheckTimer = null;
            }
            if (this._waitingAnimationTimer != null)
            {
                this._waitingAnimationTimer.stop();
                this._waitingAnimationTimer.removeEventListener(TimerEvent.TIMER, this._Str_22173);
                this._waitingAnimationTimer = null;
            }
            this._waitingAnimationData = null;
            if (this._chatMsg)
            {
                this._chatMsg.dispose();
                this._chatMsg = null;
            }
            if (this._chatMsgNotification)
            {
                this._chatMsgNotification.dispose();
                this._chatMsgNotification = null;
            }
            this.closeWindow();
            this._sessionData = null;
            this._windowPosition = null;
            this._guideHelp = null;
            if ((((this._habboHelp) && (this._habboHelp.context)) && (this._habboHelp.context.displayObjectContainer)))
            {
                this._habboHelp.context.displayObjectContainer.stage.removeEventListener(MouseEvent.MOUSE_MOVE, this._Str_3983);
            }
            this._habboHelp = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_6255(k:uint):void
        {
            if (this._sessionData._Str_15842())
            {
                Logger.log("Can't create a new help request while another help request is ongoing");
                return;
            }
            if (((k == _Str_2849._Str_4268) || (k == _Str_2849._Str_4749)))
            {
                this._sessionData._Str_17222 = GuideSessionData._Str_11013;
                this._sessionData._Str_3201 = GuideSessionStateEnum.USER_CREATE;
                this._sessionData._Str_3989 = k;
                this._habboHelp._Str_2488(new _Str_7293(k, this._habboHelp.localization.getLocalization("guide.help.request.tour.description")));
            }
            else
            {
                this._Str_22204(k);
            }
        }

        public function _Str_18976():void
        {
            this._habboHelp._Str_2488(new _Str_4553(this._onDuty, this._handleGuideRequests, this._handleHelperRequests, this._handleGuardianRequests));
        }

        private function _window9(k:_Str_8903):void
        {
            var _local_2:_Str_7652 = k.getParser();
            this._onDuty = _local_2.onDuty;
            this._habboHelp.localization.registerParameter("guide.help.guide.tool.guidesonduty", "amount", _local_2._Str_24740.toString());
            this._habboHelp.localization.registerParameter("guide.help.guide.tool.helpersonduty", "amount", _local_2._Str_25148.toString());
            this._habboHelp.localization.registerParameter("guide.help.guide.tool.guardiansonduty", "amount", _local_2._Str_24092.toString());
            this._Str_20372();
        }

        private function onGuideSessionAttached(k:IMessageEvent):void
        {
            Logger.log("onGuideSessionAttached");
            if (((this._disposed) || (!(this._sessionData))))
            {
                Logger.log("_diposed or no _sessionData");
                return;
            }
            var _local_2:_Str_6404 = (k.parser as _Str_6404);
            if (_local_2._Str_23343)
            {
                if (this._sessionData._Str_5908())
                {
                    this._Str_17548();
                    return;
                }
                this._Str_22481(_local_2._Str_20566, _local_2._Str_19914, _local_2._Str_19737);
            }
            else
            {
                if (!this._sessionData._Str_5935())
                {
                    this._Str_17548();
                    return;
                }
                this._window8(_local_2._Str_20566, _local_2._Str_19914, _local_2._Str_19737);
            }
        }

        private function onGuideSessionDetached(k:IMessageEvent):void
        {
            var _local_2:int;
            var _local_3:String;
            Logger.log("onGuideSessionDetached");
            if (this._disposed)
            {
                return;
            }
            if (this._resubmitDescription)
            {
                _local_2 = this._sessionData._Str_3989;
                _local_3 = this._sessionData._Str_8937;
                this._Str_20660();
                this._Str_22204(_local_2, _local_3);
            }
            else
            {
                if (((this._sessionData._Str_5935()) && (this._sessionData._Str_3201 == GuideSessionStateEnum.USER_FEEDBACK)))
                {
                    this._Str_22593();
                }
                else
                {
                    this._Str_4260(true);
                }
            }
        }

        private function onGuideSessionStarted(k:IMessageEvent):void
        {
            Logger.log("onGuideSessionStarted");
            if (this._disposed)
            {
                return;
            }
            var _local_2:GuideSessionStartedMessageParser = (k.parser as GuideSessionStartedMessageParser);
            this._sessionData.userId = _local_2.requesterUserId;
            this._sessionData.userName = _local_2.requesterName;
            this._sessionData._Str_7586 = _local_2.requesterFigure;
            this._sessionData._Str_5587 = _local_2.guideUserId;
            this._sessionData.guideName = _local_2.guideName;
            this._sessionData.guideFigure = _local_2.guideFigure;
            this._lastTypingInfo = false;
            if (this._sessionData._Str_5908())
            {
                this._Str_24192();
            }
            else
            {
                this._Str_22431();
            }
        }

        private function onGuideSessionEnded(k:IMessageEvent):void
        {
            Logger.log("onGuideSessionEnded");
            if (this._disposed)
            {
                return;
            }
            var _local_2:GuideSessionEndedMessageParser = (k.parser as GuideSessionEndedMessageParser);
            if (this._sessionData._Str_5908())
            {
                this._Str_23339(_local_2.endReason);
            }
            else
            {
                if (_local_2.endReason == GuideSessionData._Str_14462)
                {
                    this._window4();
                }
                else
                {
                    this._Str_23699();
                }
            }
        }

        private function onGuideSessionError(k:GuideSessionErrorEvent):void
        {
            Logger.log("onGuideSessionError");
            if (this._disposed)
            {
                return;
            }
            var _local_2:GuideSessionErrorMessageParser = k.getParser();
            switch (_local_2.errorCode)
            {
                case GuideSessionErrorMessageParser.ERROR_GUIDES_REJECT:
                    this._Str_22553();
                    return;
                case GuideSessionErrorMessageParser.ERROR_NOT_ENOUGH_GUIDES:
                case GuideSessionErrorMessageParser.ERROR_NOT_ENOUGH_VOTES:
                    this._Str_24880("guide.bully.request.error.not_enough_guardians");
                    return;
                default:
                    this._Str_17548();
            }
        }

        private function onGuideSessionMessage(k:IMessageEvent):void
        {
            var _local_4:String;
            var _local_5:String;
            Logger.log("onGuideSessionMessage");
            if ((((this._disposed) || (!(this._sessionData._Str_14646()))) || (this._window == null)))
            {
                return;
            }
            var _local_2:GuideSessionMessageParser = (k.parser as GuideSessionMessageParser);
            var _local_3:int = _local_2.senderId;
            if (_local_3 == this._sessionData._Str_5587)
            {
                _local_4 = this._sessionData.guideName;
                _local_5 = this._sessionData.guideFigure;
            }
            else
            {
                _local_4 = this._sessionData.userName;
                _local_5 = this._sessionData._Str_7586;
            }
            var _local_6:Boolean = true;
            if (((this._sessionData._Str_5908()) && (this._sessionData._Str_5587 == _local_3)))
            {
                _local_6 = false;
            }
            else
            {
                if (((!(this._sessionData._Str_5908())) && (this._sessionData.userId == _local_3)))
                {
                    _local_6 = false;
                }
            }
            this._Str_5863(_local_3, _local_4, _local_5, _local_2._Str_24208, _local_6);
        }

        private function onGuideSessionRequesterRoom(k:IMessageEvent):void
        {
            Logger.log("onGuideSessionRequesterRoom");
            if (((this._disposed) || (!(this._sessionData._Str_14646()))))
            {
                return;
            }
            var _local_2:GuideSessionRequesterRoomMessageParser = (k.parser as GuideSessionRequesterRoomMessageParser);
            if (_local_2.getRequesterRoomId() > 0)
            {
                this._habboHelp.roomSessionManager._Str_10094(_local_2.getRequesterRoomId());
            }
            else
            {
                this._Str_5863(this._sessionData._Str_5587, this._sessionData.guideName, this._sessionData.guideFigure, this._habboHelp.localization.getLocalization("guide.help.request.guide.ongoing.user.not.in.room.error", ""), false, _Str_7012);
            }
        }

        private function onGuideSessionInvitedToGuideRoom(k:IMessageEvent):void
        {
            Logger.log("onGuideSessionInvitedToGuideRoom");
            if ((((this._disposed) || (this._window == null)) || (!(this._sessionData._Str_14646()))))
            {
                return;
            }
            var _local_2:GuideSessionInvitedToGuideRoomMessageParser = (k.parser as GuideSessionInvitedToGuideRoomMessageParser);
            if (this._sessionData._Str_5908())
            {
                if (_local_2.getRoomId() > 0)
                {
                    this._Str_14185(_Str_12638, this._habboHelp.localization.getLocalizationWithParams("guide.help.request.guide.ongoing.error.invite.success", "", "name", this._sessionData.userName));
                }
                else
                {
                    this._Str_14185(_Str_12638, this._habboHelp.localization.getLocalization("guide.help.request.guide.ongoing.error.invite.failed", ""));
                }
            }
            else
            {
                if (_local_2.getRoomId() > 0)
                {
                    this._Str_5863(this._sessionData._Str_5587, this._sessionData.guideName, this._sessionData.guideFigure, this._habboHelp.localization.getLocalizationWithParams("guide.help.request.user.ongoing.visit.guide.request.message", "", "name", this._sessionData.guideName, "roomname", _local_2.getRoomName()), true, _Str_13205, _local_2.getRoomId());
                }
            }
        }

        private function onGuideSessionPartnerIsTyping(k:IMessageEvent):void
        {
            Logger.log("onGuideSessionPartnerIsTyping");
            var _local_2:GuideSessionPartnerIsTypingMessageParser = GuideSessionPartnerIsTypingEvent(k).getParser();
            this._Str_19579(_local_2._Str_7319);
        }

        private function onPerkAllowances(k:_Str_3277):void
        {
            var _local_2:PerkAllowancesMessageParser;
            if (this._sessionData._Str_3201 == GuideSessionStateEnum.GUIDE_TOOL)
            {
                _local_2 = k.getParser();
                if (!_local_2.isPerkAllowed(PerkEnum.USE_GUIDE_TOOL))
                {
                    if (this._onDuty)
                    {
                        this._Str_10865(false);
                        this._habboHelp._Str_2488(new _Str_4553(false, false, false, false));
                    }
                    this._Str_4260(false);
                }
            }
        }

        private function _Str_23266(k:_Str_8747):void
        {
            this._Str_22573(k.getParser()._Str_23730);
        }

        private function _Str_24700(k:_Str_9097):void
        {
            var _local_2:_Str_7083 = k.getParser();
            this._Str_23588(_local_2._Str_23086, _local_2._Str_17106);
        }

        private function _Str_24456(k:_Str_8464):void
        {
            if (this._sessionData._Str_3201 != GuideSessionStateEnum.GUARDIAN_CHAT_REVIEW_WAIT_FOR_RESULTS)
            {
                return;
            }
            this._Str_19514((this._window.findChildByName("results") as IItemListWindow), k.getParser().status);
        }

        private function _Str_22443(k:_Str_9409):void
        {
            var _local_2:_Str_7534 = k.getParser();
            this._Str_22460(_local_2._Str_22263, _local_2._Str_25395, _local_2._Str_24620);
        }

        private function _Str_25179(k:IMessageEvent):void
        {
            this._Str_4260(true);
        }

        private function _Str_20372():void
        {
            var k:IItemListWindow;
            var _local_2:IWindowContainer;
            if (this._sessionData._Str_15842())
            {
                Logger.log("Trying to set state to guide tool, but an active session exists");
                return;
            }
            this._sessionData._Str_3201 = GuideSessionStateEnum.GUIDE_TOOL;
            this._Str_2826(this._Str_21226, true);
            this._Str_13929(this._onDuty);
            this._window.procedure = this._Str_21226;
            this._Str_18493("handle_guardian_tickets", this._handleGuardianRequests);
            this._Str_18493("handle_helper_tickets", this._handleHelperRequests);
            this._Str_18493("handle_guide_tickets", this._handleGuideRequests);
            if (!this._habboHelp.sessionDataManager.isPerkAllowed(PerkEnum.JUDGE_CHAT_REVIEWS))
            {
                k = IItemListWindow(this._window.findChildByName("list"));
                _local_2 = (k.getListItemByName("handle_selection_container") as IWindowContainer);
                _local_2.findChildByName("handle_guardian_tickets").dispose();
                _local_2.findChildByName("selection_separator").y = (_local_2.findChildByName("selection_separator").y - 17);
                _local_2.height = (_local_2.height - 17);
            }
        }

        private function _Str_21226(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:String;
            if ((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.GUIDE_TOOL))))
            {
                return;
            }
            var _local_3:int;
            switch (_arg_2.name)
            {
                case "header_button_close":
                    if (k.type == WindowMouseEvent.CLICK)
                    {
                        this._Str_4260(false);
                    }
                    return;
                case "helper_group_link":
                    if (k.type == WindowMouseEvent.CLICK)
                    {
                        _local_3 = this._habboHelp.getInteger("guide.help.alpha.groupid", 0);
                        if (_local_3 > 0)
                        {
                            this._habboHelp._Str_2488(new _Str_2863(_local_3, true));
                            this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_groupProfile"));
                        }
                    }
                    return;
                case "guide_forum_link":
                    if (k.type == WindowMouseEvent.CLICK)
                    {
                        _local_3 = this._habboHelp.getInteger("guide.help.alpha.groupid", 0);
                        if (_local_3 > 0)
                        {
                            _local_4 = this._habboHelp.getProperty("group.homepage.url");
                            _local_4 = _local_4.replace("%groupid%", _local_3);
                            HabboWebTools.openWebPage(_local_4, "habboMain");
                            this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_groupForum"));
                        }
                    }
                    return;
                case "guide_tool_duty":
                    switch (k.type)
                    {
                        case WindowEvent.WINDOW_EVENT_SELECTED:
                            this._Str_13929(true);
                            this._handleHelperRequests = (this._window.findChildByName("handle_helper_tickets") as ICheckBoxWindow)._Str_2365;
                            this._handleGuardianRequests = ((!(this._window.findChildByName("handle_guardian_tickets") == null)) && ((this._window.findChildByName("handle_guardian_tickets") as ICheckBoxWindow)._Str_2365));
                            this._handleGuideRequests = (this._window.findChildByName("handle_guide_tickets") as ICheckBoxWindow)._Str_2365;
                            if ((((!(this._handleHelperRequests)) && (!(this._handleGuardianRequests))) && (!(this._handleGuideRequests))))
                            {
                                this._habboHelp.windowManager.simpleAlert("${guide.help.guide.tool.noqueueselected.caption}", "${guide.help.guide.tool.noqueueselected.subtitle}", "${guide.help.guide.tool.noqueueselected.message}");
                                this._Str_13929(false);
                                return;
                            }
                            this._habboHelp._Str_2488(new _Str_4553(true, this._handleGuideRequests, this._handleHelperRequests, this._handleGuardianRequests));
                            this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_onDuty"));
                            break;
                        case WindowEvent.WINDOW_EVENT_UNSELECTED:
                            this._Str_13929(false);
                            this._habboHelp._Str_2488(new _Str_4553(false, false, false, false));
                            this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_offDuty"));
                            break;
                    }
                    return;
                case "guide_tool_talent":
                    if (k.type == WindowMouseEvent.CLICK)
                    {
                        if (this._habboHelp.getBoolean("talent.track.enabled"))
                        {
                            this._habboHelp.tracking.trackTalentTrackOpen(TalentEnum.HELPER, "guidetool");
                            this._habboHelp._Str_2488(new _Str_3075(TalentEnum.HELPER));
                            this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_talent"));
                        }
                    }
                    return;
            }
        }

        private function _Str_22481(k:int, _arg_2:String, _arg_3:int):void
        {
            var _local_5:IWindow;
            var _local_6:ITextWindow;
            var _local_7:IItemListWindow;
            var _local_8:int;
            var _local_9:int;
            if (((!(this._onDuty)) || (this._sessionData._Str_15842())))
            {
                Logger.log("Trying to set state to guide accept, but not on duty or active session exists");
                return;
            }
            this._sessionData._Str_3201 = GuideSessionStateEnum.GUIDE_ACCEPT;
            this._sessionData._Str_17222 = GuideSessionData._Str_15093;
            this._sessionData._Str_8937 = _arg_2;
            this._sessionData._Str_3989 = k;
            this._Str_2826(this._Str_22772, false);
            this._habboHelp._Str_2476._Str_4375(HabboSoundConstants.GUIDE_REQUEST);
            if (((k == _Str_2849._Str_4749) || (k == _Str_2849._Str_4268)))
            {
                this._window.findChildByName("frank_greeting").visible = true;
                this._window.findChildByName("request_title").caption = "${guide.help.request.guide.accept.tour_request.title}";
                this._window.findChildByName("request_type").dispose();
                _local_5 = this._window.findChildByName("request_description_wrapper");
                _local_6 = (this._window.findChildByName("request_description") as ITextWindow);
                _local_7 = (this._window.findChildByName("itemlist") as IItemListWindow);
                _local_7.addListItemAt(_local_6, _local_7.getListItemIndex(_local_5));
                _local_7.removeListItem(_local_5);
                _local_6.x = this._window.findChildByName("request_title").x;
                _local_6.margins.top = 10;
                _local_6.caption = _arg_2;
                _local_8 = _local_7.height;
                _local_9 = this._window.findChildByName("skip_link").bottom;
                _local_7.height = _local_9;
                this._window.findChildByName("border").height = (this._window.findChildByName("border").height + (_local_9 - _local_8));
                this._window.height = (this._window.height + ((_local_9 - _local_8) + 40));
            }
            else
            {
                this._window.findChildByName("request_type").caption = this._Str_20710(k);
                this._window.findChildByName("request_description").caption = _arg_2;
            }
            var _local_4:_Str_2961 = _Str_2961(IWidgetWindow(this._window.findChildByName("countdown")).widget);
            _local_4.seconds = _arg_3;
            _local_4.running = true;
        }

        private function _Str_22772(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.GUIDE_ACCEPT))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "accept_button":
                    this._habboHelp._Str_2488(new _Str_7016(true));
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickAccept"));
                    this.closeWindow();
                    return;
                case "skip_link":
                    this._habboHelp._Str_2488(new _Str_7016(false));
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickSkip"));
                    this.closeWindow();
                    return;
            }
        }

        private function _Str_24192():void
        {
            var title:String;
            var summary:String;
            if (((!(this._onDuty)) || (!(this._sessionData._Str_5908()))))
            {
                Logger.log("Trying to set state to guide ongoing, but not on duty or no active guide session");
                return;
            }
            this._sessionData._Str_3201 = GuideSessionStateEnum.GUIDE_ONGOING;
            this._Str_2826(this._Str_23050, false);
            this._Str_5863(this._sessionData.userId, this._sessionData.userName, this._sessionData._Str_7586, this._sessionData._Str_8937, true, _Str_7012);
            this._window.caption = this._habboHelp.localization.getLocalizationWithParams("guide.help.request.guide.ongoing.title", "", "name", this._sessionData.userName);
            var inputWidget:_Str_2789 = _Str_2789(IWidgetWindow(this._window.findChildByName("input_widget")).widget);
            inputWidget._Str_8859 = this;
            inputWidget._Str_6307 = this._habboHelp.localization.getLocalizationWithParams("guide.help.request.guide.ongoing.input.empty", "", "name", this._sessionData.userName);
            inputWidget.maxChars = this._habboHelp.getInteger("guide.help.request.max.chat.message.length", 150);
            if (((this._sessionData._Str_3989 == _Str_2849._Str_4749) || (this._sessionData._Str_3989 == _Str_2849._Str_4268)))
            {
                title = "${guide.help.request.join.room.title}";
                summary = this._habboHelp.localization.getLocalizationWithParams("guide.help.request.join.room.summary", "", "name", this._sessionData.userName);
                this._habboHelp.windowManager.confirm(title, summary, 0, function (k:_Str_2910, _arg_2:WindowEvent):void
                {
                    k.dispose();
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                    {
                        _habboHelp._Str_2488(new _Str_7364());
                    }
                });
            }
        }

        private function _Str_23050(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.GUIDE_ONGOING))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "visit_button":
                    this._habboHelp._Str_2488(new _Str_7364());
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickVisit"));
                    return;
                case "invite_button":
                    this._habboHelp._Str_2488(new _Str_10522());
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickInvite"));
                    return;
                case "report_link":
                    this._Str_10116();
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickReport"));
                    return;
                case "close_link":
                    this._habboHelp._Str_2488(new _Str_7077());
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickClose"));
                    this.closeWindow();
                    return;
            }
        }

        private function _Str_23339(k:int):void
        {
            if (((!(this._onDuty)) || (!(this._sessionData._Str_5908()))))
            {
                Logger.log("Trying to set state to guide ongoing, but not on duty or no active guide session");
                return;
            }
            this._sessionData._Str_3201 = GuideSessionStateEnum.GUIDE_CLOSED;
            this._Str_2826(this._Str_22605, true);
            if (((k == GuideSessionData._Str_14462) || (k == GuideSessionData._Str_19034)))
            {
                this._window.findChildByName("close_reason").caption = this._habboHelp.localization.getLocalizationWithParams("guide.help.request.guide.closed.reason.other", "", "name", this._sessionData.userName);
            }
            else
            {
                this._window.findChildByName("close_reason").caption = this._habboHelp.localization.getLocalization("guide.help.request.guide.closed.reason.you", "");
            }
            this._window.findChildByName("report_link").caption = this._habboHelp.localization.getLocalizationWithParams("guide.help.request.guide.closed.report.link", "", "name", this._sessionData.userName);
            _Str_2483(IWidgetWindow(this._window.findChildByName("requester_avatar")).widget).figure = this._sessionData._Str_7586;
        }

        private function _Str_22605(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.GUIDE_CLOSED))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "close_button":
                case "header_button_close":
                    this._habboHelp._Str_2488(new _Str_4434(true));
                    this.closeWindow();
                    return;
                case "report_link":
                    this._Str_10116();
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickReport"));
                    return;
            }
        }

        private function _Str_22204(k:uint, _arg_2:String=null):void
        {
            if (this._sessionData._Str_15842())
            {
                Logger.log("Trying to set state to user create, but active session exists");
                return;
            }
            this._sessionData._Str_17222 = GuideSessionData._Str_11013;
            this._sessionData._Str_3201 = GuideSessionStateEnum.USER_CREATE;
            this._sessionData._Str_3989 = k;
            this._Str_2826(this._Str_24366, true);
            var _local_3:_Str_2789 = _Str_2789(IWidgetWindow(this._window.findChildByName("input_widget")).widget);
            _local_3.maxChars = this._habboHelp.getInteger("guide.help.request.max.description.length", 0xFF);
            if (_arg_2)
            {
                _local_3.message = _arg_2;
            }
        }

        private function _Str_24366(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:String;
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.USER_CREATE))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "create_button":
                    _local_3 = StringUtil.trim(_Str_2789(IWidgetWindow(this._window.findChildByName("input_widget")).widget).message);
                    if (_local_3.length < this._habboHelp.getInteger("guide.help.request.min.description.length", 15))
                    {
                        this._window.findChildByName("create_error").visible = true;
                        IItemListWindow(this._window.findChildByName("list")).arrangeListItems();
                    }
                    else
                    {
                        this._habboHelp._Str_2488(new _Str_7293(this._sessionData._Str_3989, _local_3));
                        this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickCreate"));
                        this.closeWindow();
                    }
                    return;
                case "header_button_close":
                case "cancel_link":
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickCancel"));
                    this._Str_4260(true);
                    return;
            }
        }

        private function _window8(k:int, _arg_2:String, _arg_3:int):void
        {
            if (!this._sessionData._Str_5935())
            {
                Logger.log("Trying to set state to user pending request, but no active user session");
                return;
            }
            this._sessionData._Str_3201 = GuideSessionStateEnum.USER_PENDING;
            this._sessionData._Str_3989 = k;
            this._sessionData._Str_8937 = _arg_2;
            this._Str_2826(this._Str_23008, false);
            this._window.findChildByName("request_type").caption = this._Str_20710(k);
            this._window.findChildByName("request_description").caption = _arg_2;
            this._window.findChildByName("waiting_time").caption = this._habboHelp.localization.getLocalizationWithParams("guide.help.request.user.pending.info.waiting", "", "waitingtime", FriendlyTime.format(this._habboHelp.localization, _arg_3));
        }

        private function _Str_23008(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.USER_PENDING))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "cancel_button":
                    this._habboHelp._Str_2488(new _Str_10003());
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickCancel"));
                    this.closeWindow();
                    return;
            }
        }

        private function _Str_22431():void
        {
            if (!this._sessionData._Str_5935())
            {
                Logger.log("Trying to set state to user ongoing request, but no active user session");
                return;
            }
            this._sessionData._Str_3201 = GuideSessionStateEnum.USER_ONGOING;
            this._Str_2826(this._Str_22821, false);
            this._Str_14185(_Str_14376, this._habboHelp.localization.getLocalization("guide.help.requester.disclaimer"));
            if (((this._sessionData._Str_3989 == _Str_2849._Str_4268) || (this._sessionData._Str_3989 == _Str_2849._Str_4749)))
            {
                this._Str_14185(_Str_13767, this._habboHelp.localization.getLocalization("guide.help.request.tour.reminder"));
            }
            else
            {
                this._Str_5863(this._sessionData.userId, this._sessionData.userName, this._sessionData._Str_7586, this._sessionData._Str_8937, false, _Str_7012);
            }
            this._window.caption = this._habboHelp.localization.getLocalizationWithParams("guide.help.request.user.ongoing.title", "", "name", this._sessionData.guideName);
            this._window.findChildByName("guide_name_link").caption = this._sessionData.guideName;
            var k:_Str_2789 = _Str_2789(IWidgetWindow(this._window.findChildByName("input_widget")).widget);
            k._Str_8859 = this;
            k._Str_6307 = this._habboHelp.localization.getLocalizationWithParams("guide.help.request.user.ongoing.input.help", "", "name", this._sessionData.guideName);
            k.maxChars = this._habboHelp.getInteger("guide.help.request.max.chat.message.length", 150);
        }

        private function _Str_22821(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.USER_ONGOING))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "guide_name_link":
                    this._habboHelp._Str_2488(new _Str_2553(this._sessionData._Str_5587));
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickProfile"));
                    return;
                case "report_guide_link":
                    this._Str_10116();
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickReport"));
                    return;
                case "close_link":
                    this._habboHelp._Str_2488(new _Str_7077());
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickClose"));
                    this.closeWindow();
                    return;
            }
        }

        private function _window4():void
        {
            if (!this._sessionData._Str_5935())
            {
                Logger.log("Trying to set state to user guide disconnected, but no active user session");
                return;
            }
            this._sessionData._Str_3201 = GuideSessionStateEnum.USER_GUIDE_DISCONNECTED;
            this._Str_2826(this._Str_25007, true);
            this._window.findChildByName("guide_name_link").caption = this._sessionData.guideName;
        }

        private function _Str_25007(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.USER_GUIDE_DISCONNECTED))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this._habboHelp._Str_2488(new _Str_4434(false));
                    this.closeWindow();
                    return;
                case "guide_name_link":
                    this._habboHelp._Str_2488(new _Str_2553(this._sessionData._Str_5587));
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickProfile"));
                    return;
                case "report_guide_link":
                    this._Str_10116();
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickReport"));
                    return;
                case "resubmit_button":
                    this._resubmitDescription = true;
                    this._habboHelp._Str_2488(new _Str_4434(false));
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickResubmit"));
                    this.closeWindow();
                    return;
            }
        }

        private function _Str_23699():void
        {
            if (!this._sessionData._Str_5935())
            {
                Logger.log("Trying to set state to user feedback, but no active user session");
                return;
            }
            this._sessionData._Str_3201 = GuideSessionStateEnum.USER_FEEDBACK;
            this._Str_2826(this._Str_25707, false);
            this._window.findChildByName("guide_name_link").caption = this._sessionData.guideName;
        }

        private function _Str_25707(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.USER_FEEDBACK))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "guide_name_link":
                    this._habboHelp._Str_2488(new _Str_2553(this._sessionData._Str_5587));
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickProfile"));
                    return;
                case "report_guide_link":
                    this._Str_10116();
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickReport"));
                    return;
                case "positive_button":
                    this._habboHelp._Str_2488(new _Str_4434(true));
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickPositiveFeedback"));
                    this.closeWindow();
                    return;
                case "negative_button":
                    this._habboHelp._Str_2488(new _Str_4434(false));
                    this._habboHelp.trackGoogle("guideHelp", (this._window.name + "_clickNegativeFeedback"));
                    this.closeWindow();
                    return;
            }
        }

        private function _Str_22593():void
        {
            if (!this._sessionData._Str_5935())
            {
                Logger.log("Trying to set state to user thanks, but no active user session");
                return;
            }
            this._sessionData._Str_3201 = GuideSessionStateEnum.USER_THANKS;
            this._Str_2826(this._Str_24558, true);
        }

        private function _Str_24558(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.USER_THANKS))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                case "close_button":
                    this._Str_4260(false);
                    return;
            }
        }

        private function _Str_22573(k:int):void
        {
            this._sessionData._Str_3201 = GuideSessionStateEnum.GUARDIAN_CHAT_REVIEW_ACCEPT;
            this._Str_2826(this._Str_25328, false);
            this._habboHelp._Str_2476._Str_4375(HabboSoundConstants.GUIDE_REQUEST);
            var _local_2:_Str_2961 = (IWidgetWindow(this._window.findChildByName("countdown")).widget as _Str_2961);
            _local_2.seconds = k;
            _local_2.running = true;
        }

        private function _Str_25328(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this.disposed) || (this._window == null)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "skip_link":
                    this._habboHelp._Str_2488(new _Str_8134(false));
                    this._Str_4260(true);
                    return;
                case "accept_button":
                    this._habboHelp._Str_2488(new _Str_8134(true));
                    this._Str_24340();
                    return;
            }
        }

        private function _Str_24340():void
        {
            this._sessionData._Str_3201 = GuideSessionStateEnum.GUARDIAN_CHAT_REVIEW_WAIT_FOR_VOTERS;
            this._Str_2826(this._Str_25421, false);
            this._Str_20955((this._window.findChildByName("waiting_animation") as IStaticBitmapWrapperWindow), "help_chat_review_progress_big", 4);
        }

        private function _Str_25421(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this.disposed) || (this._window == null)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "close_link":
                    this._habboHelp._Str_2488(new _Str_4981());
                    this._Str_4260(true);
                    return;
            }
        }

        private function _Str_23588(k:int, _arg_2:String):void
        {
            var _local_5:Date;
            var _local_13:String;
            var _local_14:Array;
            var _local_15:int;
            var _local_16:String;
            var _local_17:Boolean;
            var _local_18:String;
            this._sessionData._Str_3201 = GuideSessionStateEnum.GUARDIAN_CHAT_REVIEW_VOTE;
            this._Str_2826(this._Str_23629, false);
            var _local_3:_Str_2961 = (IWidgetWindow(this._window.findChildByName("countdown")).widget as _Str_2961);
            _local_3.seconds = k;
            _local_3.running = true;
            var _local_4:Array = _arg_2.substr(0, _arg_2.indexOf(";")).match(/\d+/g);
            if (_local_4.length > 5)
            {
                _local_5 = new Date(_local_4[0], (int(_local_4[1]) - 1), _local_4[2], _local_4[3], _local_4[4], _local_4[5]);
            }
            else
            {
                _local_5 = new Date();
            }
            var _local_6:Number = ((new Date().getTime() - _local_5.getTime()) / 1000);
            this._window.findChildByName("incident_time").caption = (("(" + FriendlyTime.format(this._habboHelp.localization, _local_6, ".ago")) + ")");
            var _local_7:IItemListWindow = (this._window.findChildByName("chatlog") as IItemListWindow);
            var _local_8:IWindow = this._window.findChildByName("reported_user_template");
            var _local_9:IWindow = this._window.findChildByName("other_user_template");
            var _local_10:IWindow = this._window.findChildByName("separator_template");
            _local_7.removeListItems();
            var _local_11:int = -1;
            var _local_12:IWindowContainer;
            for each (_local_13 in _arg_2.split("\r"))
            {
                if (_local_13 == "")
                {
                }
                else
                {
                    _local_14 = _local_13.split(";", 3);
                    _local_15 = 1;
                    if (_local_14.length < 3)
                    {
                    }
                    else
                    {
                        _local_15 = int(_local_14[1]);
                        _local_16 = String(_local_14[2]).replace("<", "&lt;").replace(">", "&gt;");
                        if (((_local_15 == _local_11) && (!(_local_12 == null))))
                        {
                            _local_12.findChildByName("message").caption = (_local_12.findChildByName("message").caption + ("\n" + _local_16));
                        }
                        else
                        {
                            _local_17 = (_local_15 == 0);
                            _local_12 = (((_local_17) ? _local_8.clone() : _local_9.clone()) as IWindowContainer);
                            _local_18 = ((_local_17) ? this._habboHelp.localization.getLocalization("guide.bully.request.guide.vote.perpetrator", "") : this._habboHelp.localization.getLocalizationWithParams("guide.bully.request.guide.vote.anonymous", "%ID%", "id", _local_15.toString()));
                            _local_12.findChildByName("message").caption = ((("<b>" + _local_18) + ":</b> ") + _local_16);
                            _local_7.addListItem(_local_12);
                            _local_11 = _local_15;
                        }
                    }
                }
            }
        }

        private function _Str_23629(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:String;
            var _local_4:IRegionWindow;
            var _local_5:String;
            var _local_6:IStaticBitmapWrapperWindow;
            if (((this.disposed) || (this._window == null)))
            {
                return;
            }
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "close_link":
                        this._habboHelp._Str_2488(new _Str_4981());
                        this._Str_4260(true);
                        break;
                    case "vote_ok":
                        this._habboHelp._Str_2488(new _Str_5876(_Str_10084));
                        this._Str_18645(_Str_10084);
                        break;
                    case "vote_bad":
                        this._habboHelp._Str_2488(new _Str_5876(_Str_9791));
                        this._Str_18645(_Str_9791);
                        break;
                    case "vote_very_bad":
                        this._habboHelp._Str_2488(new _Str_5876(_Str_10906));
                        this._Str_18645(_Str_10906);
                        break;
                }
            }
            else
            {
                if (((_arg_2.type == WindowType.WINDOW_TYPE_REGION) && (_arg_2.name.substr(0, 5) == "vote_")))
                {
                    _local_3 = _arg_2.name.substr(5);
                    _local_4 = (_arg_2 as IRegionWindow);
                    _local_5 = ("help_chat_review_vote_" + _local_3);
                    _local_6 = (_local_4.getChildAt(0) as IStaticBitmapWrapperWindow);
                    switch (k.type)
                    {
                        case WindowMouseEvent.OVER:
                            _local_6.id = (_local_6.id | 0x01);
                            break;
                        case WindowMouseEvent.OUT:
                            _local_6.id = (_local_6.id & (~(0x01)));
                            break;
                        case WindowMouseEvent.DOWN:
                            _local_6.id = (_local_6.id | 0x02);
                            break;
                        case WindowMouseEvent.UP:
                        case WindowMouseEvent.UP_OUTSIDE:
                            _local_6.id = (_local_6.id & (~(0x02)));
                            break;
                    }
                    switch (_local_6.id)
                    {
                        case 1:
                            _local_6.assetUri = (_local_5 + "_over");
                            return;
                        case 3:
                            _local_6.assetUri = (_local_5 + "_down");
                            return;
                        default:
                            _local_6.assetUri = _local_5;
                    }
                }
            }
        }

        private function _Str_18645(k:int):void
        {
            this._sessionData._Str_3201 = GuideSessionStateEnum.GUARDIAN_CHAT_REVIEW_WAIT_FOR_RESULTS;
            this._Str_2826(this._Str_25506, true);
            this._Str_20571(k);
        }

        private function _Str_25506(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this.disposed) || (this._window == null)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                case "close_button":
                    this._habboHelp._Str_2488(new _Str_4981());
                    this._Str_4260(true);
                    return;
            }
        }

        private function _Str_22460(k:int, _arg_2:int, _arg_3:Array):void
        {
            this._sessionData._Str_3201 = GuideSessionStateEnum.GUARDIAN_CHAT_REVIEW_RESULTS;
            this._Str_2826(this._Str_22977, true);
            var _local_4:int = _Str_13055(k);
            this._window.findChildByName("result_text").caption = ((_Str_10603 + _Str_17966[_local_4]) + "}");
            IStaticBitmapWrapperWindow(this._window.findChildByName("result_image")).assetUri = (HELP_CHAT_REVIEW_DECISION_ + _Str_6777[_local_4]);
            this._Str_20571(_arg_2);
            this._Str_19514((this._window.findChildByName("results") as IItemListWindow), _arg_3);
        }

        private function _Str_22977(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this.disposed) || (this._window == null)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                case "close_button":
                    this._habboHelp._Str_2488(new _Str_4981());
                    this._Str_4260(true);
                    return;
            }
        }

        private function _Str_20571(k:int):void
        {
            var _local_2:int = _Str_13055(k);
            this._window.findChildByName("vote_text").caption = ((_Str_10603 + _Str_6777[_local_2]) + "}");
            IStaticBitmapWrapperWindow(this._window.findChildByName("vote_image")).assetUri = (HELP_CHAT_REVIEW_DECISION_ + _Str_6777[_local_2]);
        }

        private function _Str_19514(k:IItemListWindow, _arg_2:Array):void
        {
            var _local_3:IWindowContainer;
            var _local_4:int;
            var _local_5:IWindowContainer;
            var _local_6:int;
            var _local_7:IStaticBitmapWrapperWindow;
            if (k.numListItems < (_arg_2.length + 1))
            {
                _local_5 = (k.getListItemAt(0) as IWindowContainer);
                _local_4 = 0;
                while (_local_4 < _arg_2.length)
                {
                    _local_3 = (_local_5.clone() as IWindowContainer);
                    k.addListItem(_local_3);
                    _local_4++;
                }
                _local_3.findChildByName("vote_separator").dispose();
            }
            _local_4 = 0;
            while (_local_4 < _arg_2.length)
            {
                _local_3 = (k.getListItemAt((_local_4 + 1)) as IWindowContainer);
                _local_6 = _arg_2[_local_4];
                _local_7 = (_local_3.findChildByName("vote_image") as IStaticBitmapWrapperWindow);
                _local_3.findChildByName("vote_text").caption = ((_Str_10603 + _Str_6777[_local_6]) + "}");
                this._window6(_local_7);
                switch (_local_6)
                {
                    case _Str_4393._Str_14199:
                    case _Str_4393._Str_17414:
                        this._Str_20955(_local_7, (HELP_CHAT_REVIEW_DECISION_ + _Str_6777[_local_6]), 2);
                        break;
                    default:
                        _local_7.assetUri = (HELP_CHAT_REVIEW_DECISION_ + _Str_6777[_local_6]);
                }
                _local_4++;
            }
        }

        private function _Str_24880(k:String):void
        {
            this._habboHelp.windowManager.simpleAlert((("${" + k) + ".title}"), (("${" + k) + ".heading}"), (("${" + k) + ".message}"));
            this._Str_4260(true);
        }

        private function _Str_17548():void
        {
            this._Str_10865(false);
            this._sessionData._Str_3201 = GuideSessionStateEnum.ERROR;
            this._Str_2826(this._Str_22344, true);
        }

        private function _Str_22344(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.ERROR))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                case "close_button":
                    this._Str_4260(true);
                    return;
            }
        }

        private function _Str_22553():void
        {
            this._Str_10865(false);
            this._sessionData._Str_3201 = GuideSessionStateEnum.REJECTED;
            this._Str_2826(this._Str_22562, true);
            if (((this._sessionData._Str_3989 == _Str_2849._Str_4268) || (this._sessionData._Str_3989 == _Str_2849._Str_4749)))
            {
                this._window.caption = "${guide.help.request.no_tour_guides.title}";
                this._window.findChildByName("heading").caption = "${guide.help.request.no_tour_guides.heading}";
                this._window.findChildByName("message").caption = "${guide.help.request.no_tour_guides.message}";
            }
        }

        private function _Str_22562(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this.disposed) || (this._window == null)) || (!(this._window.name == GuideSessionStateEnum.REJECTED))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                case "close_button":
                    this._Str_4260(true);
                    return;
            }
        }

        private function _Str_4260(k:Boolean):void
        {
            this._Str_20660();
            this.closeWindow();
            if (((this._onDuty) && (!(this._habboHelp.sessionDataManager.isPerkAllowed(PerkEnum.USE_GUIDE_TOOL)))))
            {
                this._Str_10865(false);
            }
            if (((k) && (this._onDuty)))
            {
                this._Str_20372();
            }
        }

        private function _Str_2826(k:Function, _arg_2:Boolean):void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._window != null)
            {
                this.closeWindow();
            }
            Logger.log(("Opening window " + this._sessionData._Str_3201));
            this._window = (this._guideHelp._Str_2602.getXmlWindow(this._sessionData._Str_3201) as IWindowContainer);
            this._window.position = this._windowPosition;
            this._window.procedure = k;
            this._window.findChildByName("header_button_close").visible = _arg_2;
        }

        private function closeWindow():void
        {
            if (this._window != null)
            {
                Logger.log(("Closing window: " + this._window.name));
                this._windowPosition.x = Math.max(0, this._window.position.x);
                this._windowPosition.y = Math.max(0, this._window.position.y);
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_10116():void
        {
            this._habboHelp._Str_8128(HabboHelp._Str_15870);
        }

        public function _Str_18954():void
        {
            if (((this._reportWindow) || (this._window == null)))
            {
                return;
            }
            var k:IDesktopWindow = this._habboHelp.windowManager.getDesktop(0);
            this._reportWindow = IWindowContainer(this._habboHelp.getXmlWindow("report_window"));
            this._reportWindow.procedure = this._Str_21772;
            this._reportWindow.x = Math.max(0, Math.min((k.width - this._reportWindow.width), ((this._window.x + this._window.width) + 10)));
            this._reportWindow.y = Math.max(0, this._window.y);
        }

        private function _Str_19564():void
        {
            if (this._reportWindow)
            {
                this._reportWindow.dispose();
                this._reportWindow = null;
            }
        }

        private function _Str_21772(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:String;
            if (((((this.disposed) || (!(this._reportWindow))) || (this._reportWindow.disposed)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                case "cancel_link":
                    this._habboHelp.trackGoogle("guideHelp", (this._reportWindow.name + "_clickClose"));
                    this._Str_19564();
                    return;
                case "urgent_help_link":
                    return;
                case "submit_button":
                    _local_3 = _Str_2789(IWidgetWindow(this._reportWindow.findChildByName("input_widget")).widget).message;
                    if (_local_3.length == 0)
                    {
                        this._reportWindow.findChildByName("report_error").visible = true;
                        IItemListWindow(this._reportWindow.findChildByName("list")).arrangeListItems();
                    }
                    else
                    {
                        this._habboHelp._Str_2488(new _Str_11135(_local_3));
                        this._habboHelp.trackGoogle("guideHelp", (this._reportWindow.name + "_clickReport"));
                        this._Str_19564();
                        this.closeWindow();
                    }
                    return;
            }
        }

        private function _Str_20660():void
        {
            this._sessionData = new GuideSessionData();
        }

        private function _Str_13929(k:Boolean):void
        {
            var _local_2:ICheckBoxWindow = ICheckBoxWindow(this._window.findChildByName("guide_tool_duty"));
            this._Str_10865(k);
            _local_2._Str_2365 = k;
            if (k)
            {
                _local_2.caption = this._habboHelp.localization.getLocalization("guide.help.guide.tool.duty.on", "");
            }
            else
            {
                _local_2.caption = this._habboHelp.localization.getLocalization("guide.help.guide.tool.duty.off", "");
            }
            var _local_3:IWindow = this._window.findChildByName("disabled_screen");
            if (_local_3)
            {
                _local_3.visible = k;
            }
        }

        private function _Str_18493(k:String, _arg_2:Boolean):void
        {
            var _local_3:ICheckBoxWindow = (this._window.findChildByName(k) as ICheckBoxWindow);
            if (_local_3 != null)
            {
                _local_3._Str_2365 = _arg_2;
            }
        }

        private function _Str_20710(k:int):String
        {
            if (k == _Str_2849._Str_4749)
            {
                k = _Str_2849._Str_4268;
            }
            return this._habboHelp.localization.getLocalization(("guide.help.request.type." + k), "");
        }

        private function _Str_5863(k:int, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Boolean, _arg_6:int=0, _arg_7:*=null):void
        {
            var _local_8:IWidgetWindow;
            var _local_9:_Str_3904;
            var _local_10:IWindowContainer;
            _local_8 = this._Str_23250();
            if ((((!(_local_8 == null)) && (!(null == (_local_8.widget as _Str_3904)))) && (_local_8.name == ("chat_msg_" + _Str_13522))))
            {
                _local_9 = _Str_3904(_local_8.widget);
            }
            if ((((_local_9) && (_local_9.userId == k)) && (_arg_6 == _Str_13522)))
            {
                _local_9.message = ((_local_9.message + "\n") + _arg_4);
                this._Str_13080(null);
            }
            else
            {
                _local_8 = IWidgetWindow(this._chatMsg.clone());
                _local_8.name = ("chat_msg_" + _arg_6);
                _local_9 = _Str_3904(_local_8.widget);
                _local_9.figure = _arg_3;
                _local_9._Str_6764 = _arg_5;
                _local_9.message = _arg_4;
                _local_9.userName = _arg_2;
                _local_9.userId = k;
                switch (_arg_6)
                {
                    case _Str_13205:
                        _local_10 = IWindowContainer(IWindowContainer(_local_8._Str_2429).findChildByName("message_region"));
                        _local_10.procedure = this._Str_22682;
                        _local_10.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
                        _local_10.id = _arg_7;
                        ITextWindow(_local_10.findChildByName("message")).underline = true;
                        break;
                }
                this._Str_13080(_local_8);
            }
        }

        private function _Str_22682(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this.disposed) || (this._window == null)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            this._habboHelp.navigator.goToPrivateRoom(_arg_2.id);
        }

        private function _Str_13080(k:IWindow):void
        {
            var _local_2:IItemListWindow = IItemListWindow(this._window.findChildByName("chat_list"));
            if (k)
            {
                _local_2.addListItemAt(k, (_local_2.numListItems - 1));
            }
            _local_2.scrollV = 1;
            _local_2.arrangeListItems();
            this._Str_21639();
        }

        private function _Str_14185(k:int, _arg_2:String):void
        {
            var _local_3:IWindowContainer;
            if (((!(this._sessionData._Str_14646())) || (_arg_2 == "")))
            {
                return;
            }
            switch (k)
            {
                case _Str_14376:
                    _local_3 = (this._chatMsgNotification.clone() as IWindowContainer);
                    _local_3.findChildByName("content").caption = _arg_2;
                    this._Str_13080(_local_3);
                    return;
                case _Str_13767:
                    _local_3 = (this._chatMsgReminder.clone() as IWindowContainer);
                    _local_3.findChildByName("content").caption = _arg_2;
                    this._Str_13080(_local_3);
                    return;
                default:
                    if (this._sessionData._Str_5935())
                    {
                        this._Str_5863(this._sessionData.userId, this._sessionData.userName, this._sessionData._Str_7586, _arg_2, true, _Str_7012);
                    }
                    else
                    {
                        this._Str_5863(this._sessionData._Str_5587, this._sessionData.guideName, this._sessionData.guideFigure, _arg_2, true, _Str_7012);
                    }
            }
        }

        private function _Str_23250():IWidgetWindow
        {
            if (((this._window == null) || (this._window.disposed)))
            {
                return null;
            }
            var k:IItemListWindow = IItemListWindow(this._window.findChildByName("chat_list"));
            if (k.numListItems > 1)
            {
                return k.getListItemAt((k.numListItems - 2)) as IWidgetWindow;
            }
            return null;
        }

        public function _Str_3055(k:IWidgetWindow, _arg_2:String):void
        {
            if (_arg_2.length > 0)
            {
                this._habboHelp._Str_2488(new _Str_11187(_arg_2));
                _Str_2789(k.widget).message = "";
                this._Str_21639();
            }
        }

        private function _Str_10865(k:Boolean):void
        {
            this._onDuty = k;
            this._habboHelp.toolbar.onDuty = k;
        }

        private function _Str_21639():void
        {
            if (this._typingTimer != null)
            {
                this._typingTimer.stop();
                this._typingTimer = null;
            }
            if ((((this._window == null) || (this._window.disposed)) || ((!(this._window.name == GuideSessionStateEnum.USER_ONGOING)) && (!(this._window.name == GuideSessionStateEnum.GUIDE_ONGOING)))))
            {
                return;
            }
            this._typingTimer = new Timer(_Str_18329);
            this._typingTimer.addEventListener(TimerEvent.TIMER, this._Str_23506);
            this._typingTimer.start();
            this._lastMessageTypedLength = this._Str_19035;
            this._Str_19579(false);
        }

        private function get _Str_19035():int
        {
            if ((((this._window == null) || (this._window.disposed)) || ((!(this._window.name == GuideSessionStateEnum.USER_ONGOING)) && (!(this._window.name == GuideSessionStateEnum.GUIDE_ONGOING)))))
            {
                return 0;
            }
            var k:IWidgetWindow = (this._window.findChildByName("input_widget") as IWidgetWindow);
            return (k != null) ? _Str_2789(k.widget).message.length : 0;
        }

        private function _Str_23506(k:TimerEvent):void
        {
            if ((((this._window == null) || (this._window.disposed)) || ((!(this._window.name == GuideSessionStateEnum.USER_ONGOING)) && (!(this._window.name == GuideSessionStateEnum.GUIDE_ONGOING)))))
            {
                return;
            }
            var _local_2:int = this._Str_19035;
            var _local_3:* = (!(this._lastMessageTypedLength == _local_2));
            if (this._lastTypingInfo != _local_3)
            {
                this._habboHelp._Str_2488(new _Str_11748(_local_3));
                this._lastTypingInfo = _local_3;
            }
            this._lastMessageTypedLength = _local_2;
        }

        private function _Str_19579(k:Boolean):void
        {
            if ((((this._window == null) || (this._window.disposed)) || ((!(this._window.name == GuideSessionStateEnum.USER_ONGOING)) && (!(this._window.name == GuideSessionStateEnum.GUIDE_ONGOING)))))
            {
                return;
            }
            var _local_2:IItemListWindow = IItemListWindow(this._window.findChildByName("chat_list"));
            _local_2.getListItemAt((_local_2.numListItems - 1)).blend = ((k) ? 1 : 0);
        }

        private function _Str_22173(event:TimerEvent):void
        {
            var data:AnimationData;
            this._waitingAnimationData = this._waitingAnimationData.filter(function (k:AnimationData, _arg_2:int, _arg_3:Vector.<AnimationData>):Boolean
            {
                return (!(k.window == null)) && (!(k.window.disposed));
            });
            for each (data in this._waitingAnimationData)
            {
                this._Str_9300(data);
            }
        }

        private function _Str_20955(k:IStaticBitmapWrapperWindow, _arg_2:String, _arg_3:int):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_4:AnimationData = new AnimationData(k, _arg_2, _arg_3);
            this._Str_9300(_local_4);
            this._waitingAnimationData.push(_local_4);
        }

        private function _Str_9300(k:AnimationData):void
        {
            var _local_2:int = (this._waitingAnimationTimer.currentCount % k._Str_2185);
            k.window.assetUri = ((k.asset + "_") + String((_local_2 + 1)));
        }

        private function _window6(window:IStaticBitmapWrapperWindow):void
        {
            this._waitingAnimationData = this._waitingAnimationData.filter(function (k:AnimationData, _arg_2:int, _arg_3:Vector.<AnimationData>):Boolean
            {
                return !(k.window == window);
            });
        }

        private function _Str_3983(k:MouseEvent):void
        {
            this._idleCheckLastActivity = getTimer();
        }

        private function _Str_19672(k:TimerEvent):void
        {
            if (((this._onDuty) && ((getTimer() - this._idleCheckLastActivity) > (this._habboHelp.getInteger("guidetool.idle.timeout", 300) * 1000))))
            {
                this._habboHelp._Str_2488(new _Str_4553(false, this._handleGuideRequests, this._handleHelperRequests, this._handleGuardianRequests));
            }
        }
    }
}
