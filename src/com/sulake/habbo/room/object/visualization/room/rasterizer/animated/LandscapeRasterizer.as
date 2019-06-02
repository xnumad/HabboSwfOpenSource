package com.sulake.habbo.room.object.visualization.room.rasterizer.animated
{
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneRasterizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterial;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualizationLayer;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
    import com.sulake.room.utils.IVector3d;

    public class LandscapeRasterizer extends PlaneRasterizer 
    {
        private static const UPDATE_INTERVAL:int = 500;

        private var _landscapeWidth:int = 0;
        private var _landscapeHeight:int = 0;


        override public function initializeDimensions(k:int, _arg_2:int):Boolean
        {
            if (k < 0)
            {
                k = 0;
            }
            if (_arg_2 < 0)
            {
                _arg_2 = 0;
            }
            this._landscapeWidth = k;
            this._landscapeHeight = _arg_2;
            return true;
        }

        override protected function initializePlanes():void
        {
            if (data == null)
            {
                return;
            }
            var k:XMLList = data.landscapes;
            if (k.length() > 0)
            {
                this.parseLandscapes(k[0]);
            }
        }

        private function parseLandscapes(k:XML):void
        {
            var _local_6:XML;
            var _local_7:String;
            var _local_8:XMLList;
            var _local_9:LandscapePlane;
            var _local_10:int;
            var _local_11:XML;
            var _local_12:int;
            var _local_13:String;
            var _local_14:String;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:int;
            var _local_18:PlaneVisualization;
            var _local_19:int;
            var _local_20:XML;
            var _local_21:XML;
            var _local_22:PlaneMaterial;
            var _local_23:int;
            var _local_24:String;
            var _local_25:int;
            var _local_26:String;
            var _local_27:uint;
            var _local_28:String;
            var _local_29:String;
            var _local_30:XMLList;
            var _local_31:XML;
            var _local_32:int;
            var _local_33:XML;
            var _local_34:int;
            var _local_35:String;
            var _local_36:Number;
            var _local_37:Number;
            var _local_38:Number;
            var _local_39:Number;
            if (k == null)
            {
                return;
            }
            var _local_2:Array = ["id", "assetId"];
            var _local_3:int = int((Math.random() * 654321));
            var _local_4:XMLList = k.landscape;
            var _local_5:int;
            while (_local_5 < _local_4.length())
            {
                _local_6 = _local_4[_local_5];
                if (XMLValidator.checkRequiredAttributes(_local_6, ["id"]))
                {
                    _local_7 = _local_6.@id;
                    _local_8 = _local_6.animatedVisualization;
                    _local_9 = new LandscapePlane();
                    _local_10 = 0;
                    while (_local_10 < _local_8.length())
                    {
                        _local_11 = _local_8[_local_10];
                        if (XMLValidator.checkRequiredAttributes(_local_11, ["size"]))
                        {
                            _local_12 = parseInt(_local_11.@size);
                            _local_13 = _local_11.@horizontalAngle;
                            _local_14 = _local_11.@verticalAngle;
                            _local_15 = LandscapePlane.HORIZONTAL_ANGLE_DEFAULT;
                            if (_local_13 != "")
                            {
                                _local_15 = parseFloat(_local_13);
                            }
                            _local_16 = LandscapePlane.VERTICAL_ANGLE_DEFAULT;
                            if (_local_14 != "")
                            {
                                _local_16 = parseFloat(_local_14);
                            }
                            _local_17 = (_local_11.visualizationLayer.length() + _local_11.animationLayer.length());
                            _local_18 = _local_9.createPlaneVisualization(_local_12, _local_17, getGeometry(_local_12, _local_15, _local_16));
                            if (_local_18 != null)
                            {
                                Randomizer.setSeed(_local_3);
                                _local_19 = 0;
                                while (_local_19 < _local_11.children().length())
                                {
                                    _local_20 = _local_11.children()[_local_19];
                                    if (_local_20.name() == "visualizationLayer")
                                    {
                                        _local_21 = _local_20;
                                        _local_22 = null;
                                        _local_23 = PlaneVisualizationLayer.ALIGN_DEFAULT;
                                        if (XMLValidator.checkRequiredAttributes(_local_21, ["materialId"]))
                                        {
                                            _local_29 = _local_21.@materialId;
                                            _local_22 = material(_local_29);
                                        }
                                        _local_24 = _local_21.@offset;
                                        _local_25 = PlaneVisualizationLayer.DEFAULT_OFFSET;
                                        if (_local_24.length > 0)
                                        {
                                            _local_25 = parseInt(_local_24);
                                        }
                                        _local_26 = _local_21.@color;
                                        _local_27 = LandscapePlane.DEFAULT_COLOR;
                                        if (_local_26.length > 0)
                                        {
                                            _local_27 = parseInt(_local_26);
                                        }
                                        _local_28 = _local_21.@align;
                                        if (_local_28 == "bottom")
                                        {
                                            _local_23 = PlaneVisualizationLayer.ALIGN_BOTTOM;
                                        }
                                        else
                                        {
                                            if (_local_28 == "top")
                                            {
                                                _local_23 = PlaneVisualizationLayer.ALIGN_TOP;
                                            }
                                        }
                                        _local_18.setLayer(_local_19, _local_22, _local_27, _local_23, _local_25);
                                    }
                                    else
                                    {
                                        if (_local_20.name() == "animationLayer")
                                        {
                                            _local_30 = _local_20.animationItem;
                                            _local_31 = <animation/>
                                            ;
                                            _local_32 = 0;
                                            while (_local_32 < _local_30.length())
                                            {
                                                _local_33 = (_local_30[_local_32] as XML);
                                                if (_local_33 != null)
                                                {
                                                    if (XMLValidator.checkRequiredAttributes(_local_33, _local_2))
                                                    {
                                                        _local_34 = parseInt(_local_33.@id);
                                                        _local_35 = _local_33.@assetId;
                                                        _local_36 = 0;
                                                        _local_37 = 0;
                                                        _local_36 = this.getCoordinateValue(_local_33.@x, _local_33.@randomX);
                                                        _local_37 = this.getCoordinateValue(_local_33.@y, _local_33.@randomY);
                                                        _local_38 = 0;
                                                        _local_39 = 0;
                                                        _local_38 = parseFloat(_local_33.@speedX);
                                                        _local_39 = parseFloat(_local_33.@speedY);
                                                        _local_31.appendChild(new (XML)((((((((((('<item x="' + _local_36) + '" y="') + _local_37) + '" speedX="') + _local_38) + '" speedY="') + _local_39) + '" asset="') + _local_35) + '"/>')));
                                                    }
                                                }
                                                _local_32++;
                                            }
                                            _local_18.setAnimationLayer(_local_19, _local_31, assetCollection);
                                        }
                                    }
                                    _local_19++;
                                }
                            }
                        }
                        _local_10++;
                    }
                    if (!_Str_3453(_local_7, _local_9))
                    {
                        _local_9.dispose();
                    }
                }
                _local_5++;
            }
        }

        private function getCoordinateValue(k:String, _arg_2:String):Number
        {
            var _local_4:Number;
            var _local_5:Array;
            var _local_6:Number;
            var _local_3:Number = 0;
            if (k.length > 0)
            {
                if (k.charAt((k.length - 1)) == "%")
                {
                    k = k.substr(0, (k.length - 1));
                    _local_3 = (parseFloat(k) / 100);
                }
            }
            if (_arg_2.length > 0)
            {
                _local_4 = 10000;
                _local_5 = Randomizer.getValues(1, 0, _local_4);
                _local_6 = (_local_5[0] / _local_4);
                if (_arg_2.charAt((_arg_2.length - 1)) == "%")
                {
                    _arg_2 = _arg_2.substr(0, (_arg_2.length - 1));
                    _local_3 = (_local_3 + ((_local_6 * parseFloat(_arg_2)) / 100));
                }
            }
            return _local_3;
        }

        override public function render(canvas:BitmapData, id:String, width:Number, height:Number, scale:Number, normal:IVector3d, useTexture:Boolean, offsetX:Number=0, offsetY:Number=0, maxX:Number=0, maxY:Number=0, timeSinceStartMs:int=0):PlaneBitmapData
        {
            var bitmapData:BitmapData;
            var landscape:LandscapePlane = (getPlane(id) as LandscapePlane);
            if (landscape == null)
            {
                landscape = (getPlane(DEFAULT) as LandscapePlane);
            }
            if (landscape == null)
            {
                return null;
            }
            if (canvas != null)
            {
                canvas.fillRect(canvas.rect, 0xFFFFFF);
            }
            bitmapData = landscape.render(canvas, width, height, scale, normal, useTexture, offsetX, offsetY, maxX, maxY, timeSinceStartMs);
            if (((!(bitmapData == null)) && (!(bitmapData == canvas))))
            {
                try
                {
                    bitmapData = bitmapData.clone();
                }
                catch(e:Error)
                {
                    bitmapData.dispose();
                    return null;
                }
            }
            var planeBitmapData:PlaneBitmapData;
            if (((!(landscape.isStatic(scale))) && (UPDATE_INTERVAL > 0)))
            {
                planeBitmapData = new PlaneBitmapData(bitmapData, ((Math.round((timeSinceStartMs / UPDATE_INTERVAL)) * UPDATE_INTERVAL) + UPDATE_INTERVAL));
            }
            else
            {
                planeBitmapData = new PlaneBitmapData(bitmapData, -1);
            }
            return planeBitmapData;
        }

        override public function getTextureIdentifier(k:Number, _arg_2:IVector3d):String
        {
            if (_arg_2 != null)
            {
                if (_arg_2.x < 0)
                {
                    return String((k + "_0"));
                }
                return String((k + "_1"));
            }
            return super.getTextureIdentifier(k, _arg_2);
        }
    }
}
