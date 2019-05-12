package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetCreditFurniRedeemMessage;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.ui.widget.events._Str_4899;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class FurnitureCreditWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.FURNI_CREDIT_WIDGET;
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
            return [RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_CREDITFURNI, RoomWidgetCreditFurniRedeemMessage.RWFCRM_REDEEM];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetFurniToWidgetMessage;
            var _local_3:IRoomObject;
            var _local_4:RoomWidgetCreditFurniRedeemMessage;
            var _local_5:IRoomObjectModel;
            var _local_6:Number;
            var _local_7:_Str_4899;
            switch (k.type)
            {
                case RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_CREDITFURNI:
                    _local_2 = (k as RoomWidgetFurniToWidgetMessage);
                    _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2.id, _local_2.category);
                    if (((!(_local_3 == null)) && (this._container.isOwnerOfFurniture(_local_3))))
                    {
                        _local_5 = _local_3.getModel();
                        if (_local_5 != null)
                        {
                            _local_6 = _local_5.getNumber(RoomObjectVariableEnum.FURNITURE_CREDIT_VALUE);
                            _local_7 = new _Str_4899(_Str_4899.RWCFUE_CREDIT_FURNI_UPDATE, _local_5.getString(RoomObjectVariableEnum.FURNITURE_TYPE_ID) + "_" + _local_2.type + "_" + _local_2.id, _local_2.id, _local_6);
                            this._container.events.dispatchEvent(_local_7);
                        }
                    }
                    break;
                case RoomWidgetCreditFurniRedeemMessage.RWFCRM_REDEEM:
                    _local_4 = (k as RoomWidgetCreditFurniRedeemMessage);
                    if (((!(this._container == null)) && (!(this._container.roomSession == null))))
                    {
                        this._container.roomSession._Str_22199(_local_4._Str_1577);
                    }
            }
            return null;
        }

        public function _Str_2609():Array
        {
            return [];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:Event;
            if ((((!(this._container == null)) && (!(this._container.events == null))) && (!(_local_2 == null))))
            {
                this._container.events.dispatchEvent(_local_2);
            }
        }

        public function update():void
        {
        }
    }
}
