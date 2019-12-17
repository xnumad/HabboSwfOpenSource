package com.sulake.habbo.moderation
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_9065;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_7080;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_9150;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_7889;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_9383;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_9413;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_8695;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_8088;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_7898;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_7799;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_7632;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3352;
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_9341;
    import com.sulake.habbo.communication.messages.incoming._Str_525._Str_8083;
    import com.sulake.habbo.communication.messages.incoming.callforhelp._Str_9038;
    import com.sulake.habbo.communication.messages.incoming.callforhelp._Str_5578;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_5460;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_2484;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_8164;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_5018;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_6924;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_6763;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7250;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7467;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_8106;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_8235;
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7868;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7908;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7621;
    import com.sulake.habbo.communication.messages.parser._Str_521._Str_7418;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.userclassification._Str_6854;
    import com.sulake.habbo.communication.messages.parser.callforhelp._Str_7060;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CallForHelpCategoryData;
    import com.sulake.habbo.communication.messages.parser.callforhelp.CfhTopicsInitMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4522;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_8084;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_7074;
    import com.sulake.habbo.communication.messages.incoming.moderation.*;
    import com.sulake.habbo.communication.messages.parser.moderation.*;

    public class ModerationMessageHandler 
    {
        private var _moderationManager:ModerationManager;
        private var _userInfoListeners:Array;
        private var _roomVisitsListeners:Array;
        private var _userClassificationListener:Array;
        private var _chatlogListeners:Array;
        private var _roomInfoListeners:Array;
        private var _roomEnterListeners:Array;

        public function ModerationMessageHandler(k:ModerationManager)
        {
            this._userInfoListeners = new Array();
            this._roomVisitsListeners = new Array();
            this._userClassificationListener = new Array();
            this._chatlogListeners = new Array();
            this._roomInfoListeners = new Array();
            this._roomEnterListeners = new Array();
            super();
            this._moderationManager = k;
            var _local_2:IConnection = k.connection;
            _local_2.addMessageEvent(new _Str_9065(this._Str_25409));
            _local_2.addMessageEvent(new _Str_7080(this._Str_25229));
            _local_2.addMessageEvent(new _Str_9150(this._Str_25829));
            _local_2.addMessageEvent(new _Str_7889(this._Str_24562));
            _local_2.addMessageEvent(new _Str_9383(this._Str_24440));
            _local_2.addMessageEvent(new _Str_9413(this._Str_3746));
            _local_2.addMessageEvent(new _Str_8695(this._Str_4428));
            _local_2.addMessageEvent(new _Str_8088(this._Str_22300));
            _local_2.addMessageEvent(new _Str_7898(this._Str_25868));
            _local_2.addMessageEvent(new _Str_7799(this._Str_22589));
            _local_2.addMessageEvent(new _Str_7632(this._Str_16877));
            _local_2.addMessageEvent(new _Str_2752(this.onCreditBalance));
            _local_2.addMessageEvent(new _Str_3352(this._Str_2960));
            _local_2.addMessageEvent(new _Str_9341(this._Str_24593));
            _local_2.addMessageEvent(new _Str_8083(this._Str_25353));
            _local_2.addMessageEvent(new _Str_9038(this._Str_23004));
            _local_2.addMessageEvent(new _Str_5578(this._Str_17604));
        }

        private function _Str_25409(k:_Str_9065):void
        {
            if (((k == null) || (this._moderationManager == null)))
            {
                return;
            }
            var _local_2:_Str_5460 = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_2484 = _local_2._Str_22192;
            this._moderationManager.issueManager._Str_4375(_local_3);
            this._moderationManager.issueManager._Str_12118(_local_3);
        }

        private function _Str_25229(k:_Str_7080):void
        {
            var _local_6:_Str_2484;
            if (((k == null) || (this._moderationManager == null)))
            {
                return;
            }
            var _local_2:_Str_8164 = k.getParser();
            if (((_local_2 == null) || (_local_2.data == null)))
            {
                return;
            }
            var _local_3:_Str_5018 = _local_2.data;
            var _local_4:Array = _local_3.issues;
            var _local_5:Array = _local_3._Str_15690;
            for each (_local_6 in _local_4)
            {
                this._moderationManager.issueManager._Str_12118(_local_6);
            }
            this._moderationManager.issueManager._Str_19194();
            this._moderationManager._Str_3325 = _local_3;
            this._moderationManager._Str_17887.show();
        }

        private function _Str_25829(k:_Str_9150):void
        {
            var _local_2:_Str_6924;
            if (((this._moderationManager) && (this._moderationManager.issueManager)))
            {
                _local_2 = k.getParser();
                this._moderationManager.issueManager._Str_21909(_local_2._Str_17736, _local_2._Str_18137, _local_2._Str_17903, _local_2._Str_4971);
            }
        }

        private function _Str_24562(event:_Str_7889):void
        {
            var parser:_Str_6763 = event.getParser();
            if (parser == null)
            {
                return;
            }
            var alert:Boolean = true;
            var issues:Array = parser.issues;
            var retryEnabled:Boolean = parser.retryEnabled;
            var retryCount:int = parser.retryCount;
            var pickedAlready:Boolean = this._moderationManager.issueManager._Str_25696(issues);
            if (pickedAlready)
            {
                if (retryEnabled)
                {
                    if (retryCount < 10)
                    {
                        alert = false;
                        this._moderationManager.issueManager._Str_15446("pick failed retry", retryEnabled, retryCount);
                    }
                }
            }
            if (alert)
            {
                this._moderationManager.windowManager.alert("Error", "Issue picking failed", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                {
                    k.dispose();
                });
            }
        }

        private function _Str_24440(k:_Str_9383):void
        {
            if (((k == null) || (this._moderationManager == null)))
            {
                return;
            }
            var _local_2:_Str_7250 = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            this._moderationManager.issueManager._Str_11063(_local_2._Str_2869);
        }

        private function _Str_3746(k:_Str_9413):void
        {
            var _local_3:IUserInfoListener;
            var _local_2:_Str_7467 = k.getParser();
            Logger.log(((("GOT USER INFO: " + _local_2.data.userId) + ", ") + _local_2.data._Str_16987));
            for each (_local_3 in this._userInfoListeners)
            {
                _local_3._Str_3746(_local_2.data);
            }
        }

        private function _Str_4428(k:_Str_8695):void
        {
            var _local_3:RoomToolCtrl;
            var _local_2:_Str_8106 = k.getParser();
            for each (_local_3 in this._roomInfoListeners)
            {
                _local_3._Str_4428(_local_2.data);
            }
        }

        private function _Str_22300(k:_Str_8088):void
        {
            var _local_2:_Str_8235 = k.getParser();
            var _local_3:Array = new Array();
            _local_3.push(_local_2.data._Str_17106);
            var _local_4:Dictionary = new Dictionary();
            _local_4[_local_2.data._Str_23592] = 0;
            _local_4[_local_2.data._Str_2662] = 1;
            this._Str_6773(("Call For Help Evidence #" + _local_2.data._Str_20325), WindowTracker._Str_15411, _local_2.data.callId, _local_3, _local_4);
        }

        private function _Str_22589(k:_Str_7799):void
        {
            var _local_2:_Str_7868 = k.getParser();
            var _local_3:Array = new Array();
            _local_3.push(_local_2.data);
            var _local_4:Dictionary = new Dictionary();
            this._Str_6773(("Room Chatlog: " + _local_2.data.roomName), WindowTracker._Str_10414, _local_2.data.roomId, _local_3, _local_4);
        }

        private function _Str_25868(k:_Str_7898):void
        {
            var _local_2:_Str_7908 = k.getParser();
            var _local_3:Dictionary = new Dictionary();
            _local_3[_local_2.data.userId] = 0;
            this._Str_6773(("User Chatlog: " + _local_2.data.userName), WindowTracker._Str_15435, _local_2.data.userId, _local_2.data.rooms, _local_3);
        }

        private function _Str_6773(k:String, _arg_2:int, _arg_3:int, _arg_4:Array, _arg_5:Dictionary):void
        {
            var _local_7:IChatLogListener;
            var _local_6:Array = this._chatlogListeners.concat();
            for each (_local_7 in _local_6)
            {
                _local_7._Str_6773(k, _arg_2, _arg_3, _arg_4, _arg_5);
            }
        }

        private function _Str_16877(k:_Str_7632):void
        {
            var _local_3:RoomVisitsCtrl;
            var _local_2:_Str_7621 = k.getParser();
            var _local_4:Array = this._roomVisitsListeners.concat();
            for each (_local_3 in _local_4)
            {
                _local_3._Str_16877(_local_2.data);
            }
        }

        private function _Str_25353(k:_Str_8083):void
        {
            var _local_3:UserClassificationCtrl;
            var _local_8:int;
            var _local_9:UserClassificationCtrl;
            var _local_10:Array;
            var _local_2:_Str_7418 = (k as _Str_8083).getParser();
            var _local_4:Map = _local_2._Str_24757;
            var _local_5:Map = _local_2._Str_24895;
            var _local_6:int = 1;
            var _local_7:Array = new Array();
            for each (_local_8 in _local_4.getKeys())
            {
                _local_7.push(new _Str_6854(_local_8, _local_4[_local_8], _local_5[_local_8]));
            }
            _local_9 = new UserClassificationCtrl(this._moderationManager, _local_6);
            _local_9.show();
            _local_10 = this._userClassificationListener.concat();
            for each (_local_3 in _local_10)
            {
                _local_3._Str_22627(_local_6, _local_7);
            }
        }

        private function _Str_23004(k:_Str_9038):void
        {
            var _local_2:_Str_7060 = k.getParser();
            Logger.log(("Got sanction data..." + [_local_2._Str_2869, _local_2.accountId, _local_2._Str_21198]));
            this._moderationManager.issueManager._Str_24202(_local_2._Str_2869, _local_2.accountId, _local_2._Str_21198);
        }

        private function _Str_17604(k:_Str_5578):void
        {
            var _local_3:Vector.<CallForHelpCategoryData>;
            var _local_2:CfhTopicsInitMessageParser = k.getParser();
            _local_3 = _local_2._Str_9001;
            this._moderationManager._Str_22921 = _local_3;
        }

        private function onCreditBalance(k:_Str_2752):void
        {
            var _local_3:RoomToolCtrl;
            var _local_2:_Str_4522 = k.getParser();
            this._moderationManager._Str_14758 = _local_2._Str_6550;
            this._moderationManager._Str_17887._Str_25175(_local_2);
            for each (_local_3 in this._roomEnterListeners)
            {
                _local_3._Str_17211();
            }
        }

        private function _Str_2960(k:_Str_3352):void
        {
            var _local_2:RoomToolCtrl;
            this._moderationManager._Str_14758 = 0;
            this._moderationManager._Str_17887._Str_25510();
            for each (_local_2 in this._roomEnterListeners)
            {
                _local_2._Str_17211();
            }
        }

        private function _Str_24593(k:_Str_9341):void
        {
            var _local_2:_Str_8084 = k.getParser();
            Logger.log(((("GOT MOD ACTION RESULT: " + _local_2.userId) + ", ") + _local_2.success));
            if (_local_2.success)
            {
                this._moderationManager.connection.send(new _Str_7074(_local_2.userId));
            }
            else
            {
                this._moderationManager.windowManager.alert("Alert", ("Moderation action failed. " + "If you tried to ban a user, please check if the user is already banned."), 0, this._Str_3168);
            }
        }

        public function _Str_24536(k:IUserInfoListener):void
        {
            this._userInfoListeners.push(k);
        }

        public function _Str_22967(k:IUserInfoListener):void
        {
            var _local_3:IUserInfoListener;
            var _local_2:Array = new Array();
            for each (_local_3 in this._userInfoListeners)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._userInfoListeners = _local_2;
        }

        public function _Str_25444(k:RoomToolCtrl):void
        {
            this._roomInfoListeners.push(k);
        }

        public function _Str_22435(k:RoomToolCtrl):void
        {
            var _local_3:RoomToolCtrl;
            var _local_2:Array = new Array();
            for each (_local_3 in this._roomInfoListeners)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._roomInfoListeners = _local_2;
        }

        public function _Str_22442(k:RoomToolCtrl):void
        {
            this._roomEnterListeners.push(k);
        }

        public function _Str_14234(k:RoomToolCtrl):void
        {
            var _local_3:RoomToolCtrl;
            var _local_2:Array = new Array();
            for each (_local_3 in this._roomEnterListeners)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._roomEnterListeners = _local_2;
        }

        public function _Str_23596(k:RoomVisitsCtrl):void
        {
            this._roomVisitsListeners.push(k);
        }

        public function _Str_23642(k:RoomVisitsCtrl):void
        {
            var _local_3:RoomVisitsCtrl;
            var _local_2:Array = new Array();
            for each (_local_3 in this._roomVisitsListeners)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._roomVisitsListeners = _local_2;
        }

        public function _Str_20295(k:IChatLogListener):void
        {
            this._chatlogListeners.push(k);
        }

        public function _Str_24755(k:IChatLogListener):void
        {
            var _local_3:IChatLogListener;
            var _local_2:Array = new Array();
            for each (_local_3 in this._chatlogListeners)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._chatlogListeners = _local_2;
        }

        public function _Str_24655(k:UserClassificationCtrl):void
        {
            this._userClassificationListener.push(k);
        }

        public function _Str_24247(k:UserClassificationCtrl):void
        {
            var _local_3:UserClassificationCtrl;
            var _local_2:Array = new Array();
            for each (_local_3 in this._userClassificationListener)
            {
                if (_local_3 != k)
                {
                    _local_2.push(_local_3);
                }
            }
            this._roomVisitsListeners = _local_2;
        }

        private function _Str_3168(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }
    }
}
