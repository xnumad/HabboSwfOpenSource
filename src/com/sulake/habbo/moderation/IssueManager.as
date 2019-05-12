package com.sulake.habbo.moderation
{
    import com.sulake.core.utils.Map;
    import flash.utils.Timer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CallForHelpCategoryData;
    import flash.events.TimerEvent;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_2484;
    import com.sulake.habbo.communication.messages.outgoing.moderator.ReleaseIssuesMessageComposer;
    import com.sulake.habbo.sound.HabboSoundConstants;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_7202;
    import com.sulake.habbo.utils.StringUtil;
    import com.sulake.habbo.communication.messages.incoming.callforhelp._Str_6380;
    import com.sulake.habbo.communication.messages.outgoing.moderator.CloseIssuesMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.moderator.PickIssuesMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.moderator.CloseIssueDefaultActionMessageComposer;

    public class IssueManager 
    {
        public static const ISSUE_BUNDLE_OPEN:String = "issue_bundle_open";
        public static const ISSUE_BUNDLE_MY:String = "issue_bundle_my";
        public static const ISSUE_BUNDLE_PICKED:String = "issue_bundle_picked";
        public static const _Str_16952:int = 15000;
        public static const _Str_17442:int = 1;
        public static const _Str_18516:int = 3;

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
            this._priorityUpdater = new Timer(_Str_16952, 0);
            this._priorityUpdater.addEventListener(TimerEvent.TIMER, this._Str_19194);
            this._priorityUpdater.start();
        }

        public function get _Str_25472():int
        {
            return this._issueListLimit;
        }

        public function init():void
        {
            this._issueBrowser.show();
        }

        public function _Str_21541(k:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:int=0):void
        {
            var _local_5:IssueBundle = (this._bundles.getValue(k) as IssueBundle);
            if (_local_5 == null)
            {
                return;
            }
            this._Str_20250(_local_5._Str_7101(), _arg_3, _arg_4, _arg_2);
            this._handleQueue = this._handleQueue.concat(_local_5._Str_7101());
        }

        public function _Str_15446(k:String, _arg_2:Boolean=false, _arg_3:int=0):void
        {
            var _local_5:IssueBundle;
            var _local_6:IssueBundle;
            var _local_4:Array = this._bundles.getValues();
            for each (_local_6 in _local_4)
            {
                if (((_local_6.state == _Str_2484._Str_5035) && ((_local_5 == null) || (this._Str_25768(_local_6, _local_5)))))
                {
                    _local_5 = _local_6;
                }
            }
            if (_local_5 == null)
            {
                return;
            }
            this._Str_21541(_local_5.id, k, _arg_2, _arg_3);
        }

        private function _Str_25768(k:IssueBundle, _arg_2:IssueBundle):Boolean
        {
            if (k.highestPriority < _arg_2.highestPriority)
            {
                return true;
            }
            return (k.highestPriority == _arg_2.highestPriority) && (k.issueAgeInMilliseconds < _arg_2.issueAgeInMilliseconds);
        }

        public function _Str_23549():void
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
                if (((_local_3.state == _Str_2484._Str_8056) && (_local_3._Str_5547 == k)))
                {
                    _local_2 = _local_2.concat(_local_3._Str_7101());
                }
            }
            this._Str_19424(_local_2);
        }

        public function _Str_17732(k:int):void
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
            this._Str_19424(_local_2._Str_7101());
        }

        private function _Str_19424(k:Array):void
        {
            if (((((k == null) || (k.length == 0)) || (this._moderationManager == null)) || (this._moderationManager.connection == null)))
            {
                return;
            }
            this._moderationManager.connection.send(new ReleaseIssuesMessageComposer(k));
            this._releaseQueue = this._releaseQueue.concat(k);
        }

        public function _Str_4375(k:_Str_2484):void
        {
            if (this._issues[k._Str_2869] != null)
            {
                return;
            }
            if (((this._issueBrowser == null) || (!(this._issueBrowser.isOpen()))))
            {
                this._moderationManager.soundManager._Str_4375(HabboSoundConstants.CALL_FOR_HELP);
            }
        }

        public function _Str_12118(k:_Str_2484):void
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
                        _local_3._Str_12118(k);
                    }
                    else
                    {
                        _local_3._Str_11063(k._Str_2869);
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
            if (k.state == _Str_2484._Str_17136)
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
                        _local_3._Str_12118(k);
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
                this._Str_16335(_local_3.id);
                _local_5 = this._moderationManager.sessionDataManager.userId;
                if (_local_5 != k._Str_5547)
                {
                    if (k.state == _Str_2484._Str_8056)
                    {
                        this._Str_22925(_local_3.id);
                    }
                }
            }
            if (k.state == _Str_2484._Str_5035)
            {
                _local_6 = this._Str_15829(ISSUE_BUNDLE_MY);
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
                    this._Str_20250([k._Str_2869], false, 0, ("matches bundle with issue: " + _local_8._Str_5216()._Str_2869));
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

        public function _Str_11063(k:int):void
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
                    _local_3._Str_11063(k);
                    if (_local_3._Str_20055() == 0)
                    {
                        this._bundles.remove(_local_3.id);
                    }
                }
            }
            this._issues.remove(k);
            this._issueBrowser.update();
        }

        public function _Str_15829(k:String):Array
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
                        if (_local_4.state == _Str_2484._Str_5035)
                        {
                            _local_2.push(_local_4);
                        }
                        break;
                    case ISSUE_BUNDLE_MY:
                        if (((_local_4.state == _Str_2484._Str_8056) && (_local_4._Str_5547 == _local_3)))
                        {
                            _local_2.push(_local_4);
                        }
                        break;
                    case ISSUE_BUNDLE_PICKED:
                        if (((_local_4.state == _Str_2484._Str_8056) && (!(_local_4._Str_5547 == _local_3))))
                        {
                            _local_2.push(_local_4);
                        }
                        break;
                }
            }
            return _local_2;
        }

        public function _Str_16335(k:int):void
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

        public function _Str_22925(k:int):void
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

        public function _Str_21923(k:int, _arg_2:int):void
        {
            var _local_3:IssueBundle = (this._bundles.getValue(k) as IssueBundle);
            if (_local_3 == null)
            {
                return;
            }
            this._Str_24743(_local_3._Str_7101(), _arg_2);
        }

        public function _Str_23846(k:int, _arg_2:int):void
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
            this._Str_24279(_local_4, _local_5, _arg_2);
        }

        public function _Str_16247(k:int, _arg_2:int):void
        {
            var _local_3:IssueBundle = (this._bundles.getValue(k) as IssueBundle);
            if (_local_3 == null)
            {
                return;
            }
            if (_local_3._Str_5216() != null)
            {
                this._moderationManager.connection.send(new _Str_7202(_local_3._Str_5216()._Str_2869, -1, _arg_2));
            }
        }

        public function _Str_24176(k:int, _arg_2:int):void
        {
            this._moderationManager.connection.send(new _Str_7202(-1, k, _arg_2));
        }

        public function _Str_24202(k:int, _arg_2:int, _arg_3:_Str_6380):void
        {
            var _local_5:IssueBundle;
            var _local_6:IIssueHandler;
            var _local_7:ModActionCtrl;
            var _local_4:String = (_arg_3.name + ((_arg_3._Str_25147) ? " (avatar) " : " "));
            if (_arg_3._Str_16119 > 24)
            {
                _local_4 = (_local_4 + ((_arg_3._Str_16119 / 24) + " days"));
            }
            else
            {
                _local_4 = (_local_4 + (_arg_3._Str_16119 + "h"));
            }
            if (!StringUtil.isEmpty(_arg_3._Str_20573))
            {
                _local_4 = (_local_4 + (" & " + _arg_3._Str_20573));
            }
            if (!StringUtil.isEmpty(_arg_3._Str_19607))
            {
                _local_4 = (_local_4 + (" & " + _arg_3._Str_19607));
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

        private function _Str_24743(k:Array, _arg_2:int):void
        {
            if ((((k == null) || (this._moderationManager == null)) || (this._moderationManager.connection == null)))
            {
                return;
            }
            this._moderationManager.connection.send(new CloseIssuesMessageComposer(k, _arg_2));
        }

        private function _Str_20250(k:Array, _arg_2:Boolean, _arg_3:int, _arg_4:String):void
        {
            if ((((k == null) || (this._moderationManager == null)) || (this._moderationManager.connection == null)))
            {
                return;
            }
            this._moderationManager.connection.send(new PickIssuesMessageComposer(k, _arg_2, _arg_3, _arg_4));
        }

        private function _Str_24279(k:int, _arg_2:Array, _arg_3:int):void
        {
            this._moderationManager.connection.send(new CloseIssueDefaultActionMessageComposer(k, _arg_2, _arg_3));
        }

        public function _Str_25931(k:int):void
        {
            var _local_3:IssueBundle;
            var _local_5:IssueBundle;
            var _local_2:Array = this._bundles.getValues();
            var _local_4:int = this._moderationManager.sessionDataManager.userId;
            for each (_local_5 in _local_2)
            {
                if (((((_local_5.state == _Str_2484._Str_8056) && (_local_5._Str_5547 == _local_4)) && (!(_local_5.id == k))) && ((_local_3 == null) || (_local_5.highestPriority < _local_3.highestPriority))))
                {
                    _local_3 = _local_5;
                }
            }
            if (_local_3 == null)
            {
                this._Str_15446("issue manager pick next");
                return;
            }
            this._Str_16335(_local_3.id);
        }

        public function _Str_25696(k:Array):Boolean
        {
            var _local_4:_Str_2484;
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
                    this._Str_17732(_local_12);
                }
            }
            return _local_2;
        }

        public function _Str_21909(k:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            this._windowX = k;
            this._windowY = _arg_2;
            this._windowHeight = _arg_3;
            this._windowWidth = _arg_4;
        }

        public function _Str_23714(k:Vector.<CallForHelpCategoryData>):void
        {
            this._cfhtopics = k;
        }

        public function _Str_24441():Vector.<CallForHelpCategoryData>
        {
            return this._cfhtopics;
        }
    }
}
