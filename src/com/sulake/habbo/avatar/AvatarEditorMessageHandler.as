package com.sulake.habbo.avatar
{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectExpiredMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectActivatedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar.WardrobeMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action.AvatarEffectMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectSelectedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectAddedMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.avatar.SaveWardrobeOutfitMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
    import com.sulake.habbo.avatar.enum.AvatarEditorInstanceId;
    import com.sulake.habbo.avatar.view.AvatarEditorNameChangeView;
    import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
    import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.avatar.GetWardrobeMessageComposer;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class AvatarEditorMessageHandler 
    {
        private var _communication:IHabboCommunicationManager;
        private var _controller:HabboAvatarEditorManager;

        public function AvatarEditorMessageHandler(k:HabboAvatarEditorManager, _arg_2:IHabboCommunicationManager)
        {
            this._controller = k;
            this._communication = _arg_2;
            this._communication.addHabboConnectionMessageEvent(new AvatarEffectExpiredMessageEvent(this.onAvatarEffectExpired));
            this._communication.addHabboConnectionMessageEvent(new AvatarEffectActivatedMessageEvent(this._Str_17365));
            this._communication.addHabboConnectionMessageEvent(new WardrobeMessageEvent(this._Str_25446));
            this._communication.addHabboConnectionMessageEvent(new CheckUserNameResultMessageEvent(this._Str_18696));
            this._communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
            this._communication.addHabboConnectionMessageEvent(new AvatarEffectMessageEvent(this._Str_22375));
            this._communication.addHabboConnectionMessageEvent(new AvatarEffectSelectedMessageEvent(this._Str_22833));
            this._communication.addHabboConnectionMessageEvent(new AvatarEffectAddedMessageEvent(this._Str_18461));
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
            var _local_3:SaveWardrobeOutfitMessageComposer = new SaveWardrobeOutfitMessageComposer(k, _arg_2.figure, _arg_2.gender);
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
            this._communication.connection.send(new CheckUserNameMessageComposer(k));
        }

        private function _Str_18696(k:CheckUserNameResultMessageEvent):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller.getEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:AvatarEditorNameChangeView = _local_2.view._Str_22767;
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:CheckUserNameResultMessageParser = k.getParser();
            if (_local_4.resultCode == ChangeUserNameResultMessageEvent.NAME_OK)
            {
                _local_3._Str_16320 = _local_4.name;
            }
            else
            {
                _local_3._Str_14489(_local_4.resultCode, _local_4.name, _local_4.nameSuggestions);
            }
        }

        public function _Str_22376():void
        {
            if (this._communication == null)
            {
                return;
            }
            var k:GetWardrobeMessageComposer = new GetWardrobeMessageComposer();
            this._communication.connection.send(k);
            k.dispose();
            k = null;
        }

        private function _Str_25446(k:WardrobeMessageEvent):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller.getEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
            if (_local_2)
            {
                _local_2.wardrobe._Str_15301(k.state, k._Str_17746);
            }
        }

        private function onUserRights(k:UserRightsMessageEvent):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller.getEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
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
            var _local_2:HabboAvatarEditor = this._controller.getEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
            if (_local_2)
            {
                _local_2.effects.reset();
            }
        }

        private function _Str_17365(k:AvatarEffectActivatedMessageEvent):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller.getEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
            if (_local_2)
            {
                _local_2.effects.reset();
                _local_2.figureData.avatarEffectType = k.getParser().type;
                _local_2.figureData.updateView();
            }
        }

        private function onAvatarEffectExpired(k:AvatarEffectExpiredMessageEvent):void
        {
            var _local_3:int;
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller.getEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
            if (_local_2)
            {
                _local_2.effects.reset();
                _local_3 = k.getParser().type;
                if (_local_2.figureData.avatarEffectType == _local_3)
                {
                    _local_2.figureData.avatarEffectType = -1;
                    _local_2.figureData.updateView();
                }
            }
        }

        private function _Str_22375(k:AvatarEffectMessageEvent):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller.getEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
            if ((((_local_2) && (!(this._controller.roomDesktop == null))) && (k.getParser().userId == this._controller.roomDesktop.roomSession.ownUserRoomId)))
            {
                _local_2.figureData.avatarEffectType = k.getParser().effectId;
                _local_2.figureData.updateView();
            }
        }

        private function _Str_22833(k:AvatarEffectExpiredMessageEvent):void
        {
            if (((k == null) || (!(this._controller))))
            {
                return;
            }
            var _local_2:HabboAvatarEditor = this._controller.getEditor(AvatarEditorInstanceId.OWN_AVATAR_EDITOR);
            if (_local_2)
            {
                _local_2.figureData.avatarEffectType = k.getParser().type;
                _local_2.figureData.updateView();
            }
        }
    }
}
