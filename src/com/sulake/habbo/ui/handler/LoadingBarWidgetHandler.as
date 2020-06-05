package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetLoadingBarUpdateEvent;
    import flash.events.Event;

    public class LoadingBarWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.LOADINGBAR;
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

        public function getWidgetMessages():Array
        {
            return [];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }

        public function getProcessedEvents():Array
        {
            var k:Array = [];
            k.push(RoomWidgetLoadingBarUpdateEvent.RWLBUE_SHOW_LOADING_BAR);
            k.push(RoomWidgetLoadingBarUpdateEvent.RWLBUW_HIDE_LOADING_BAR);
            return k;
        }

        public function processEvent(k:Event):void
        {
            if (((this._container == null) || (this._container.events == null)))
            {
                return;
            }
            switch (k.type)
            {
                case RoomWidgetLoadingBarUpdateEvent.RWLBUE_SHOW_LOADING_BAR:
                    this._container.events.dispatchEvent(k);
                    return;
                case RoomWidgetLoadingBarUpdateEvent.RWLBUW_HIDE_LOADING_BAR:
                    this._container.events.dispatchEvent(k);
                    return;
            }
        }

        public function update():void
        {
        }
    }
}
