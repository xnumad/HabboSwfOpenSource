package com.sulake.habbo.ui.widget.furniture.dimmer
{
	import com.sulake.habbo.ui.widget.furniture.dimmer.DimmerView;
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events.RoomWidgetDimmerUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_5572;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events._Str_6094;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerPreviewMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerSavePresetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerChangeStateMessage;

    public class DimmerFurniWidget extends ConversionTrackingWidget 
    {
        private static const _Str_17357:Array = new Array(7665141, 21495, 15161822, 15353138, 15923281, 8581961, 0);
        private static const _Str_18775:Array = new Array(int((0.3 * 0xFF)), int((0.3 * 0xFF)));

        private var _view:DimmerView;
        private var _presets:Array;
        private var _selectedPresetIndex:int;
        private var _dimmerState:int;
        private var _effectId:int;
        private var _color:uint = 0xFFFFFF;
        private var _brightness:uint = 0xFF;

        public function DimmerFurniWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        public function get _Str_22519():int
        {
            return this._dimmerState;
        }

        public function get _Str_8447():Array
        {
            return this._presets;
        }

        public function get colors():Array
        {
            return _Str_17357;
        }

        public function get _Str_23750():Array
        {
            return _Str_18775;
        }

        public function get _Str_13894():int
        {
            return this._selectedPresetIndex;
        }

        public function set _Str_13894(k:int):void
        {
            this._selectedPresetIndex = k;
        }

        override public function dispose():void
        {
            this._Str_7493();
            this._presets = null;
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(RoomWidgetDimmerUpdateEvent.RWDUE_PRESETS, this._Str_20153);
            k.addEventListener(RoomWidgetDimmerUpdateEvent.RWDUE_HIDE, this._Str_21426);
            k.addEventListener(_Str_5572.RWDSUE_DIMMER_STATE, this._Str_20342);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(RoomWidgetDimmerUpdateEvent.RWDUE_PRESETS, this._Str_20153);
            k.removeEventListener(RoomWidgetDimmerUpdateEvent.RWDUE_HIDE, this._Str_21426);
            k.removeEventListener(_Str_5572.RWDSUE_DIMMER_STATE, this._Str_20342);
        }

        private function _Str_20153(k:RoomWidgetDimmerUpdateEvent):void
        {
            var _local_3:_Str_6094;
            var _local_4:DimmerFurniWidgetPresetItem;
            this._selectedPresetIndex = (k._Str_6226 - 1);
            this._presets = new Array();
            var _local_2:int;
            while (_local_2 < k._Str_8447.length)
            {
                _local_3 = k._Str_8447[_local_2];
                _local_4 = new DimmerFurniWidgetPresetItem(_local_3.id, _local_3.type, _local_3.color, _local_3._Str_4272);
                this._presets.push(_local_4);
                _local_2++;
            }
            this._Str_3030();
        }

        private function _Str_21426(k:RoomWidgetDimmerUpdateEvent):void
        {
            this._Str_7493();
        }

        private function _Str_7493():void
        {
            if (this._view != null)
            {
                this._view.dispose();
                this._view = null;
            }
        }

        private function _Str_20342(k:_Str_5572):void
        {
            var _local_2:RoomWidgetDimmerPreviewMessage;
            if (k == null)
            {
                return;
            }
            this._dimmerState = k.state;
            this._effectId = k._Str_6815;
            this._color = k.color;
            this._brightness = k._Str_5123;
            if (this._view != null)
            {
                this._view.update();
            }
            if (!this._Str_12911(this._brightness, this._effectId))
            {
                return;
            }
            _local_2 = new RoomWidgetDimmerPreviewMessage(this._color, this._brightness, (this._effectId == 2));
            messageListener.processWidgetMessage(_local_2);
        }

        private function _Str_3030():void
        {
            if (this._view == null)
            {
                this._view = new DimmerView(this);
            }
            if (this._view != null)
            {
                this._view._Str_3030();
            }
        }

        public function _Str_19799(k:Boolean):void
        {
            var _local_7:RoomWidgetDimmerSavePresetMessage;
            if (this._dimmerState == 0)
            {
                return;
            }
            if (messageListener == null)
            {
                return;
            }
            var _local_2:int = (this._selectedPresetIndex + 1);
            if ((((this._presets == null) || (_local_2 < 0)) || (_local_2 > this._presets.length)))
            {
                return;
            }
            var _local_3:int = this._view._Str_7660;
            var _local_4:uint = this.colors[this._view._Str_4246];
            var _local_5:int = this._view._Str_7404;
            var _local_6:DimmerFurniWidgetPresetItem = (this._presets[this._selectedPresetIndex] as DimmerFurniWidgetPresetItem);
            if ((((((!(_local_6 == null)) && (_local_6.type == _local_3)) && (_local_6.color == _local_4)) && (_local_6._Str_4272 == _local_5)) && (!(k))))
            {
                return;
            }
            _local_6.type = _local_3;
            _local_6.color = _local_4;
            _local_6._Str_4272 = _local_5;
            if (!this._Str_12911(_local_5, _local_3))
            {
                return;
            }
            _local_7 = new RoomWidgetDimmerSavePresetMessage(_local_2, _local_3, _local_4, _local_5, k);
            messageListener.processWidgetMessage(_local_7);
        }

        public function _Str_12547():void
        {
            var k:RoomWidgetDimmerPreviewMessage;
            if (this._dimmerState == 0)
            {
                return;
            }
            if (messageListener == null)
            {
                return;
            }
            if (!this._Str_12911(this._view._Str_7404, this._view._Str_7660))
            {
                return;
            }
            k = new RoomWidgetDimmerPreviewMessage(this.colors[this._view._Str_4246], this._view._Str_7404, (this._view._Str_7660 == 2));
            messageListener.processWidgetMessage(k);
        }

        public function _Str_22483():void
        {
            var k:RoomWidgetDimmerChangeStateMessage;
            if (messageListener != null)
            {
                k = new RoomWidgetDimmerChangeStateMessage();
                messageListener.processWidgetMessage(k);
            }
        }

        public function _Str_23566():void
        {
            var k:RoomWidgetDimmerPreviewMessage;
            if (messageListener == null)
            {
                return;
            }
            if (!this._Str_12911(this._brightness, this._effectId))
            {
                return;
            }
            k = new RoomWidgetDimmerPreviewMessage(this._color, this._brightness, (this._effectId == 2));
            messageListener.processWidgetMessage(k);
        }

        private function _Str_12911(k:uint, _arg_2:int):Boolean
        {
            return true;
        }
    }
}
