package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.room.object.visualization.data.ColorData;

    public class FurnitureStickieVisualization extends FurnitureVisualization 
    {
        private var _data:FurnitureVisualizationData = null;


        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            this._data = (k as FurnitureVisualizationData);
            return super.initialize(k);
        }

        override protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int
        {
            if (this._data == null)
            {
                return ColorData.DEFAULT_COLOR;
            }
            var _local_4:int = this._data._Str_751(k, _arg_2, _arg_3);
            return _local_4;
        }
    }
}
