package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.ui.widget.events._Str_3405;
    import com.sulake.habbo.ui.widget.events._Str_4178;
    import flash.events.Event;

    public class FurniChooserWidgetHandler implements IRoomWidgetHandler 
    {
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _isDisposed:Boolean = false;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.FURNI_CHOOSER;
        }

        public function dispose():void
        {
            this._isDisposed = true;
            this._container = null;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function _Str_2607():Array
        {
            var k:Array = [];
            k.push(RoomWidgetRequestWidgetMessage.RWRWM_FURNI_CHOOSER);
            k.push(RoomWidgetRoomObjectMessage.RWROM_SELECT_OBJECT);
            return k;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetRoomObjectMessage;
            if (k == null)
            {
                return null;
            }
            switch (k.type)
            {
                case RoomWidgetRequestWidgetMessage.RWRWM_FURNI_CHOOSER:
                    this._Str_23467();
                    break;
                case RoomWidgetRoomObjectMessage.RWROM_SELECT_OBJECT:
                    _local_2 = (k as RoomWidgetRoomObjectMessage);
                    if (_local_2 == null)
                    {
                        return null;
                    }
                    if (((_local_2.category == RoomObjectCategoryEnum.CONST_10) || (_local_2.category == RoomObjectCategoryEnum.CONST_20)))
                    {
                        this._container.roomEngine._Str_5538(this._container.roomSession.roomId, _local_2.id, _local_2.category);
                    }
                    break;
            }
            return null;
        }

        private function _Str_23467():void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:IFurnitureData;
            var _local_6:String;
            var _local_7:IRoomObject;
            var _local_9:String;
            var _local_10:int;
            if ((((this._container == null) || (this._container.roomSession == null)) || (this._container.roomEngine == null)))
            {
                return;
            }
            if (this._container.roomSession.userDataManager == null)
            {
                return;
            }
            var k:int = this._container.roomSession.roomId;
            var _local_2:Array = [];
            var _local_8:int = this._container.roomEngine.getRoomObjectCount(k, RoomObjectCategoryEnum.CONST_10);
            _local_3 = 0;
            while (_local_3 < _local_8)
            {
                _local_7 = this._container.roomEngine.getRoomObjectWithIndex(k, _local_3, RoomObjectCategoryEnum.CONST_10);
                if (_local_7 != null)
                {
                    _local_4 = _local_7.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                    _local_5 = this._container.sessionDataManager.getFloorItemData(_local_4);
                    if (_local_5 != null)
                    {
                        _local_6 = _local_5.localizedName;
                    }
                    else
                    {
                        _local_6 = _local_7.getType();
                    }
                    _local_2.push(new _Str_3405(_local_7.getId(), RoomObjectCategoryEnum.CONST_10, _local_6));
                }
                _local_3++;
            }
            _local_8 = this._container.roomEngine.getRoomObjectCount(k, RoomObjectCategoryEnum.CONST_20);
            _local_3 = 0;
            while (_local_3 < _local_8)
            {
                _local_7 = this._container.roomEngine.getRoomObjectWithIndex(k, _local_3, RoomObjectCategoryEnum.CONST_20);
                if (_local_7 != null)
                {
                    _local_9 = _local_7.getType();
                    if (_local_9.indexOf("poster") == 0)
                    {
                        _local_10 = int(_local_9.replace("poster", ""));
                        _local_6 = this._container.localization.getLocalization((("poster_" + _local_10) + "_name"), (("poster_" + _local_10) + "_name"));
                    }
                    else
                    {
                        _local_4 = _local_7.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                        _local_5 = this._container.sessionDataManager.getWallItemData(_local_4);
                        if (((!(_local_5 == null)) && (_local_5.localizedName.length > 0)))
                        {
                            _local_6 = _local_5.localizedName;
                        }
                        else
                        {
                            _local_6 = _local_9;
                        }
                    }
                    _local_2.push(new _Str_3405(_local_7.getId(), RoomObjectCategoryEnum.CONST_20, _local_6));
                }
                _local_3++;
            }
            _local_2.sort(this._Str_16552);
            this._container.events.dispatchEvent(new _Str_4178(_Str_4178.RWCCE_FURNI_CHOOSER_CONTENT, _local_2, this._container.sessionDataManager.isGodMode));
        }

        private function _Str_16552(k:_Str_3405, _arg_2:_Str_3405):int
        {
            if ((((((k == null) || (_arg_2 == null)) || (k.name == _arg_2.name)) || (k.name.length == 0)) || (_arg_2.name.length == 0)))
            {
                return 1;
            }
            var _local_3:Array = new Array(k.name.toUpperCase(), _arg_2.name.toUpperCase()).sort();
            if (_local_3.indexOf(k.name.toUpperCase()) == 0)
            {
                return -1;
            }
            return 1;
        }

        public function _Str_2609():Array
        {
            return null;
        }

        public function _Str_2485(k:Event):void
        {
        }

        public function update():void
        {
        }
    }
}
