package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectStateChangedEvent;
    import com.sulake.room.events.RoomObjectEvent;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureHockeyScoreLogic extends FurnitureLogic 
    {


        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectStateChangedEvent.STATE_CHANGE];
            return getAllEventTypes(super.getEventTypes(), k);
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
                    switch (k.spriteTag)
                    {
                        case "off":
                            _local_3 = new RoomObjectStateChangedEvent(RoomObjectStateChangedEvent.STATE_CHANGE, object, 3);
                            break;
                    }
                    break;
                case MouseEvent.CLICK:
                    switch (k.spriteTag)
                    {
                        case "inc":
                            _local_3 = new RoomObjectStateChangedEvent(RoomObjectStateChangedEvent.STATE_CHANGE, object, 2);
                            break;
                        case "dec":
                            _local_3 = new RoomObjectStateChangedEvent(RoomObjectStateChangedEvent.STATE_CHANGE, object, 1);
                            break;
                    }
                    break;
            }
            if (((!(eventDispatcher == null)) && (!(_local_3 == null))))
            {
                eventDispatcher.dispatchEvent(_local_3);
            }
            else
            {
                super.mouseEvent(k, _arg_2);
            }
        }

        override public function useObject():void
        {
            var k:RoomObjectEvent;
            if (object != null)
            {
                k = new RoomObjectStateChangedEvent(RoomObjectStateChangedEvent.STATE_CHANGE, object, 3);
                if (eventDispatcher != null)
                {
                    eventDispatcher.dispatchEvent(k);
                }
            }
        }
    }
}
