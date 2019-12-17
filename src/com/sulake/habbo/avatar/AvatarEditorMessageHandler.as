package com.sulake.habbo.avatar
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_5345;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_5720;
    import com.sulake.habbo.communication.messages.incoming.avatar._Str_9393;
    import com.sulake.habbo.communication.messages.incoming.avatar._Str_6232;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action.RoomUserEffectEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_12022;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect._Str_6944;
    import com.sulake.habbo.communication.messages.outgoing._Str_411._Str_7177;
    import com.sulake.habbo.communication.messages.outgoing._Str_411._Str_7887;
    import com.sulake.habbo.avatar.enum.AvatarEditorInstanceId;
    import com.sulake.habbo.avatar.view.AvatarEditorNameChangeView;
    import com.sulake.habbo.communication.messages.parser.avatar._Str_6537;
    import com.sulake.habbo.communication.messages.incoming.avatar.ChangeNameUpdateEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_411._Str_7827;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class AvatarEditorMessageHandler 
    {
        private var _communication:IHabboCommunicationManager;
        private var _controller:HabboAvatarEditorManager;

        public function AvatarEditorMessageHandler(k:HabboAvatarEditorManager, _arg_2:IHabboCommunicationManager)
        {
            this._controller = k;
            this._communication = _arg_2;
            this._communication.addHabboConnectionMessageEvent(new _Str_5345(this._Str_17996));
            this._communication.addHabboConnectionMessageEvent(new _Str_5720(this._Str_17365));
            this._communication.addHabboConnectionMessageEvent(new _Str_9393(this._Str_25446));
            this._communication.addHabboConnectionMessageEvent(new _Str_6232(this._Str_18696));
            this._communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this._Str_4297));
            this._communication.addHabboConnectionMessageEvent(new RoomUserEffectEvent(this._Str_22375));
            this._communication.addHabboConnectionMessageEvent(new _Str_12022(this._Str_22833));
            this._communication.addHabboConnectionMessageEvent(new _Str_6944(this._Str_18461));
        }

        public function dispose():void
        {
            this._communication = null;
            this._controller = null;
        }

        public function _Str_25374(k:int, _arg_2:IOutfit):void
        {
            if (this._communication == null)
            {
                return;
            }
            var _local_3:_Str_7177 = new _Str_7177(k, _arg_2.figure, _arg_2.gender);
            this._communication.connection.send(_local_3);
            _local_3.dispose();
            _local_3 = null;
        }

        public function checkName(k:String):void
        {
            if (this._communication == null)
            {
                return;
            }
            this._communication.connection.send(new _Str_7887(k));
        }

        private function _Str_18696(k:_Str_6232):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller._Str_6435(AvatarEditorInstanceId._Str_3350);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:AvatarEditorNameChangeView = _local_2.view._Str_22767;
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:_Str_6537 = k.getParser();
            if (_local_4._Str_3278 == ChangeNameUpdateEvent._Str_5797)
            {
                _local_3._Str_16320 = _local_4.name;
            }
            else
            {
                _local_3._Str_14489(_local_4._Str_3278, _local_4.name, _local_4._Str_14643);
            }
        }

        public function _Str_22376():void
        {
            if (this._communication == null)
            {
                return;
            }
            var k:_Str_7827 = new _Str_7827();
            this._communication.connection.send(k);
            k.dispose();
            k = null;
        }

        private function _Str_25446(k:_Str_9393):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller._Str_6435(AvatarEditorInstanceId._Str_3350);
            if (_local_2)
            {
                _local_2.wardrobe._Str_15301(k.state, k._Str_17746);
            }
        }

        private function _Str_4297(k:UserRightsMessageEvent):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller._Str_6435(AvatarEditorInstanceId._Str_3350);
            if (_local_2)
            {
                _local_2.clubMemberLevel = k.clubLevel;
                _local_2.update();
            }
        }

        private function _Str_18461(k:IMessageEvent):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller._Str_6435(AvatarEditorInstanceId._Str_3350);
            if (_local_2)
            {
                _local_2.effects.reset();
            }
        }

        private function _Str_17365(k:_Str_5720):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller._Str_6435(AvatarEditorInstanceId._Str_3350);
            if (_local_2)
            {
                _local_2.effects.reset();
                _local_2.figureData.avatarEffectType = k.getParser().type;
                _local_2.figureData._Str_2491();
            }
        }

        private function _Str_17996(k:_Str_5345):void
        {
            var _local_3:int;
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller._Str_6435(AvatarEditorInstanceId._Str_3350);
            if (_local_2)
            {
                _local_2.effects.reset();
                _local_3 = k.getParser().type;
                if (_local_2.figureData.avatarEffectType == _local_3)
                {
                    _local_2.figureData.avatarEffectType = -1;
                    _local_2.figureData._Str_2491();
                }
            }
        }

        private function _Str_22375(k:RoomUserEffectEvent):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller._Str_6435(AvatarEditorInstanceId._Str_3350);
            if ((((_local_2) && (!(this._controller._Str_6647 == null))) && (k.getParser().userId == this._controller._Str_6647.roomSession._Str_3871)))
            {
                _local_2.figureData.avatarEffectType = k.getParser()._Str_6815;
                _local_2.figureData._Str_2491();
            }
        }

        private function _Str_22833(k:_Str_5345):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller._Str_6435(AvatarEditorInstanceId._Str_3350);
            if (_local_2)
            {
                _local_2.figureData.avatarEffectType = k.getParser().type;
                _local_2.figureData._Str_2491();
            }
        }
    }
}
