package com.sulake.habbo.roomevents
{
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.WiredTriggerDataEvent;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents._Str_8791;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents._Str_4585;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.WiredConditionDataEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3352;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.WiredSavedEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4408;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.WiredEffectDataEvent;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents._Str_7323;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents._Str_7362;
    import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.OpenMessageComposer;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredTriggerDataMessageParser;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredEffectDataMessageParser;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredConditionDataMessageParser;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_4139;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_5317;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents._Str_7138;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents._Str_7758;
    import __AS3__.vec.*;

    public class IncomingMessages implements IDisposable 
    {
        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _messageEvents:Vector.<IMessageEvent>;

        public function IncomingMessages(k:HabboUserDefinedRoomEvents)
        {
            this._roomEvents = k;
            this._messageEvents = new Vector.<IMessageEvent>(0);
            var _local_2:IHabboCommunicationManager = this._roomEvents.communication;
            this.addMessageEvent(new WiredTriggerDataEvent(this._Str_22337));
            this.addMessageEvent(new _Str_8791(this._Str_24104));
            this.addMessageEvent(new _Str_4585(this._Str_23600));
            this.addMessageEvent(new WiredConditionDataEvent(this._Str_23144));
            this.addMessageEvent(new _Str_3352(this._Str_2960));
            this.addMessageEvent(new WiredSavedEvent(this._Str_25470));
            this.addMessageEvent(new _Str_4408(this._Str_16200));
            this.addMessageEvent(new WiredEffectDataEvent(this._Str_23979));
            this.addMessageEvent(new _Str_7323(this._Str_25729));
            this.addMessageEvent(new UserObjectEvent(this._Str_3241));
        }

        private function addMessageEvent(k:IMessageEvent):void
        {
            this._messageEvents.push(this._roomEvents.communication.addHabboConnectionMessageEvent(k));
        }

        private function _Str_24104(k:IMessageEvent):void
        {
            var _local_2:_Str_7362 = (k as _Str_8791).getParser();
            this._roomEvents.send(new OpenMessageComposer(_local_2.stuffId));
        }

        private function _Str_22337(k:IMessageEvent):void
        {
            var _local_2:WiredTriggerDataMessageParser = (k as WiredTriggerDataEvent).getParser();
            this._roomEvents._Str_7247._Str_18351(_local_2._Str_10812);
        }

        private function _Str_23979(k:IMessageEvent):void
        {
            var _local_2:WiredEffectDataMessageParser = (k as WiredEffectDataEvent).getParser();
            this._roomEvents._Str_7247._Str_18351(_local_2.definition);
        }

        private function _Str_23144(k:IMessageEvent):void
        {
            var _local_2:WiredConditionDataMessageParser = (k as WiredConditionDataEvent).getParser();
            this._roomEvents._Str_7247._Str_18351(_local_2.definition);
        }

        private function _Str_3241(k:IMessageEvent):void
        {
            var _local_2:_Str_4139 = (k as UserObjectEvent).getParser();
            this._roomEvents.userName = _local_2.name;
        }

        private function _Str_2960(k:IMessageEvent):void
        {
            this._roomEvents._Str_7247.close();
        }

        private function _Str_16200(k:IMessageEvent):void
        {
            var _local_2:_Str_5317 = (k as _Str_4408).getParser();
            Logger.log(((("Received object remove event: " + _local_2.id) + ", ") + _local_2.isExpired));
            this._roomEvents._Str_7247._Str_25654(_local_2.id);
        }

        private function _Str_23600(k:IMessageEvent):void
        {
            var _local_2:_Str_7138 = _Str_4585(k).getParser();
            if (_local_2.reason == _Str_4585._Str_18436)
            {
                this._roomEvents.windowManager.alert(this._roomEvents.localization.getLocalization("wiredfurni.rewardsuccess.title"), this._roomEvents.localization.getLocalization("wiredfurni.rewardsuccess.body"), 0, null);
            }
            else
            {
                if (_local_2.reason == _Str_4585._Str_17787)
                {
                    this._roomEvents.windowManager.alert(this._roomEvents.localization.getLocalization("wiredfurni.badgereceived.title"), this._roomEvents.localization.getLocalization("wiredfurni.badgereceived.body"), 0, null);
                }
                else
                {
                    this._roomEvents.windowManager.alert(this._roomEvents.localization.getLocalization("wiredfurni.rewardfailed.title"), this._roomEvents.localization.getLocalization(("wiredfurni.rewardfailed.reason." + _local_2.reason)), 0, null);
                }
            }
        }

        private function _Str_25729(k:IMessageEvent):void
        {
            var _local_2:_Str_7758 = _Str_7323(k).getParser();
            this._roomEvents.windowManager.alert("Update failed", _local_2.info, 0, null);
        }

        private function _Str_25470(k:IMessageEvent):void
        {
            this._roomEvents._Str_7247.close();
        }

        public function dispose():void
        {
            var _local_2:IMessageEvent;
            if (this.disposed)
            {
                return;
            }
            var k:IHabboCommunicationManager = this._roomEvents.communication;
            if (((!(this._messageEvents == null)) && (!(k == null))))
            {
                for each (_local_2 in this._messageEvents)
                {
                    k.removeHabboConnectionMessageEvent(_local_2);
                }
            }
            this._roomEvents = null;
        }

        public function get disposed():Boolean
        {
            return this._roomEvents == null;
        }
    }
}
