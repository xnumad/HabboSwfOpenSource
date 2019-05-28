package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_2484;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CallForHelpCategoryData;
    import com.sulake.habbo.communication.messages.incoming.callforhelp._Str_3509;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_10432;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_9842;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_12438;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_4767;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_11592;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_12485;
    import com.sulake.habbo.utils.StringUtil;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_7103;
    import com.sulake.habbo.window.utils._Str_2418;

    public class ModActionCtrl implements IDisposable, ITrackedWindow 
    {
        private static var _Str_3610:Array;
        private static var _Str_8886:Map;

        private var _Str_2327:ModerationManager;
        private var _Str_4127:int;
        private var _Str_7866:String;
        private var _Str_3598:_Str_2484;
        private var _frame:IFrameWindow;
        private var _Str_3643:IDropMenuWindow;
        private var _Str_5384:Array;
        private var _Str_8957:IDropMenuWindow;
        private var _Str_3121:ITextFieldWindow;
        private var _disposed:Boolean;
        private var _Str_9258:UserInfoCtrl;

        public function ModActionCtrl(k:ModerationManager, _arg_2:int, _arg_3:String, _arg_4:_Str_2484, _arg_5:UserInfoCtrl)
        {
            this._Str_2327 = k;
            this._Str_4127 = _arg_2;
            this._Str_7866 = _arg_3;
            this._Str_3598 = _arg_4;
            this._Str_9258 = _arg_5;
            if (_Str_3610 == null)
            {
                _Str_3610 = new Array();
                _Str_3610.push(new ModActionDefinition(1, "Alert", ModActionDefinition.ALERT, 1, 0));
                _Str_3610.push(new ModActionDefinition(2, "Mute 1h", ModActionDefinition.MUTE, 2, 0));
                _Str_3610.push(new ModActionDefinition(3, "Ban 18h", ModActionDefinition._Str_5684, 3, 0));
                _Str_3610.push(new ModActionDefinition(4, "Ban 7 days", ModActionDefinition._Str_5684, 4, 0));
                _Str_3610.push(new ModActionDefinition(5, "Ban 30 days (step 1)", ModActionDefinition._Str_5684, 5, 0));
                _Str_3610.push(new ModActionDefinition(7, "Ban 30 days (step 2)", ModActionDefinition._Str_5684, 7, 0));
                _Str_3610.push(new ModActionDefinition(6, "Ban 100 years", ModActionDefinition._Str_5684, 6, 0));
                _Str_3610.push(new ModActionDefinition(106, "Ban avatar-only 100 years", ModActionDefinition._Str_5684, 6, 0));
                _Str_3610.push(new ModActionDefinition(101, "Kick", ModActionDefinition._Str_13808, 0, 0));
                _Str_3610.push(new ModActionDefinition(102, "Lock trade 1 week", ModActionDefinition._Str_10699, 0, 168));
                _Str_3610.push(new ModActionDefinition(104, "Lock trade permanent", ModActionDefinition._Str_10699, 0, 876000));
                _Str_3610.push(new ModActionDefinition(105, "Message", ModActionDefinition.MESSAGE, 0, 0));
            }
            this._Str_2327.issueManager._Str_24021(this._Str_4127, this);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function show():void
        {
            this._frame = IFrameWindow(this._Str_2327.getXmlWindow("modact_summary"));
            this._frame.caption = ("Mod action on: " + this._Str_7866);
            this._frame.findChildByName("custom_sanction_button").procedure = this._Str_23444;
            this._Str_3121 = ITextFieldWindow(this._frame.findChildByName("message_input"));
            this._frame.findChildByName("default_sanction_button").procedure = this._Str_23397;
            this._frame.findChildByName("default_sanction_button").disable();
            this._Str_25741();
            this._Str_17163();
            this._Str_24470();
            var k:IWindow = this._frame.findChildByTag("close");
            k.procedure = this._Str_2392;
            this._frame.visible = true;
        }

        public function getType():int
        {
            return WindowTracker._Str_18770;
        }

        public function getId():String
        {
            return this._Str_7866;
        }

        public function _Str_2259():IFrameWindow
        {
            return this._frame;
        }

        private function _Str_8724(k:String, _arg_2:String=""):void
        {
            if (this._Str_9258 != null)
            {
                this._Str_9258._Str_8724(k, _arg_2);
            }
        }

        private function _Str_3066(k:String):void
        {
            if (((!(this._Str_9258 == null)) && (!(this._Str_9258.disposed))))
            {
                this._Str_9258._Str_3066(("modAction_" + k));
            }
        }

        private function _Str_25741():void
        {
            var k:String;
            var _local_2:Array;
            var _local_3:int;
            var _local_4:Array;
            var _local_5:int;
            var _local_6:int;
            if (_Str_8886 == null)
            {
                _Str_8886 = new Map();
                k = this._Str_2327.getProperty("cfh.topic_id.to.sanction_type_id");
                if (k != null)
                {
                    _local_2 = k.split(",");
                    _local_3 = 0;
                    while (_local_3 < _local_2.length)
                    {
                        _local_4 = _local_2[_local_3].split("=");
                        if (_local_4.length == 2)
                        {
                            _local_5 = parseInt(String(_local_4[0]));
                            _local_6 = parseInt(String(_local_4[1]));
                            _Str_8886.add(_local_5, _local_6);
                        }
                        _local_3++;
                    }
                }
            }
        }

        private function _Str_17163():void
        {
            var _local_3:CallForHelpCategoryData;
            var _local_4:_Str_3509;
            this._Str_3643 = IDropMenuWindow(this._frame.findChildByName("cfh_topics"));
            this._Str_3643.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_17950);
            this._Str_5384 = [];
            var k:Array = [];
            var _local_2:int;
            for each (_local_3 in this._Str_2327.issueManager._Str_24441())
            {
                for each (_local_4 in _local_3._Str_14841)
                {
                    k[_local_2] = (("${help.cfh.topic." + _local_4.id) + "}");
                    this._Str_5384[_local_2] = _local_4.id;
                    _local_2++;
                }
            }
            this._Str_3643.populate(k);
        }

        private function _Str_17950(k:WindowEvent):void
        {
            var _local_5:int;
            var _local_2:int = this._Str_3643.selection;
            var _local_3:int = this._Str_5384[_local_2];
            var _local_4:int = _Str_8886.getValue(_local_3);
            if (!_local_4)
            {
                _local_4 = _Str_8886.getValue(0);
            }
            if (_local_4)
            {
                _local_5 = 0;
                while (_local_5 < _Str_3610.length)
                {
                    if (_Str_3610[_local_5].actionId == _local_4)
                    {
                        this._Str_8957.selection = _local_5;
                        break;
                    }
                    _local_5++;
                }
            }
            else
            {
                this._Str_8957.selection = -1;
            }
            this._Str_2327.issueManager._Str_24176(this._Str_4127, _local_3);
        }

        public function _Str_13994(k:int, _arg_2:String):void
        {
            if (((this._frame == null) || (!(k == this._Str_4127))))
            {
                return;
            }
            var _local_3:ITextWindow = (this._frame.findChildByName("default_sanction_label") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.caption = _arg_2;
            }
            this._frame.findChildByName("default_sanction_button").enable();
        }

        private function _Str_24470():void
        {
            var _local_2:ModActionDefinition;
            this._Str_8957 = IDropMenuWindow(this._frame.findChildByName("sanction_type"));
            var k:Array = [];
            for each (_local_2 in _Str_3610)
            {
                k.push(_local_2.name);
            }
            this._Str_8957.populate(k);
        }

        private function _Str_23397(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (this._Str_3643.selection < 0)
            {
                this._Str_2327.windowManager.alert("Alert", "Please select a topic.", 0, this._Str_3168);
                return;
            }
            Logger.log("Giving default sanction...");
            this._Str_3066("defaultAction");
            this._Str_8724("action.default");
            var _local_3:int = this._Str_5384[this._Str_3643.selection];
            this._Str_2327.connection.send(new _Str_10432(this._Str_4127, _local_3, this._Str_3121.text, this._Str_7121()));
            this.dispose();
        }

        private function _Str_23444(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:ModActionDefinition;
            var _local_5:Boolean;
            var _local_6:int;
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (this._Str_3643.selection < 0)
            {
                this._Str_2327.windowManager.alert("Alert", "Please select a topic.", 0, this._Str_3168);
                return;
            }
            if (this._Str_8957.selection < 0)
            {
                this._Str_2327.windowManager.alert("Alert", "Please select a sanction.", 0, this._Str_3168);
                return;
            }
            var _local_3:int = this._Str_5384[this._Str_3643.selection];
            _local_4 = _Str_3610[this._Str_8957.selection];
            switch (_local_4.actionType)
            {
                case ModActionDefinition.ALERT:
                    if (!this._Str_2327._Str_3325._Str_18465)
                    {
                        this._Str_2327.windowManager.alert("Alert", "You have insufficient permissions.", 0, this._Str_3168);
                        return;
                    }
                    this._Str_3066("sendCaution");
                    this._Str_2327.connection.send(new _Str_9842(this._Str_4127, this._Str_3121.text, _local_3, this._Str_7121()));
                    break;
                case ModActionDefinition.MUTE:
                    this._Str_3066("mute");
                    this._Str_2327.connection.send(new _Str_12438(this._Str_4127, this._Str_3121.text, _local_3, this._Str_7121()));
                    break;
                case ModActionDefinition._Str_5684:
                    if (!this._Str_2327._Str_3325._Str_21242)
                    {
                        this._Str_2327.windowManager.alert("Alert", "You have insufficient permissions.", 0, this._Str_3168);
                        return;
                    }
                    this._Str_3066("ban");
                    _local_5 = (_local_4.actionId == 106);
                    this._Str_2327.connection.send(new _Str_4767(this._Str_4127, this._Str_3121.text, _local_3, _local_4._Str_22995, _local_5, this._Str_7121()));
                    break;
                case ModActionDefinition._Str_13808:
                    if (!this._Str_2327._Str_3325._Str_20397)
                    {
                        this._Str_2327.windowManager.alert("Alert", "You have insufficient permissions.", 0, this._Str_3168);
                        return;
                    }
                    this._Str_3066("kick");
                    this._Str_2327.connection.send(new _Str_11592(this._Str_4127, this._Str_3121.text, _local_3, this._Str_7121()));
                    break;
                case ModActionDefinition._Str_10699:
                    this._Str_3066("trading_lock");
                    _local_6 = (_local_4._Str_25670 * 60);
                    this._Str_2327.connection.send(new _Str_12485(this._Str_4127, this._Str_3121.text, _local_6, _local_3, this._Str_7121()));
                    break;
                case ModActionDefinition.MESSAGE:
                    if (StringUtil.isEmpty(this._Str_3121.text))
                    {
                        this._Str_2327.windowManager.alert("Alert", "Please write a message to user.", 0, this._Str_3168);
                        return;
                    }
                    this._Str_3066("sendCaution");
                    this._Str_2327.connection.send(new _Str_7103(this._Str_4127, this._Str_3121.text, _local_3, this._Str_7121()));
                    break;
            }
            this._Str_8724("action.custom", "unknown");
            this.dispose();
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_3066("close");
            this.dispose();
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._frame != null)
            {
                this._frame.destroy();
                this._frame = null;
            }
            this._Str_3643 = null;
            this._Str_3121 = null;
            this._Str_2327.issueManager._Str_23349(this._Str_4127);
            this._Str_2327 = null;
        }

        private function _Str_3168(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        private function _Str_7121():int
        {
            return (this._Str_3598 != null) ? this._Str_3598._Str_2869 : _Str_4767._Str_2979;
        }
    }
}
