package com.sulake.habbo.moderation
{
    import com.sulake.core.utils.Map;
    import flash.utils.Timer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CallForHelpCategoryData;
    import flash.events.TimerEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
    import com.sulake.habbo.communication.messages.outgoing.moderator.ReleaseIssuesMessageComposer;
    import com.sulake.habbo.sound.HabboSoundTypesEnum;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.outgoing.moderator.ModToolSanctionComposer;
    import com.sulake.habbo.utils.StringUtil;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CfhSanctionTypeData;
    import com.sulake.habbo.communication.messages.outgoing.moderator.CloseIssuesMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.moderator.PickIssuesMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.moderator.CloseIssueDefaultActionMessageComposer;

    public class IssueManager 
    {
        public static const ISSUE_BUNDLE_OPEN:String = "issue_bundle_open";
        public static const ISSUE_BUNDLE_MY:String = "issue_bundle_my";
        public static const ISSUE_BUNDLE_PICKED:String = "issue_bundle_picked";
        public static const PRIORITY_UPDATE_INTERVAL_MS:int = 15000;
        public static const RESOLUTION_USELESS:int = 1;
        public static const RESOLUTION_RESOLVED:int = 3;

        private var _moderationManager:ModerationManager;
        private var _issueBrowser:IssueBrowser;
        private var _issues:Map;
        private var _bundles:Map;
        private var _bundleIds:Map;
        private var _handleQueue:Array;
        private var _releaseQueue:Array;
        private var _issueHandlers:Map;
        private var _modActionViews:Map;
        private var _nextBundleId:int = 1;
        private var _priorityFactor:int;
        private var _priorityUpdater:Timer;
        private var _issueListLimit:int;
        private var _windowX:int;
        private var _windowY:int;
        private var _windowWidth:int;
        private var _windowHeight:int;
        private var _cfhtopics:Vector.<CallForHelpCategoryData>;

        public function IssueManager(k:ModerationManager)
        {
            this._moderationManager = k;
            this._issues = new Map();
            this._bundles = new Map();
            this._bundleIds = new Map();
            this._issueBrowser = new IssueBrowser(this, this._moderationManager.windowManager, this._moderationManager.assets);
            this._handleQueue = [];
            this._releaseQueue = [];
            this._issueHandlers = new Map();
            this._modActionViews = new Map();
            this._priorityFactor = this._moderationManager.getInteger("chf.score.updatefactor", 60);
            this._issueListLimit = this._moderationManager.getInteger("max.call_for_help.results", 200);
            this._priorityUpdater = new Timer(PRIORITY_UPDATE_INTERVAL_MS, 0);
            this._priorityUpdater.addEventListener(TimerEvent.TIMER, this._Str_19194);
            this._priorityUpdater.start();
        }

        public function get issueListLimit():int
        {
            return this._issueListLimit;
        }

        public function init():void
        {
            this._issueBrowser.show();
        }

        public function pickBundle(k:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:int=0):void
        {
            var _local_5:IssueBundle = (this._bundles.getValue(k) as IssueBundle);
            if (_local_5 == null)
            {
                return;
            }
            this.sendPick(_local_5._Str_7101(), _arg_3, _arg_4, _arg_2);
            this._handleQueue = this._handleQueue.concat(_local_5._Str_7101());
        }

        public function autoPick(k:String, _arg_2:Boolean=false, _arg_3:int=0):void
        {
            var _local_5:IssueBundle;
            var _local_6:IssueBundle;
            var _local_4:Array = this._bundles.getValues();
            for each (_local_6 in _local_4)
            {
                if (((_local_6.state == IssueMessageData._Str_5035) && ((_local_5 == null) || (this.isBundleHigherPriorityOrOlder(_local_6, _local_5)))))
                {
                    _local_5 = _local_6;
                }
            }
            if (_local_5 == null)
            {
                return;
            }
            this.pickBundle(_local_5.id, k, _arg_2, _arg_3);
        }

        private function isBundleHigherPriorityOrOlder(k:IssueBundle, _arg_2:IssueBundle):Boolean
        {
            if (k.highestPriority < _arg_2.highestPriority)
            {
                return true;
            }
            return (k.highestPriority == _arg_2.highestPriority) && (k.issueAgeInMilliseconds < _arg_2.issueAgeInMilliseconds);
        }

        public function releaseAll():void
        {
            var _local_3:IssueBundle;
            if (this._bundles == null)
            {
                return;
            }
            var k:int = this._moderationManager.sessionDataManager.userId;
            var _local_2:Array = [];
            for each (_local_3 in this._bundles)
            {
                if (((_local_3.state == IssueMessageData._Str_8056) && (_local_3._Str_5547 == k)))
                {
                    _local_2 = _local_2.concat(_local_3._Str_7101());
                }
            }
            this.sendRelease(_local_2);
        }

        public function releaseBundle(k:int):void
        {
            if (this._bundles == null)
            {
                return;
            }
            var _local_2:IssueBundle = (this._bundles.getValue(k) as IssueBundle);
            if (_local_2 == null)
            {
                return;
            }
            this.sendRelease(_local_2._Str_7101());
        }

        private function sendRelease(k:Array):void
        {
            if (((((k == null) || (k.length == 0)) || (this._moderationManager == null)) || (this._moderationManager.connection == null)))
            {
                return;
            }
            this._moderationManager.connection.send(new ReleaseIssuesMessageComposer(k));
            this._releaseQueue = this._releaseQueue.concat(k);
        }

        public function playSound(k:IssueMessageData):void
        {
            if (this._issues[k._Str_2869] != null)
            {
                return;
            }
            if (((this._issueBrowser == null) || (!(this._issueBrowser.isOpen()))))
            {
                this._moderationManager.soundManager.playSound(HabboSoundTypesEnum.CALL_FOR_HELP);
            }
        }

        public function addModActionView(k:IssueMessageData):void
        {
            var _local_3:IssueBundle;
            var _local_4:IssueBundle;
            var _local_5:int;
            var _local_6:Array;
            var _local_7:Boolean;
            var _local_8:IssueBundle;
            var _local_9:int;
            if (k == null)
            {
                return;
            }
            this._issues.remove(k._Str_2869);
            this._issues.add(k._Str_2869, k);
            var _local_2:int = int(this._bundleIds.getValue(k._Str_2869));
            if (_local_2 != 0)
            {
                _local_3 = (this._bundles.getValue(_local_2) as IssueBundle);
                if (_local_3 != null)
                {
                    if (_local_3._Str_12152(k))
                    {
                        _local_3.addModActionView(k);
                    }
                    else
                    {
                        _local_3.removeIssue(k._Str_2869);
                        if (_local_3._Str_20055() == 0)
                        {
                            this._bundles.remove(_local_3.id);
                            this._Str_17098(_local_3.id);
                        }
                        this._bundleIds.remove(k._Str_2869);
                        _local_3 = null;
                    }
                }
            }
            if (k.state == IssueMessageData._Str_17136)
            {
                this._issues.remove(k._Str_2869);
                return;
            }
            if (_local_3 == null)
            {
                for each (_local_4 in this._bundles)
                {
                    if (_local_4._Str_12152(k))
                    {
                        _local_3 = _local_4;
                        _local_3.addModActionView(k);
                        this._bundleIds.add(k._Str_2869, _local_3.id);
                        break;
                    }
                }
            }
            if (_local_3 == null)
            {
                _local_2 = this._nextBundleId++;
                _local_3 = new IssueBundle(_local_2, k);
                this._bundleIds.add(k._Str_2869, _local_2);
                this._bundles.add(_local_2, _local_3);
            }
            if (_local_3 == null)
            {
                return;
            }
            if (this._handleQueue.indexOf(k._Str_2869) != -1)
            {
                this.handleBundle(_local_3.id);
                _local_5 = this._moderationManager.sessionDataManager.userId;
                if (_local_5 != k._Str_5547)
                {
                    if (k.state == IssueMessageData._Str_8056)
                    {
                        this.unhandleBundle(_local_3.id);
                    }
                }
            }
            if (k.state == IssueMessageData._Str_5035)
            {
                _local_6 = this.getBundles(ISSUE_BUNDLE_MY);
                _local_7 = false;
                for each (_local_8 in _local_6)
                {
                    if (_local_8._Str_12152(k, true))
                    {
                        _local_7 = true;
                        break;
                    }
                }
                _local_9 = this._releaseQueue.indexOf(k._Str_2869);
                if (((_local_9 == -1) && (_local_7)))
                {
                    this.sendPick([k._Str_2869], false, 0, ("matches bundle with issue: " + _local_8._Str_5216()._Str_2869));
                }
                else
                {
                    this._releaseQueue.splice(_local_9, 1);
                }
            }
            this._Str_23968(_local_3.id);
            this._issueBrowser.update();
        }

        public function _Str_19194(k:Event=null):void
        {
            if (this._moderationManager == null)
            {
                return;
            }
            if (this._issueBrowser != null)
            {
                this._issueBrowser.update();
            }
        }

        private function _Str_23968(k:int):void
        {
            var _local_2:IIssueHandler = this._issueHandlers.getValue(k);
            if (_local_2 != null)
            {
                _local_2._Str_21978();
            }
        }

        public function _Str_17098(k:int):void
        {
            var _local_2:IIssueHandler = this._issueHandlers.remove(k);
            if (_local_2 != null)
            {
                _local_2.dispose();
                _local_2 = null;
            }
        }

        public function _Str_24021(k:int, _arg_2:ModActionCtrl):void
        {
            this._modActionViews.add(k, _arg_2);
        }

        public function _Str_23349(k:int):void
        {
            this._modActionViews.remove(k);
        }

        public function removeIssue(k:int):void
        {
            var _local_3:IssueBundle;
            if (this._issues == null)
            {
                return;
            }
            var _local_2:int = this._bundleIds.getValue(k);
            if (_local_2 != 0)
            {
                _local_3 = (this._bundles.getValue(_local_2) as IssueBundle);
                if (_local_3 != null)
                {
                    _local_3.removeIssue(k);
                    if (_local_3._Str_20055() == 0)
                    {
                        this._bundles.remove(_local_3.id);
                    }
                }
            }
            this._issues.remove(k);
            this._issueBrowser.update();
        }

        public function getBundles(k:String):Array
        {
            var _local_4:IssueBundle;
            if (this._bundles == null)
            {
                return [];
            }
            var _local_2:Array = [];
            var _local_3:int = this._moderationManager.sessionDataManager.userId;
            for each (_local_4 in this._bundles)
            {
                switch (k)
                {
                    case ISSUE_BUNDLE_OPEN:
                        if (_local_4.state == IssueMessageData._Str_5035)
                        {
                            _local_2.push(_local_4);
                        }
                        break;
                    case ISSUE_BUNDLE_MY:
                        if (((_local_4.state == IssueMessageData._Str_8056) && (_local_4._Str_5547 == _local_3)))
                        {
                            _local_2.push(_local_4);
                        }
                        break;
                    case ISSUE_BUNDLE_PICKED:
                        if (((_local_4.state == IssueMessageData._Str_8056) && (!(_local_4._Str_5547 == _local_3))))
                        {
                            _local_2.push(_local_4);
                        }
                        break;
                }
            }
            return _local_2;
        }

        public function handleBundle(k:int):void
        {
            var _local_5:int;
            var _local_2:IssueBundle = (this._bundles.getValue(k) as IssueBundle);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IIssueHandler = new IssueHandler(this._moderationManager, _local_2, this._cfhtopics, this._windowX, this._windowY, this._windowWidth, this._windowHeight);
            this._moderationManager.windowTracker.show((_local_3 as ITrackedWindow), null, false, false, false, true, this._windowX, this._windowY, this._windowWidth, this._windowHeight);
            this._Str_17098(k);
            this._issueHandlers.add(k, _local_3);
            var _local_4:Array = [];
            for each (_local_5 in this._handleQueue)
            {
                if (!_local_2.contains(_local_5))
                {
                    _local_4 = _local_4.concat(_local_5);
                }
            }
            this._handleQueue = _local_4;
        }

        public function unhandleBundle(k:int):void
        {
            var _local_2:IssueBundle = (this._bundles.getValue(k) as IssueBundle);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:ITrackedWindow = this._issueHandlers.remove(k);
            if (_local_3 != null)
            {
                _local_3.dispose();
            }
        }

        public function closeBundle(k:int, _arg_2:int):void
        {
            var _local_3:IssueBundle = (this._bundles.getValue(k) as IssueBundle);
            if (_local_3 == null)
            {
                return;
            }
            this.sendClose(_local_3._Str_7101(), _arg_2);
        }

        public function closeDefaultAction(k:int, _arg_2:int):void
        {
            var _local_6:int;
            var _local_3:IssueBundle = (this._bundles.getValue(k) as IssueBundle);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:* = _local_3._Str_5216()._Str_2869;
            var _local_5:* = new Array();
            for each (_local_6 in _local_3._Str_7101())
            {
                if (_local_6 != _local_4)
                {
                    _local_5.push(_local_6);
                }
            }
            this.sendCloseDefaultAction(_local_4, _local_5, _arg_2);
        }

        public function requestSanctionData(k:int, _arg_2:int):void
        {
            var _local_3:IssueBundle = (this._bundles.getValue(k) as IssueBundle);
            if (_local_3 == null)
            {
                return;
            }
            if (_local_3._Str_5216() != null)
            {
                this._moderationManager.connection.send(new ModToolSanctionComposer(_local_3._Str_5216()._Str_2869, -1, _arg_2));
            }
        }

        public function requestSanctionDataForAccount(k:int, _arg_2:int):void
        {
            this._moderationManager.connection.send(new ModToolSanctionComposer(-1, k, _arg_2));
        }

        public function updateSanctionData(k:int, _arg_2:int, _arg_3:CfhSanctionTypeData):void
        {
            var _local_5:IssueBundle;
            var _local_6:IIssueHandler;
            var _local_7:ModActionCtrl;
            var _local_4:String = (_arg_3.name + ((_arg_3.avatarOnly) ? " (avatar) " : " "));
            if (_arg_3.sanctionLengthInHours > 24)
            {
                _local_4 = (_local_4 + ((_arg_3.sanctionLengthInHours / 24) + " days"));
            }
            else
            {
                _local_4 = (_local_4 + (_arg_3.sanctionLengthInHours + "h"));
            }
            if (!StringUtil.isEmpty(_arg_3.tradeLockInfo))
            {
                _local_4 = (_local_4 + (" & " + _arg_3.tradeLockInfo));
            }
            if (!StringUtil.isEmpty(_arg_3.machineBanInfo))
            {
                _local_4 = (_local_4 + (" & " + _arg_3.machineBanInfo));
            }
            if (k > 0)
            {
                for each (_local_5 in this._bundles)
                {
                    if (_local_5.contains(k))
                    {
                        _local_6 = this._issueHandlers.getValue(_local_5.id);
                        if (_local_6 != null)
                        {
                            _local_6._Str_13994(_arg_2, _local_4);
                        }
                    }
                }
            }
            else
            {
                _local_7 = this._modActionViews.getValue(_arg_2);
                if (_local_7 != null)
                {
                    _local_7._Str_13994(_arg_2, _local_4);
                }
            }
        }

        private function sendClose(k:Array, _arg_2:int):void
        {
            if ((((k == null) || (this._moderationManager == null)) || (this._moderationManager.connection == null)))
            {
                return;
            }
            this._moderationManager.connection.send(new CloseIssuesMessageComposer(k, _arg_2));
        }

        private function sendPick(k:Array, _arg_2:Boolean, _arg_3:int, _arg_4:String):void
        {
            if ((((k == null) || (this._moderationManager == null)) || (this._moderationManager.connection == null)))
            {
                return;
            }
            this._moderationManager.connection.send(new PickIssuesMessageComposer(k, _arg_2, _arg_3, _arg_4));
        }

        private function sendCloseDefaultAction(k:int, _arg_2:Array, _arg_3:int):void
        {
            this._moderationManager.connection.send(new CloseIssueDefaultActionMessageComposer(k, _arg_2, _arg_3));
        }

        public function autoHandle(k:int):void
        {
            var _local_3:IssueBundle;
            var _local_5:IssueBundle;
            var _local_2:Array = this._bundles.getValues();
            var _local_4:int = this._moderationManager.sessionDataManager.userId;
            for each (_local_5 in _local_2)
            {
                if (((((_local_5.state == IssueMessageData._Str_8056) && (_local_5._Str_5547 == _local_4)) && (!(_local_5.id == k))) && ((_local_3 == null) || (_local_5.highestPriority < _local_3.highestPriority))))
                {
                    _local_3 = _local_5;
                }
            }
            if (_local_3 == null)
            {
                this.autoPick("issue manager pick next");
                return;
            }
            this.handleBundle(_local_3.id);
        }

        public function issuePickFailed(k:Array):Boolean
        {
            var _local_4:IssueMessageData;
            var _local_5:int;
            var _local_6:String;
            var _local_7:int;
            var _local_8:IssueBundle;
            var _local_9:IssueBundle;
            var _local_10:Array;
            var _local_11:int;
            var _local_12:int;
            var _local_13:IIssueHandler;
            if (!k)
            {
                return false;
            }
            var _local_2:Boolean;
            var _local_3:int = this._moderationManager.sessionDataManager.userId;
            for each (_local_4 in k)
            {
                _local_5 = _local_4._Str_2869;
                _local_6 = _local_4._Str_22164;
                _local_7 = _local_4._Str_5547;
                if (((!(_local_7 == -1)) && (!(_local_7 == _local_3))))
                {
                    _local_2 = true;
                }
                _local_8 = null;
                for each (_local_9 in this._bundles)
                {
                    _local_10 = _local_9._Str_7101();
                    if (_local_10 != null)
                    {
                        for each (_local_11 in _local_10)
                        {
                            if (_local_5 == _local_11)
                            {
                                _local_8 = _local_9;
                                break;
                            }
                        }
                    }
                }
                if (_local_8 != null)
                {
                    _local_12 = _local_8.id;
                    _local_13 = this._issueHandlers.getValue(_local_12);
                    if (_local_13 != null)
                    {
                        _local_13.dispose();
                    }
                    this.releaseBundle(_local_12);
                }
            }
            return _local_2;
        }

        public function setToolPreferences(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            this._windowX = k;
            this._windowY = _arg_2;
            this._windowHeight = _arg_3;
            this._windowWidth = _arg_4;
        }

        public function setCfhTopics(k:Vector.<CallForHelpCategoryData>):void
        {
            this._cfhtopics = k;
        }

        public function getCfhTopics():Vector.<CallForHelpCategoryData>
        {
            return this._cfhtopics;
        }
    }
}
