package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.utils.XMLValidator;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;

    public class WallAdRasterizer extends WallRasterizer 
    {


        override public function getTextureIdentifier(k:Number, _arg_2:IVector3d):String
        {
            return String(k);
        }

        override protected function initializePlanes():void
        {
            if (data == null)
            {
                return;
            }
            var k:XMLList = data.wallAds;
            if (k.length() > 0)
            {
                this.parseWalls(k[0]);
            }
        }

        override protected function parseWalls(k:XML):void
        {
            var _local_4:XML;
            var _local_5:String;
            var _local_6:XMLList;
            var _local_7:WallPlane;
            if (k == null)
            {
                return;
            }
            var _local_2:XMLList = k.wallAd;
            var _local_3:int;
            while (_local_3 < _local_2.length())
            {
                _local_4 = _local_2[_local_3];
                if (XMLValidator.checkRequiredAttributes(_local_4, ["id"]))
                {
                    _local_5 = _local_4.@id;
                    _local_6 = _local_4.visualization;
                    _local_7 = new WallPlane();
                    parseVisualizations(_local_7, _local_6);
                    if (getPlane(_local_5) == null)
                    {
                        _Str_3453(_local_5, _local_7);
                    }
                    else
                    {
                        _local_7.dispose();
                    }
                }
                _local_3++;
            }
        }

        override public function render(k:BitmapData, _arg_2:String, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:IVector3d, _arg_7:Boolean, _arg_8:Number=0, _arg_9:Number=0, _arg_10:Number=0, _arg_11:Number=0, _arg_12:int=0):PlaneBitmapData
        {
            var _local_13:WallPlane = (getPlane(_arg_2) as WallPlane);
            if (_local_13 == null)
            {
                _local_13 = (getPlane(DEFAULT) as WallPlane);
            }
            if (_local_13 == null)
            {
                return null;
            }
            if (k != null)
            {
                k.fillRect(k.rect, 0xFFFFFF);
            }
            var _local_14:BitmapData = _local_13.render(k, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7);
            if (((!(_local_14 == null)) && (!(_local_14 == k))))
            {
                _local_14 = _local_14.clone();
            }
            var _local_15:PlaneBitmapData = new PlaneBitmapData(_local_14, -1);
            return _local_15;
        }
    }
}
