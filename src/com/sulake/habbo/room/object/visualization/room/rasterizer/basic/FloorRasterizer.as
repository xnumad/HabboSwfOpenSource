package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import com.sulake.room.utils.XMLValidator;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
    import com.sulake.room.utils.IVector3d;

    public class FloorRasterizer extends PlaneRasterizer 
    {
        override protected function initializePlanes():void
        {
            if (data == null)
            {
                return;
            }
            var k:XMLList = data.floors;
            if (k.length() > 0)
            {
                this.parseFloors(k[0]);
            }
        }

        private function parseFloors(k:XML):void
        {
            var _local_4:XML;
            var _local_5:String;
            var _local_6:XMLList;
            var _local_7:FloorPlane;
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.floor;
            var _local_3:int;
            while (_local_3 < _local_2.length())
            {
                _local_4 = _local_2[_local_3];
                if (XMLValidator.checkRequiredAttributes(_local_4, ["id"]))
                {
                    _local_5 = _local_4.@id;
                    _local_6 = _local_4.visualization;
                    _local_7 = new FloorPlane();
                    parseVisualizations(_local_7, _local_6);
                    if (!_Str_3453(_local_5, _local_7))
                    {
                        _local_7.dispose();
                    }
                }
                _local_3++;
            }
        }

        override public function render(canvas:BitmapData, id:String, width:Number, height:Number, scale:Number, normal:IVector3d, useTexture:Boolean, offsetX:Number=0, offsetY:Number=0, maxX:Number=0, maxY:Number=0, timeSinceStartMs:int=0):PlaneBitmapData
        {
            var bitmapData:BitmapData;
            var floor:FloorPlane = (getPlane(id) as FloorPlane);
            if (floor == null)
            {
                floor = (getPlane(DEFAULT) as FloorPlane);
            }
            if (floor == null)
            {
                return null;
            }
            if (canvas != null)
            {
                canvas.fillRect(canvas.rect, 0xFFFFFF);
            }
            bitmapData = floor.render(canvas, width, height, scale, normal, useTexture, offsetX, offsetY);
            if (((!(bitmapData == null)) && (!(bitmapData == canvas))))
            {
                try
                {
                    bitmapData = bitmapData.clone();
                }
                catch(e:Error)
                {
                    if (bitmapData)
                    {
                        bitmapData.dispose();
                    }
                    return null;
                }
            }
            var planeBitmapData:PlaneBitmapData = new PlaneBitmapData(bitmapData, -1);
            return planeBitmapData;
        }
    }
}
