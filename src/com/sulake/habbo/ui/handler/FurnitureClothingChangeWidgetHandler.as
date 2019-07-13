package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.avatar._Str_5523;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.avatar.enum.AvatarEditorInstanceId;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetClothingChangeMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarEditorMessage;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.ui.widget.events._Str_3584;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class FurnitureClothingChangeWidgetHandler implements IRoomWidgetHandler, _Str_5523 
    {
        private static const _Str_17140:String = "hd-99999-99999.lg-270-62";
        private static const _Str_18077:String = "hd-99999-99999.ch-630-62.lg-695-62";

        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _objectId:int = -1;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.CLOTHING_CHANGE;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function dispose():void
        {
            if (((this._container) && (this._container.avatarEditor)))
            {
                this._container.avatarEditor.close(AvatarEditorInstanceId._Str_7195);
            }
            this._isDisposed = true;
            this._container = null;
        }

        public function _Str_2607():Array
        {
            return [RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE, RoomWidgetClothingChangeMessage.RWCCM_REQUEST_EDITOR, RoomWidgetAvatarEditorMessage.RWCM_OPEN_AVATAR_EDITOR];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_5:RoomWidgetFurniToWidgetMessage;
            var _local_6:RoomWidgetClothingChangeMessage;
            var _local_7:Boolean;
            var _local_8:String;
            var _local_9:String;
            var _local_2:IRoomObject;
            var _local_3:IRoomObjectModel;
            var _local_4:_Str_3584;
            switch (k.type)
            {
                case RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE:
                    _local_5 = (k as RoomWidgetFurniToWidgetMessage);
                    _local_2 = this._container.roomEngine.getRoomObject(_local_5.roomId, _local_5.id, _local_5.category);
                    if (_local_2 != null)
                    {
                        _local_3 = _local_2.getModel();
                        if (_local_3 != null)
                        {
                            _local_7 = (((this._container.roomSession.isRoomController) || (this._container.sessionDataManager.isGodMode)) || (this._container.roomSession.roomControllerLevel >= RoomControllerLevel.GUEST));
                            if (_local_7)
                            {
                                _local_4 = new _Str_3584(_Str_3584.RWCCUE_SHOW_GENDER_SELECTION, _local_5.id, _local_5.category, _local_5.roomId);
                                this._container.events.dispatchEvent(_local_4);
                            }
                        }
                    }
                    break;
                case RoomWidgetClothingChangeMessage.RWCCM_REQUEST_EDITOR:
                    _local_6 = (k as RoomWidgetClothingChangeMessage);
                    _local_2 = this._container.roomEngine.getRoomObject(_local_6.roomId, _local_6._Str_1577, _local_6.objectCategory);
                    if (_local_2 != null)
                    {
                        _local_3 = _local_2.getModel();
                        if (_local_3 != null)
                        {
                            this._objectId = _local_6._Str_1577;
                            _local_8 = FigureData.M;
                            _local_9 = _local_3.getString(RoomObjectVariableEnum.FURNITURE_CLOTHING_BOY);
                            if (((_local_9 == null) || (_local_9 == "")))
                            {
                                _local_9 = _Str_17140;
                            }
                            if (_local_6.gender == FigureData.F)
                            {
                                _local_8 = FigureData.F;
                                _local_9 = _local_3.getString(RoomObjectVariableEnum.FURNITURE_CLOTHING_GIRL);
                                if (((_local_9 == null) || (_local_9 == "")))
                                {
                                    _local_9 = _Str_18077;
                                }
                            }
                            if (this._container.avatarEditor.openEditor(AvatarEditorInstanceId._Str_7195, this, [AvatarEditorFigureCategory.TORSO, AvatarEditorFigureCategory.LEGS], false, "${widget.furni.clothingchange.editor.title}"))
                            {
                                this._container.avatarEditor.loadAvatarInEditor(AvatarEditorInstanceId._Str_7195, _local_9, _local_8, HabboClubLevelEnum._Str_3159);
                                _local_4 = new _Str_3584(_Str_3584.RWCCUE_SHOW_GENDER_SELECTION, _local_6._Str_1577, _local_6.objectCategory, _local_6.roomId);
                                this._container.events.dispatchEvent(_local_4);
                            }
                        }
                    }
                    break;
            }
            return null;
        }

        public function update():void
        {
        }

        public function _Str_2609():Array
        {
            return [];
        }

        public function _Str_2485(k:Event):void
        {
        }

        public function _Str_21941(k:String, _arg_2:String):void
        {
            if (this._container == null)
            {
                return;
            }
            this._container.roomSession._Str_21093(this._objectId, _arg_2, k);
            this._container.avatarEditor.close(AvatarEditorInstanceId._Str_7195);
        }
    }
}
