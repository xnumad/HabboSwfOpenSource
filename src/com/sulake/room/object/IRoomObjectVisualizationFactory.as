package com.sulake.room.object
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;

    public interface IRoomObjectVisualizationFactory extends IUnknown 
    {
        function _Str_17646(_arg_1:String):IRoomObjectGraphicVisualization;
        function _Str_13110():IGraphicAssetCollection;
        function _Str_16399(_arg_1:String, _arg_2:String, _arg_3:XML):IRoomObjectVisualizationData;
    }
}
