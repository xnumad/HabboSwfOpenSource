package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.effects.EffectsWidget;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class EffectsWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _widget:EffectsWidget;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this.container = null;
                this._widget = null;
                this._disposed = true;
            }
        }

        public function get type():String
        {
            return RoomWidgetEnum.EFFECTS;
        }

        public function set widget(k:EffectsWidget):void
        {
            this._widget = k;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            if (((this._container) && (this._container.inventory)))
            {
                this._container.inventory.events.removeEventListener(HabboInventoryEffectsEvent.HIEE_EFFECTS_CHANGED, this._Str_10320);
            }
            this._container = k;
            if (((this._container) && (this._container.inventory)))
            {
                this._container.inventory.events.addEventListener(HabboInventoryEffectsEvent.HIEE_EFFECTS_CHANGED, this._Str_10320);
            }
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        private function _Str_10320(k:HabboInventoryEffectsEvent):void
        {
            if (this._widget)
            {
                this._widget.open();
            }
        }

        public function _Str_2607():Array
        {
            return [RoomWidgetRequestWidgetMessage.RWRWM_EFFECTS];
        }

        public function _Str_2609():Array
        {
            return [];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            if (!k)
            {
                return null;
            }
            switch (k.type)
            {
                case RoomWidgetRequestWidgetMessage.RWRWM_EFFECTS:
                    this._widget.open();
                    break;
            }
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
