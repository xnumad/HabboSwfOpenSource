package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnumItemExtradataParameter;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.habbo.room.events.RoomObjectStateChangedEvent;

    public class FurnitureJukeboxLogic extends FurnitureMultistateLogic 
    {
        private var _disposeEventsAllowed:Boolean;
        private var _isInitialized:Boolean = false;
        private var _currentState:int = -1;


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectFurnitureActionEvent.JUKEBOX_START, RoomObjectFurnitureActionEvent.JUKEBOX_MACHINE_STOP, RoomObjectFurnitureActionEvent.JUKEBOX_DISPOSE, RoomObjectFurnitureActionEvent.JUKEBOX_INIT, RoomObjectWidgetRequestEvent.JUKEBOX_PLAYLIST_EDITOR];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function dispose():void
        {
            this._Str_18894();
            super.dispose();
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_2:RoomObjectDataUpdateMessage;
            var _local_3:IRoomObjectModelController;
            var _local_4:int;
            super.processUpdateMessage(k);
            if (object == null)
            {
                return;
            }
            if (object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT) == 1)
            {
                if (!this._isInitialized)
                {
                    this.requestInit();
                }
                object.getModelController().setString(RoomWidgetEnumItemExtradataParameter.INFOSTAND_EXTRA_PARAM, RoomWidgetEnumItemExtradataParameter.JUKEBOX);
                _local_2 = (k as RoomObjectDataUpdateMessage);
                if (_local_2 == null)
                {
                    return;
                }
                _local_3 = object.getModelController();
                if (_local_3 == null)
                {
                    return;
                }
                _local_4 = object.getState(0);
                if (_local_4 != this._currentState)
                {
                    this._currentState = _local_4;
                    if (_local_4 == 1)
                    {
                        this._Str_5930();
                    }
                    else
                    {
                        if (_local_4 == 0)
                        {
                            this._Str_18998();
                        }
                    }
                }
            }
        }

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            if (object == null)
            {
                return;
            }
            switch (k.type)
            {
                case MouseEvent.DOUBLE_CLICK:
                    this.useObject();
                    return;
                default:
                    super.mouseEvent(k, _arg_2);
            }
        }

        override public function useObject():void
        {
            var k:RoomObjectEvent;
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                k = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.JUKEBOX_PLAYLIST_EDITOR, object);
                eventDispatcher.dispatchEvent(k);
                eventDispatcher.dispatchEvent(new RoomObjectStateChangedEvent(RoomObjectStateChangedEvent.STATE_CHANGE, object, -1));
            }
        }

        private function requestInit():void
        {
            if (((object == null) || (eventDispatcher == null)))
            {
                return;
            }
            this._disposeEventsAllowed = true;
            var k:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.JUKEBOX_INIT, object);
            eventDispatcher.dispatchEvent(k);
            this._isInitialized = true;
        }

        private function _Str_5930():void
        {
            if (((object == null) || (eventDispatcher == null)))
            {
                return;
            }
            this._disposeEventsAllowed = true;
            var k:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.JUKEBOX_START, object);
            eventDispatcher.dispatchEvent(k);
        }

        private function _Str_18998():void
        {
            if (((object == null) || (eventDispatcher == null)))
            {
                return;
            }
            var k:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.JUKEBOX_MACHINE_STOP, object);
            eventDispatcher.dispatchEvent(k);
        }

        private function _Str_18894():void
        {
            if (!this._disposeEventsAllowed)
            {
                return;
            }
            if (((object == null) || (eventDispatcher == null)))
            {
                return;
            }
            var k:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.JUKEBOX_DISPOSE, object);
            eventDispatcher.dispatchEvent(k);
        }
    }
}
