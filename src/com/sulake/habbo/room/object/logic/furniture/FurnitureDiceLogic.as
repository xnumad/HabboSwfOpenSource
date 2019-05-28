package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
    import com.sulake.room.events.RoomObjectEvent;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureDiceLogic extends FurnitureLogic 
    {
        private var _noTags:Boolean = false;
        private var _noTagsLastStateActivate:Boolean = false;


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectFurnitureActionEvent.DICE_ACTIVATE, RoomObjectFurnitureActionEvent.DICE_OFF];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function initialize(k:XML):void
        {
            super.initialize(k);
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.allspritesactivate;
            if (_local_2.length() == 0)
            {
                this._noTags = false;
            }
            else
            {
                this._noTags = true;
            }
        }

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            var _local_3:RoomObjectEvent;
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
                    if (eventDispatcher != null)
                    {
                        if (this._noTags)
                        {
                            if ((((!(this._noTagsLastStateActivate)) || (object.getState(0) == 0)) || (object.getState(0) == 100)))
                            {
                                _local_3 = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.DICE_ACTIVATE, object);
                                this._noTagsLastStateActivate = true;
                            }
                            else
                            {
                                _local_3 = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.DICE_OFF, object);
                                this._noTagsLastStateActivate = false;
                            }
                        }
                        else
                        {
                            if ((((k.spriteTag == "activate") || (object.getState(0) == 0)) || (object.getState(0) == 100)))
                            {
                                _local_3 = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.DICE_ACTIVATE, object);
                            }
                            else
                            {
                                if (k.spriteTag == "deactivate")
                                {
                                    _local_3 = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.DICE_OFF, object);
                                }
                            }
                        }
                        if (_local_3 != null)
                        {
                            eventDispatcher.dispatchEvent(_local_3);
                        }
                    }
                    return;
                default:
                    super.mouseEvent(k, _arg_2);
            }
        }
    }
}
