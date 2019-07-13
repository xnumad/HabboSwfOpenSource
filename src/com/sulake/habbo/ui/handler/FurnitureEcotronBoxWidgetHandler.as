package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetEcotronBoxOpenMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetEcotronBoxOpenedMessage;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.ui.widget.events._Str_3072;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.display.BitmapData;
    import com.sulake.habbo.session.events.RoomSessionPresentEvent;
    import com.sulake.habbo.room.ImageResult;
    import flash.events.Event;

    public class FurnitureEcotronBoxWidgetHandler implements IRoomWidgetHandler, IGetImageListener 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _objectId:int = -1;
        private var _name:String = "";


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.FURNI_ECOTRONBOX_WIDGET;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function dispose():void
        {
            this._isDisposed = true;
            this._container = null;
        }

        public function _Str_2607():Array
        {
            return [RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_ECOTRONBOX, RoomWidgetEcotronBoxOpenMessage.RWEBOM_OPEN_ECOTRONBOX, RoomWidgetEcotronBoxOpenedMessage.RWEBOM_ECOTRONBOX_OPENED];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetFurniToWidgetMessage;
            var _local_3:IRoomObject;
            var _local_4:RoomWidgetEcotronBoxOpenMessage;
            var _local_5:IRoomObjectModel;
            var _local_6:String;
            var _local_7:int;
            var _local_8:IFurnitureData;
            var _local_9:String;
            var _local_10:Boolean;
            var _local_11:_Str_3072;
            switch (k.type)
            {
                case RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_ECOTRONBOX:
                    _local_2 = (k as RoomWidgetFurniToWidgetMessage);
                    _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2.id, _local_2.category);
                    if (_local_3 != null)
                    {
                        _local_5 = _local_3.getModel();
                        if (_local_5 != null)
                        {
                            this._objectId = _local_2.id;
                            _local_6 = _local_5.getString(RoomObjectVariableEnum.FURNITURE_DATA);
                            if (_local_6 == null)
                            {
                                return null;
                            }
                            _local_7 = _local_5.getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                            _local_8 = this._container.sessionDataManager.getFloorItemData(_local_7);
                            _local_9 = ((_local_8 != null) ? _local_8.className : "");
                            _local_10 = ((this._container.roomSession.isRoomController) || (this._container.sessionDataManager.isGodMode));
                            _local_11 = new _Str_3072(_Str_3072.RWEBDUE_PACKAGEINFO, _local_2.id, _local_6, _local_9, _local_10);
                            this._container.events.dispatchEvent(_local_11);
                        }
                    }
                    break;
                case RoomWidgetEcotronBoxOpenMessage.RWEBOM_OPEN_ECOTRONBOX:
                    _local_4 = (k as RoomWidgetEcotronBoxOpenMessage);
                    if (_local_4._Str_1577 != this._objectId)
                    {
                        return null;
                    }
                    if (((!(this._container == null)) && (!(this._container.roomSession == null))))
                    {
                        this._container.roomSession._Str_17139(_local_4._Str_1577);
                    }
                    break;
            }
            return null;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (this.disposed)
            {
                return;
            }
            var _local_3:_Str_3072 = new _Str_3072(_Str_3072.RWEBDUE_CONTENTS, 0, this._name, "", false, _arg_2);
            this._container.events.dispatchEvent(_local_3);
        }

        public function imageFailed(k:int):void
        {
        }

        public function _Str_2609():Array
        {
            return [RoomSessionPresentEvent.RSPE_PRESENT_OPENED];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomSessionPresentEvent;
            var _local_3:ImageResult;
            var _local_4:IFurnitureData;
            var _local_5:_Str_3072;
            if (k == null)
            {
                return;
            }
            if ((((!(this._container == null)) && (!(this._container.events == null))) && (!(k == null))))
            {
                switch (k.type)
                {
                    case RoomSessionPresentEvent.RSPE_PRESENT_OPENED:
                        _local_2 = (k as RoomSessionPresentEvent);
                        if (_local_2 != null)
                        {
                            _local_3 = null;
                            this._name = "";
                            if (_local_2._Str_2887 == "s")
                            {
                                _local_3 = this._container.roomEngine.getFurnitureIcon(_local_2.classId, this);
                                _local_4 = this._container.sessionDataManager.getFloorItemData(_local_2.classId);
                            }
                            else
                            {
                                if (_local_2._Str_2887 == "i")
                                {
                                    _local_3 = this._container.roomEngine.getWallItemIcon(_local_2.classId, this);
                                    _local_4 = this._container.sessionDataManager.getWallItemData(_local_2.classId);
                                }
                            }
                            if (_local_4 != null)
                            {
                                this._name = _local_4.localizedName;
                            }
                            if (_local_3 != null)
                            {
                                _local_5 = new _Str_3072(_Str_3072.RWEBDUE_CONTENTS, 0, this._name, "", false, _local_3.data);
                                this._container.events.dispatchEvent(_local_5);
                            }
                        }
                }
            }
        }

        public function update():void
        {
        }
    }
}
