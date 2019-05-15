package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObjectModel;

    public class FurnitureBBVisualization extends FurnitureBrandedImageVisualization 
    {
        override protected function getAdClickUrl(k:IRoomObjectModel):String
        {
            return k.getString(RoomObjectVariableEnum.FURNITURE_BRANDING_URL);
        }

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            return super.getSpriteXOffset(k, _arg_2, _arg_3) + offsetX;
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            return super.getSpriteYOffset(k, _arg_2, _arg_3) + offsetY;
        }

        override protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number
        {
            return super.getSpriteZOffset(k, _arg_2, _arg_3) + (offsetZ * -1);
        }
    }
}
