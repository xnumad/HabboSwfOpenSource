package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.ui.widget.events._Str_3149;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionWordQuizEvent;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.avatar.enum.AvatarAction;
    import flash.events.Event;

    public class WordQuizWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.WORD_QUIZZ;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function dispose():void
        {
            this._disposed = true;
            this._container = null;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function get roomSession():IRoomSession
        {
            return (this._container) ? this._container.roomSession : null;
        }

        public function get roomEngine():IRoomEngine
        {
            return (this._container) ? this._container.roomEngine : null;
        }

        public function _Str_2607():Array
        {
            return [_Str_3149.RWPUW_QUESTION_ANSWERED, _Str_3149.RWPUW_QUESION_FINSIHED, _Str_3149.RWPUW_NEW_QUESTION];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }

        public function _Str_2609():Array
        {
            var k:Array = [];
            k.push(RoomSessionWordQuizEvent.RWPUW_QUESTION_ANSWERED);
            k.push(RoomSessionWordQuizEvent.RWPUW_QUESION_FINSIHED);
            k.push(RoomSessionWordQuizEvent.RWPUW_NEW_QUESTION);
            return k;
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomSessionWordQuizEvent;
            var _local_3:_Str_3149;
            var _local_4:RoomUserData;
            if ((((this._container == null) || (this._container.events == null)) || (this._container.roomSession == null)))
            {
                return;
            }
            _local_2 = (k as RoomSessionWordQuizEvent);
            if (_local_2 == null)
            {
                return;
            }
            switch (k.type)
            {
                case RoomSessionWordQuizEvent.RWPUW_QUESTION_ANSWERED:
                    _local_3 = new _Str_3149(_local_2.id, _Str_3149.RWPUW_QUESTION_ANSWERED);
                    _local_3.value = _local_2.value;
                    _local_3.userId = _local_2.userId;
                    _local_3._Str_4036 = _local_2._Str_4036;
                    _local_4 = this._container.roomSession.userDataManager.getUserData(_local_2.userId);
                    if (!_local_4)
                    {
                        return;
                    }
                    if (_local_3.value == "0")
                    {
                        this._container.roomEngine.updateObjectUserGesture(this._container.roomSession.roomId, _local_4._Str_2713, AvatarAction.getGestureId(AvatarAction.GESTURE_SAD));
                    }
                    else
                    {
                        this._container.roomEngine.updateObjectUserGesture(this._container.roomSession.roomId, _local_4._Str_2713, AvatarAction.getGestureId(AvatarAction.GESTURE_SMILE));
                    }
                    break;
                case RoomSessionWordQuizEvent.RWPUW_QUESION_FINSIHED:
                    _local_3 = new _Str_3149(_local_2.id, _Str_3149.RWPUW_QUESION_FINSIHED);
                    _local_3._Str_5213 = _local_2._Str_5213;
                    _local_3._Str_3218 = _local_2._Str_3218;
                    _local_3._Str_4036 = _local_2._Str_4036;
                    break;
                case RoomSessionWordQuizEvent.RWPUW_NEW_QUESTION:
                    _local_3 = new _Str_3149(_local_2.id, _Str_3149.RWPUW_NEW_QUESTION);
                    _local_3.question = _local_2.question;
                    _local_3.duration = _local_2.duration;
                    _local_3._Str_5302 = _local_2._Str_5302;
                    _local_3._Str_3218 = _local_2._Str_3218;
                    _local_3._Str_5213 = _local_2._Str_5213;
                    break;
            }
            if (_local_3 == null)
            {
                return;
            }
            this._container.events.dispatchEvent(_local_3);
        }

        public function update():void
        {
        }
    }
}
