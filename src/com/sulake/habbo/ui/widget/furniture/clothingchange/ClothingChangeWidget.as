package com.sulake.habbo.ui.widget.furniture.clothingchange
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events._Str_3584;
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetClothingChangeMessage;

    public class ClothingChangeWidget extends ConversionTrackingWidget 
    {
        private static const BOY:String = "Boy";
        private static const GIRL:String = "Girl";

        private var _Str_5344:IWindowContainer;
        private var _Str_2319:int = 0;
        private var _Str_3014:int = 0;
        private var _Str_2337:int = 0;

        public function ClothingChangeWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        override public function dispose():void
        {
            this._Str_9023();
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_3584.RWCCUE_SHOW_GENDER_SELECTION, this._Str_5183);
            k.addEventListener(_Str_3584.RWCCUE_SHOW_CLOTHING_EDITOR, this._Str_5183);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_3584.RWCCUE_SHOW_GENDER_SELECTION, this._Str_5183);
            k.removeEventListener(_Str_3584.RWCCUE_SHOW_CLOTHING_EDITOR, this._Str_5183);
        }

        private function _Str_5183(k:_Str_3584):void
        {
            switch (k.type)
            {
                case _Str_3584.RWCCUE_SHOW_GENDER_SELECTION:
                    this._Str_22639(k);
                    return;
            }
        }

        private function _Str_22639(k:_Str_3584):void
        {
            this._Str_9023();
            this._Str_2319 = k._Str_1577;
            this._Str_3014 = k.objectCategory;
            this._Str_2337 = k.roomId;
            var _local_2:IAsset = assets.getAssetByName("boygirl");
            var _local_3:XmlAsset = XmlAsset(_local_2);
            if (_local_3 == null)
            {
                return;
            }
            this._Str_5344 = (windowManager.createWindow("clothing change gender selection", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.NULL, (((WindowParam.WINDOW_PARAM_MOUSE_DRAGGING_TARGET | WindowParam.WINDOW_PARAM_PARENT_WINDOW) | WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN) | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(100, 100, 200, 200), null, 0) as IWindowContainer);
            this._Str_5344.buildFromXML(XML(_local_3.content));
            this._Str_5344.addEventListener(WindowMouseEvent.CLICK, this._Str_17954);
            this._Str_5344.center();
            var _local_4:IWindow = this._Str_5344.findChildByTag("close");
            if (_local_4 != null)
            {
                _local_4.procedure = this._Str_23303;
            }
            _local_4 = this._Str_5344.findChildByName(BOY);
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_17954);
            }
            _local_4 = this._Str_5344.findChildByName(GIRL);
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_17954);
            }
        }

        private function _Str_9023():void
        {
            if (this._Str_5344 != null)
            {
                this._Str_5344.dispose();
                this._Str_5344 = null;
            }
        }

        private function _Str_23303(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_9023();
        }

        private function _Str_17954(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case BOY:
                    this._Str_19153(FigureData.M);
                    this._Str_9023();
                    return;
                case GIRL:
                    this._Str_19153(FigureData.F);
                    this._Str_9023();
                    return;
                case "close":
                case "close_btn":
                    this._Str_9023();
                    return;
            }
        }

        private function _Str_19153(k:String):void
        {
            var _local_2:RoomWidgetClothingChangeMessage = new RoomWidgetClothingChangeMessage(RoomWidgetClothingChangeMessage.RWCCM_REQUEST_EDITOR, k, this._Str_2319, this._Str_3014, this._Str_2337);
            messageListener.processWidgetMessage(_local_2);
        }
    }
}
