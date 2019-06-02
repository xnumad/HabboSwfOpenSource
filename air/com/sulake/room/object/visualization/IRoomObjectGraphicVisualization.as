//com.sulake.room.object.visualization.IRoomObjectGraphicVisualization

package com.sulake.room.object.visualization{
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;

    public /*dynamic*/ interface IRoomObjectGraphicVisualization extends IRoomObjectVisualization {

        function get assetCollection():IGraphicAssetCollection;
        function set assetCollection(k:IGraphicAssetCollection):void;
        function set externalBaseUrl(k:String):void;

    }
}//package com.sulake.room.object.visualization

