//com.sulake.room.object.IRoomObjectVisualizationFactory

package com.sulake.room.object{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;

    public /*dynamic*/ interface IRoomObjectVisualizationFactory extends IUnknown {

        function createRoomObjectVisualization(k:String):IRoomObjectGraphicVisualization;
        function createGraphicAssetCollection():IGraphicAssetCollection;
        function getRoomObjectVisualizationData(k:String, _arg_2:String, _arg_3:XML):IRoomObjectVisualizationData;

    }
}//package com.sulake.room.object

