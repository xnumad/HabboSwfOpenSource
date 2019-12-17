package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.requirementsmissing.CustomUserNotificationWidget;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_6132;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class CustomUserNotificationWidgetHandler implements IRoomWidgetHandler 
    {
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _isDisposed:Boolean = false;
        private var _widget:CustomUserNotificationWidget;
        private var _customUserNotificationListener:IMessageEvent;


        public function get type():String
        {
            return RoomWidgetEnum.CUSTOM_USER_NOTIFICATION;
        }

        public function set widget(k:CustomUserNotificationWidget):void
        {
            this._widget = k;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
            if (!this._customUserNotificationListener)
            {
                this._customUserNotificationListener = new _Str_6132(this._Str_23893);
                this._container.connection.addMessageEvent(this._customUserNotificationListener);
            }
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function _Str_2607():Array
        {
            return [];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
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

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (((this._container.connection) && (this._customUserNotificationListener)))
                {
                    this._container.connection.removeMessageEvent(this._customUserNotificationListener);
                }
                this._customUserNotificationListener = null;
                this._widget = null;
                this._container = null;
                this._isDisposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function _Str_23893(k:_Str_6132):void
        {
            var _local_2:int = k.getParser().code;
            if (this._widget)
            {
                switch (_local_2)
                {
                    case 1:
                        this._widget.open(CustomUserNotificationWidget.COSTUMEHOPPER);
                        return;
                    case 2:
                        this._widget.open(CustomUserNotificationWidget.VIPHOPPER);
                        return;
                    case 3:
                        this._widget.open(CustomUserNotificationWidget.VIPGATE);
                        return;
                    case 4:
                        this._widget.open(CustomUserNotificationWidget.RESPECTFAILEDSTAGE);
                        return;
                    case 5:
                        this._widget.open(CustomUserNotificationWidget.RESPECTFAILEDAUDIENCE);
                        return;
                }
            }
        }
    }
}
