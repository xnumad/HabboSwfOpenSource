package com.sulake.room.object
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;

    public interface IRoomObjectVisualizationFactory extends IUnknown 
    {
        function createRoomObjectVisualization(_arg_1:String):IRoomObjectGraphicVisualization;
        function createGraphicAssetCollection():IGraphicAssetCollection;
        function getRoomObjectVisualizationData(_arg_1:String, _arg_2:String, _arg_3:XML):IRoomObjectVisualizationData;
    }
}
