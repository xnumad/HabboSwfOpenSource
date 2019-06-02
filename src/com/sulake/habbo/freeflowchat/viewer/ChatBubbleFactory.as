package com.sulake.habbo.freeflowchat.viewer
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.freeflowchat.viewer.visualization.style.ChatStyleLibrary;
    import com.sulake.core.utils.Map;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.freeflowchat.viewer.visualization.style.ChatStyle;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.habbo.freeflowchat.viewer.enum.ChatColours;
    import com.sulake.habbo.freeflowchat.data.ChatItem;
    import com.sulake.habbo.freeflowchat.viewer.simulation.BlankStyle;
    import com.sulake.habbo.freeflowchat.viewer.visualization.style.IChatStyleInternal;
    import flash.utils.getTimer;
    import com.sulake.habbo.freeflowchat.viewer.simulation.ChatFlowStage;
    import com.sulake.habbo.freeflowchat.viewer.visualization.ChatBubble;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettingsParser;
    import com.sulake.habbo.freeflowchat.history.visualization.entry.ChatHistoryEntryBitmapBubble;
    import com.sulake.habbo.freeflowchat.history.visualization.entry.IChatHistoryEntryBitmap;
    import com.sulake.habbo.freeflowchat.history.visualization.entry.ChatHistoryRoomChangeEntry;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.avatar.enum.AvatarFigurePartType;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.room.utils.Vector3d;
    import __AS3__.vec.*;

    public class ChatBubbleFactory implements IGetImageListener, IAvatarImageListener 
    {
        private static const _Str_14010:int = 30;

        private var _component:HabboFreeFlowChat;
        private var _chatStyleLibrary:ChatStyleLibrary;
        private var _avatarImageCache:Map;
        private var _petImageCache:Map;
        private var _avatarColorCache:Map;
        private var _petImageIdToFigureString:Map;
        private var _imagesWaitingForDispose:Array;
        private var _chatBubblePool:Vector.<PooledChatBubble>;
        private var _accountId:int;

        public function ChatBubbleFactory(k:HabboFreeFlowChat)
        {
            this._avatarImageCache = new Map();
            this._petImageCache = new Map();
            this._avatarColorCache = new Map();
            this._petImageIdToFigureString = new Map();
            this._imagesWaitingForDispose = [];
            this._chatBubblePool = new Vector.<PooledChatBubble>(0);
            super();
            this._component = k;
            this._chatStyleLibrary = new ChatStyleLibrary(this._component.assets);
            this._accountId = this._component.sessionDataManager.userId;
        }

        public function dispose():void
        {
            this._Str_17762();
            this._imagesWaitingForDispose = [];
            this._chatStyleLibrary.dispose();
            this._chatStyleLibrary = null;
            this._component = null;
        }

        public function get disposed():Boolean
        {
            return this._component == null;
        }

        public function _Str_22521(k:ChatItem, _arg_2:Boolean=false):PooledChatBubble
        {
            var _local_4:RoomUserData;
            var _local_8:PooledChatBubble;
            var _local_10:String;
            var _local_11:IRoomObject;
            var _local_12:String;
            var _local_13:Boolean;
            var _local_14:int;
            var _local_15:int;
            var _local_16:String;
            var _local_17:String;
            var _local_18:String;
            var _local_19:String;
            var _local_20:String;
            var _local_21:String;
            var _local_3:ChatStyle = ChatStyle(this._chatStyleLibrary.getStyle(k.style));
            _local_4 = this._component.roomSessionManager.getSession(k.roomId).userDataManager.getUserDataByIndex(k.userId);
            var _local_5:String = "";
            var _local_6:uint;
            var _local_7:BitmapData = _local_3._Str_3093;
            if (((k._Str_15251) || (k._Str_14270)))
            {
                if (!_local_7)
                {
                    _local_7 = this._Str_7081(k._Str_15251);
                }
                _local_5 = k._Str_14270;
            }
            else
            {
                if (_local_4 != null)
                {
                    _local_5 = _local_4.name;
                    _local_10 = _local_4.figure;
                    _local_6 = this._avatarColorCache.getValue(_local_10);
                    if (!_local_7)
                    {
                        switch (_local_4.type)
                        {
                            case RoomObjectTypeEnum.PET:
                                _local_11 = this._component.roomEngine.getRoomObject(k.roomId, _local_4._Str_2713, RoomObjectCategoryEnum.CONST_100);
                                _local_12 = null;
                                if (_local_11 != null)
                                {
                                    _local_12 = _local_11.getModel().getString(RoomObjectVariableEnum.FIGURE_POSTURE);
                                }
                                _local_13 = true;
                                _local_14 = 32;
                                _local_15 = 2;
                                _local_7 = this.getPetImage(_local_10, _local_15, _local_13, _local_14, _local_12);
                                break;
                            case RoomObjectTypeEnum.HABBO:
                                _local_7 = this._Str_7081(_local_10);
                                break;
                        }
                    }
                }
            }
            if (k.chatType == RoomSessionChatEvent.CHAT_TYPE_RESPECT)
            {
                k.text = ((this._component.localizations) ? this._component.localizations.getLocalizationWithParams("widgets.chatbubble.respect", "", "username", _local_5) : "");
            }
            else
            {
                if (k.chatType == RoomSessionChatEvent.CHAT_TYPE_PETRESPECT)
                {
                    k.text = ((this._component.localizations) ? this._component.localizations.getLocalizationWithParams("widget.chatbubble.petrespect", "", "petname", _local_5) : "");
                }
                else
                {
                    if (k.chatType == RoomSessionChatEvent.CHAT_TYPE_PETTREAT)
                    {
                        k.text = ((this._component.localizations) ? this._component.localizations.getLocalizationWithParams("widget.chatbubble.pettreat", "", "petname", _local_5) : "");
                    }
                }
            }
            if (k.chatType == RoomSessionChatEvent.CHAT_TYPE_HAND_ITEM_RECEIVED)
            {
                _local_16 = "widget.chatbubble.handitem";
                _local_17 = this._component.localizations.getLocalization(("handitem" + k.extraParam), ("handitem" + k.extraParam));
                this._component.localizations.registerParameter(_local_16, "username", _local_5);
                this._component.localizations.registerParameter(_local_16, "handitem", _local_17);
                k.text = this._component.localizations.getLocalizationRaw(_local_16).value;
            }
            if (k.chatType == RoomSessionChatEvent._Str_8909)
            {
                _local_18 = "widget.chatbubble.mutetime";
                _local_19 = String((k.extraParam % 60));
                _local_20 = String(((k.extraParam > 0) ? Math.floor(((k.extraParam % 3600) / 60)) : 0));
                _local_21 = String(((k.extraParam > 0) ? Math.floor((k.extraParam / 3600)) : 0));
                this._component.localizations.registerParameter(_local_18, "hours", _local_21);
                this._component.localizations.registerParameter(_local_18, "minutes", _local_20);
                this._component.localizations.registerParameter(_local_18, "seconds", _local_19);
                k.text = this._component.localizations.getLocalizationRaw(_local_18).value;
            }
            if (this._chatBubblePool.length > 0)
            {
                _local_8 = this._chatBubblePool.pop();
            }
            else
            {
                _local_8 = new PooledChatBubble(this._component);
            }
            this._Str_20462(k, _local_3);
            var _local_9:Object = _local_3.textFormat.color;
            ChatColours._Str_25637(k, _local_3);
            _local_8.chatItem = k;
            _local_8.style = _local_3;
            _local_8.face = _local_7;
            _local_8._Str_19209(_local_5, ((k._Str_15133) ? uint(k._Str_15133) : _local_6), this._component._Str_22462);
            _local_3.textFormat.color = _local_9;
            return _local_8;
        }

        public function _Str_25435(k:int):PooledChatBubble
        {
            var _local_5:PooledChatBubble;
            var _local_2:IChatStyleInternal = new BlankStyle();
            var _local_3:RoomSessionChatEvent = new RoomSessionChatEvent(RoomSessionChatEvent.RSCE_CHAT_EVENT, null, -1, "", RoomSessionChatEvent.CHAT_TYPE_WHISPER);
            var _local_4:ChatItem = new ChatItem(_local_3, getTimer());
            if (this._chatBubblePool.length > 0)
            {
                _local_5 = this._chatBubblePool.pop();
            }
            else
            {
                _local_5 = new PooledChatBubble(this._component);
            }
            _local_5.chatItem = _local_4;
            _local_5.style = _local_2;
            _local_5.face = null;
            _local_5._Str_19209("", 0, false, ChatFlowStage._Str_7698);
            return _local_5;
        }

        public function _Str_23020(k:ChatItem):IChatHistoryEntryBitmap
        {
            var _local_3:RoomUserData;
            var _local_10:String;
            var _local_11:IRoomObject;
            var _local_12:String;
            var _local_13:Boolean;
            var _local_14:int;
            var _local_15:int;
            var _local_16:String;
            var _local_17:String;
            var _local_18:String;
            var _local_19:String;
            var _local_20:String;
            var _local_21:String;
            var _local_2:ChatStyle = ChatStyle(this._chatStyleLibrary.getStyle(k.style));
            _local_3 = this._component.roomSessionManager.getSession(k.roomId).userDataManager.getUserDataByIndex(k.userId);
            var _local_4:String = "";
            var _local_5:uint;
            var _local_6:BitmapData = _local_2._Str_3093;
            var _local_7:* = (!((_local_3 == null) || (_local_3._Str_2394 == this._accountId)));
            if (((k._Str_15251) || (k._Str_14270)))
            {
                if (!_local_6)
                {
                    _local_6 = this._Str_7081(k._Str_15251);
                }
                _local_4 = k._Str_14270;
            }
            else
            {
                if (_local_3 != null)
                {
                    _local_4 = _local_3.name;
                    _local_10 = _local_3.figure;
                    _local_5 = this._avatarColorCache.getValue(_local_10);
                    if (!_local_6)
                    {
                        switch (_local_3.type)
                        {
                            case RoomObjectTypeEnum.PET:
                                _local_11 = this._component.roomEngine.getRoomObject(k.roomId, _local_3._Str_2713, RoomObjectCategoryEnum.CONST_100);
                                _local_12 = null;
                                if (_local_11 != null)
                                {
                                    _local_12 = _local_11.getModel().getString(RoomObjectVariableEnum.FIGURE_POSTURE);
                                }
                                _local_13 = false;
                                _local_14 = 64;
                                _local_15 = 2;
                                _local_6 = this.getPetImage(_local_10, _local_15, _local_13, _local_14, _local_12);
                                break;
                            case RoomObjectTypeEnum.BOT:
                            case RoomObjectTypeEnum.RENTABLE_BOT:
                            case RoomObjectTypeEnum.HABBO:
                                _local_6 = this._Str_7081(_local_10);
                                break;
                        }
                    }
                }
            }
            if (k.chatType == RoomSessionChatEvent.CHAT_TYPE_RESPECT)
            {
                k.text = ((this._component.localizations) ? "" : this._component.localizations.getLocalizationWithParams("widgets.chatbubble.respect", "", "username", _local_4));
                _local_7 = false;
            }
            else
            {
                if (k.chatType == RoomSessionChatEvent.CHAT_TYPE_PETRESPECT)
                {
                    k.text = ((this._component.localizations) ? "" : this._component.localizations.getLocalizationWithParams("widget.chatbubble.petrespect", "", "petname", _local_4));
                    _local_7 = false;
                }
                else
                {
                    if (k.chatType == RoomSessionChatEvent.CHAT_TYPE_PETTREAT)
                    {
                        k.text = ((this._component.localizations) ? "" : this._component.localizations.getLocalizationWithParams("widget.chatbubble.pettreat", "", "petname", _local_4));
                        _local_7 = false;
                    }
                }
            }
            if (k.chatType == RoomSessionChatEvent.CHAT_TYPE_HAND_ITEM_RECEIVED)
            {
                _local_16 = "widget.chatbubble.handitem";
                _local_17 = this._component.localizations.getLocalizationWithParams(("handitem" + k.extraParam), ("handitem" + k.extraParam));
                k.text = this._component.localizations.getLocalizationWithParams(_local_16, "", "username", _local_4, "handitem", _local_17);
                _local_7 = false;
            }
            if (k.chatType == RoomSessionChatEvent._Str_8909)
            {
                _local_18 = "widget.chatbubble.mutetime";
                _local_19 = String((k.extraParam % 60));
                _local_20 = String(((k.extraParam > 0) ? Math.floor(((k.extraParam % 3600) / 60)) : 0));
                _local_21 = String(((k.extraParam > 0) ? Math.floor((k.extraParam / 3600)) : 0));
                this._component.localizations.registerParameter(_local_18, "hours", _local_21);
                this._component.localizations.registerParameter(_local_18, "minutes", _local_20);
                this._component.localizations.registerParameter(_local_18, "seconds", _local_19);
                k.text = this._component.localizations.getLocalizationRaw(_local_18).value;
                _local_7 = false;
            }
            this._Str_20462(k, _local_2);
            var _local_8:ChatBubble = new ChatBubble(k, _local_2, _local_6, _local_4, ((k._Str_15133) ? uint(k._Str_15133) : _local_5), this._component, RoomChatSettingsParser._Str_12581);
			var _local_9:BitmapData = new BitmapData(_local_8.width, _local_8.height, true, 0);
            _local_8._Str_23014(_local_9);
            return new ChatHistoryEntryBitmapBubble(k, _local_7, _local_4, _local_9, _local_2.overlap);
        }

        private function _Str_20462(k:ChatItem, _arg_2:ChatStyle):void
        {
            if (!_arg_2.allowHTML)
            {
                k.text = k.text.replace(/</g, "&lt;").replace(/>/g, "&gt;");
                k.text = k.text.replace(/&#[0-9]+;/g, "");
                k.text = k.text.replace(/&#x[0-9]+;/g, "");
            }
        }

        public function _Str_23311(k:_Str_2370):IChatHistoryEntryBitmap
        {
            return new ChatHistoryRoomChangeEntry(k, this._component);
        }

        public function recycle(k:PooledChatBubble):void
        {
            this._chatBubblePool.push(k);
        }

        public function _Str_7081(k:String):BitmapData
        {
            var _local_4:IAvatarImage;
            var _local_5:IPartColor;
            var _local_2:Boolean = this._component.getBoolean("zoom.enabled");
            var _local_3:BitmapData = (this._avatarImageCache.getValue(k) as BitmapData);
            if (_local_3 == null)
            {
                _local_4 = this._component.avatarRenderManager.createAvatarImage(k, ((_local_2) ? AvatarScaleType.LARGE : AvatarScaleType.SMALL), null, this);
                if (_local_4 != null)
                {
                    _local_3 = _local_4._Str_818(AvatarSetType.HEAD, ((_local_2) ? 0.5 : 1));
                    _local_5 = _local_4._Str_867(AvatarFigurePartType.CHEST);
                    _local_4.dispose();
                    if (_local_5 != null)
                    {
                        this._avatarColorCache.add(k, _local_5._Str_915);
                    }
                }
            }
            if (_local_3 != null)
            {
                this._avatarImageCache.add(k, _local_3);
            }
            return _local_3;
        }

        private function getPetImage(k:String, _arg_2:int, _arg_3:Boolean, _arg_4:int=64, _arg_5:String=null):BitmapData
        {
            var _local_7:PetFigureData;
            var _local_8:int;
            var _local_9:uint;
            var _local_10:Boolean;
            var _local_11:ImageResult;
            var _local_6:BitmapData = (this._petImageCache.getValue((k + _arg_5)) as BitmapData);
            if (_local_6 == null)
            {
                _local_7 = new PetFigureData(k);
                _local_8 = _local_7.typeId;
                _local_9 = 0;
                _local_10 = false;
                _local_11 = this._component.roomEngine.getPetImage(_local_8, _local_7.paletteId, _local_7.color, new Vector3d((_arg_2 * 45)), _arg_4, this, _local_10, _local_9, _local_7._Str_3542, _arg_5);
                if (_local_11 != null)
                {
                    _local_6 = _local_11.data;
                    if (_local_11.id > 0)
                    {
                        this._petImageIdToFigureString.add(_local_11.id, _local_7.figureString);
                    }
                }
                this._avatarColorCache.add(k, _local_7.color);
            }
            if (_local_6 != null)
            {
                this._petImageCache.add((k + _arg_5), _local_6);
            }
            return _local_6;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            var _local_3:String = this._petImageIdToFigureString.remove(k);
            if (_local_3 != null)
            {
                this._Str_18432(_local_3);
                if (this._petImageCache)
                {
                    this._petImageCache.add(_local_3, _arg_2);
                }
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_18432(k:String):void
        {
            var _local_2:BitmapData;
            if (this._petImageCache)
            {
                _local_2 = (this._petImageCache.remove(k) as BitmapData);
                if (_local_2 != null)
                {
                    this._imagesWaitingForDispose.push(_local_2);
                }
            }
            if (this._imagesWaitingForDispose.length > _Str_14010)
            {
                this._Str_17762();
            }
        }

        public function _Str_840(k:String):void
        {
            var _local_2:BitmapData;
            if (this._avatarImageCache)
            {
                _local_2 = (this._avatarImageCache.remove(k) as BitmapData);
                if (_local_2 != null)
                {
                    this._imagesWaitingForDispose.push(_local_2);
                }
            }
            if (this._imagesWaitingForDispose.length > _Str_14010)
            {
                this._Str_17762();
            }
        }

        private function _Str_17762():void
        {
            var k:BitmapData;
            for each (k in this._imagesWaitingForDispose)
            {
                if (k != null)
                {
                    k.dispose();
                }
            }
        }

        public function get chatStyleLibrary():ChatStyleLibrary
        {
            return this._chatStyleLibrary;
        }
    }
}
