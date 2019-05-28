package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.room.object.IRoomObjectModelController;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureInternalLinkLogic extends FurnitureLogic 
    {
        private var _showStateOneOnceRendered:Boolean = false;
        private var _updateCount:int = 0;


        override public function initialize(k:XML):void
        {
            super.initialize(k);
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.action;
            if (_local_2.length() != 0)
            {
                object.getModelController().setString(RoomObjectVariableEnum.FURNITURE_INTERNAL_LINK, _local_2.@link);
                if (_local_2.@startState == "1")
                {
                    this._showStateOneOnceRendered = true;
                }
            }
        }

        override public function getEventTypes():Array
        {
            return getAllEventTypes(super.getEventTypes(), [RoomObjectWidgetRequestEvent.INERNAL_LINK]);
        }

        override public function useObject():void
        {
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                eventDispatcher.dispatchEvent(new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.INERNAL_LINK, object));
            }
        }

        override public function update(k:int):void
        {
            super.update(k);
            if (!this._showStateOneOnceRendered)
            {
                return;
            }
            this._updateCount++;
            if (((this._showStateOneOnceRendered) && (this._updateCount == 20)))
            {
                this._Str_6210(1);
            }
        }

        public function _Str_6210(k:int):void
        {
            if (object == null)
            {
                return;
            }
            var _local_2:IRoomObjectModelController = object.getModelController();
            if (_local_2 != null)
            {
                _local_2.setNumber(RoomObjectVariableEnum.FURNITURE_AUTOMATIC_STATE_INDEX, k, false);
            }
        }

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            if (k == null)
            {
                return;
            }
            if (((k.type == MouseEvent.DOUBLE_CLICK) && (this._showStateOneOnceRendered)))
            {
                this._Str_6210(0);
            }
            super.mouseEvent(k, _arg_2);
        }
    }
}
