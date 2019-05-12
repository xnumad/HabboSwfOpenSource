package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.core.utils.Map;

    public class FurnitureYoutubeVisualization extends FurnitureDynamicThumbnailVisualization 
    {
        protected static const THUMBNAIL_URL:String = "THUMBNAIL_URL";


        override protected function getThumbnailURL():String
        {
            var k:IRoomObjectModel = object.getModel();
            var _local_2:Map = k._Str_6183(RoomObjectVariableEnum.FURNITURE_DATA);
            var _local_3:String = k.getString(RoomObjectVariableEnum.SESSION_URL_PREFIX);
            if (_local_3 == null)
            {
                return null;
            }
            return _local_3 + _local_2.getValue(THUMBNAIL_URL);
        }
    }
}
