package com.sulake.habbo.ui.widget.furniture.clothingchange
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events.RoomWidgetClothingChangeUpdateEvent;
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum.HabboWindowStyle;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetClothingChangeMessage;

    public class ClothingChangeWidget extends RoomWidgetBase
    {
        private static const BOY:String = "Boy";
        private static const GIRL:String = "Girl";

        private var _genderSelectionWindow:IWindowContainer;
        private var _objectId:int = 0;
        private var _objectCategory:int = 0;
        private var _roomId:int = 0;

        public function ClothingChangeWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        override public function dispose():void
        {
            this.hideGenderSelectionInterface();
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(RoomWidgetClothingChangeUpdateEvent.RWCCUE_SHOW_GENDER_SELECTION, this.onUpdate);
            k.addEventListener(RoomWidgetClothingChangeUpdateEvent.RWCCUE_SHOW_CLOTHING_EDITOR, this.onUpdate);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(RoomWidgetClothingChangeUpdateEvent.RWCCUE_SHOW_GENDER_SELECTION, this.onUpdate);
            k.removeEventListener(RoomWidgetClothingChangeUpdateEvent.RWCCUE_SHOW_CLOTHING_EDITOR, this.onUpdate);
        }

        private function onUpdate(k:RoomWidgetClothingChangeUpdateEvent):void
        {
            switch (k.type)
            {
                case RoomWidgetClothingChangeUpdateEvent.RWCCUE_SHOW_GENDER_SELECTION:
                    this.showGenderSelectionInterface(k);
                    return;
            }
        }

        private function showGenderSelectionInterface(k:RoomWidgetClothingChangeUpdateEvent):void
        {
            this.hideGenderSelectionInterface();
            this._objectId = k.objectId;
            this._objectCategory = k.objectCategory;
            this._roomId = k.roomId;
            var _local_2:IAsset = assets.getAssetByName("boygirl");
            var _local_3:XmlAsset = XmlAsset(_local_2);
            if (_local_3 == null)
            {
                return;
            }
            this._genderSelectionWindow = (windowManager.createWindow("clothing change gender selection", "", WindowType.WINDOW_TYPE_CONTAINER, HabboWindowStyle.NULL, (((WindowParam.WINDOW_PARAM_MOUSE_DRAGGING_TARGET | WindowParam.WINDOW_PARAM_PARENT_WINDOW) | WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN) | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(100, 100, 200, 200), null, 0) as IWindowContainer);
            this._genderSelectionWindow.buildFromXML(XML(_local_3.content));
            this._genderSelectionWindow.addEventListener(WindowMouseEvent.CLICK, this.onGenderSelectionMouseEvent);
            this._genderSelectionWindow.center();
            var _local_4:IWindow = this._genderSelectionWindow.findChildByTag("close");
            if (_local_4 != null)
            {
                _local_4.procedure = this.onGenderSelectionWindowClose;
            }
            _local_4 = this._genderSelectionWindow.findChildByName(BOY);
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this.onGenderSelectionMouseEvent);
            }
            _local_4 = this._genderSelectionWindow.findChildByName(GIRL);
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this.onGenderSelectionMouseEvent);
            }
        }

        private function hideGenderSelectionInterface():void
        {
            if (this._genderSelectionWindow != null)
            {
                this._genderSelectionWindow.dispose();
                this._genderSelectionWindow = null;
            }
        }

        private function onGenderSelectionWindowClose(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this.hideGenderSelectionInterface();
        }

        private function onGenderSelectionMouseEvent(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case BOY:
                    this.requestEditor(FigureData.M);
                    this.hideGenderSelectionInterface();
                    return;
                case GIRL:
                    this.requestEditor(FigureData.F);
                    this.hideGenderSelectionInterface();
                    return;
                case "close":
                case "close_btn":
                    this.hideGenderSelectionInterface();
                    return;
            }
        }

        private function requestEditor(k:String):void
        {
            var _local_2:RoomWidgetClothingChangeMessage = new RoomWidgetClothingChangeMessage(RoomWidgetClothingChangeMessage.RWCCM_REQUEST_EDITOR, k, this._objectId, this._objectCategory, this._roomId);
            messageListener.processWidgetMessage(_local_2);
        }
    }
}
