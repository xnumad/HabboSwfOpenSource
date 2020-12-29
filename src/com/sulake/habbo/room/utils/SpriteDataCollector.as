package com.sulake.habbo.room.utils
{
    import com.sulake.room.data.RoomObjectSpriteData;
    import com.sulake.room.object.IRoomObject;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
    import com.sulake.habbo.room.RoomEngine;
    import flash.geom.Rectangle;
    import com.sulake.room.renderer.IRoomRenderingCanvas;
    import flash.geom.Point;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.habbo.room.object.visualization.room.PlaneDrawingData;
    import com.sulake.room.object.visualization.IPlaneDrawingData;
    import com.sulake.room.object.visualization.IRoomPlane;
    import com.sulake.room.object.visualization.ISortableSprite;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.Stage;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.visualization.IPlaneVisualization;
    import com.sulake.core.Core;
    import __AS3__.vec.*;

    public class SpriteDataCollector 
    {
        private static const MANNEQUIN_MAGIC_X_OFFSET:int = 1;
        private static const MANNEQUIN_MAGIC_Y_OFFSET:int = -16;
        private static const AVATAR_WATER_EFFECT_MAGIC_Y_OFFSET:int = -52;
        private static const MAX_EXTERNAL_IMAGE_COUNT:int = 30;

        private var maxZ:Number;
        private var spriteCount:int = 0;
        private var externalImageCount:int = 0;


        private static function addMannequinSprites(k:Vector.<RoomObjectSpriteData>, _arg_2:RoomEngine):Vector.<RoomObjectSpriteData>
        {
            var _local_4:RoomObjectSpriteData;
            var _local_5:IRoomObject;
            var _local_6:Array;
            var _local_7:RoomObjectSpriteData;
            var _local_3:Vector.<RoomObjectSpriteData> = new Vector.<RoomObjectSpriteData>();
            for each (_local_4 in k)
            {
                if (((_local_4.objectType == "boutique_mannequin1") && (_local_4.name.indexOf("mannequin_") == 0)))
                {
                    _local_5 = _arg_2.getRoomObject(_arg_2.activeRoomId, _local_4.objectId, RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
                    if (_local_5 != null)
                    {
                        _local_6 = IRoomObjectSpriteVisualization(_local_5.getVisualization()).getSpriteList();
                        if (_local_6 != null)
                        {
                            for each (_local_7 in _local_6)
                            {
                                _local_7.x = (_local_7.x + ((_local_4.x + (_local_4.width / 2)) + MANNEQUIN_MAGIC_X_OFFSET));
                                _local_7.y = (_local_7.y + ((_local_4.y + _local_4.height) + MANNEQUIN_MAGIC_Y_OFFSET));
                                _local_7.z = (_local_7.z + _local_4.z);
                                _local_3.push(_local_7);
                            }
                        }
                    }
                }
                else
                {
                    _local_3.push(_local_4);
                }
            }
            return _local_3;
        }

        private static function sortSpriteDataObjects(k:RoomObjectSpriteData, _arg_2:RoomObjectSpriteData):Number
        {
            if (k.z < _arg_2.z)
            {
                return 1;
            }
            if (k.z > _arg_2.z)
            {
                return -1;
            }
            return -1;
        }

        private static function isSpriteInViewPort(k:RoomObjectSpriteData, _arg_2:Rectangle, _arg_3:IRoomRenderingCanvas):Boolean
        {
            var _local_4:Rectangle = new Rectangle((k.x + _arg_3.screenOffsetX), (k.y + _arg_3.screenOffsetY), k.width, k.height);
            return _local_4.intersects(_arg_2);
        }

        private static function sortQuadPoints(k:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point):Vector.<Point>
        {
            var _local_6:Point;
            var _local_5:Vector.<Point> = new Vector.<Point>(0);
            if (k.x == _arg_2.x)
            {
                _local_5.push(k, _arg_3, _arg_2, _arg_4);
            }
            else
            {
                if (k.x == _arg_3.x)
                {
                    _local_5.push(k, _arg_2, _arg_3, _arg_4);
                }
                else
                {
                    if ((((_arg_2.x < k.x) && (_arg_2.y > k.y)) || ((_arg_2.x > k.x) && (_arg_2.y < k.y))))
                    {
                        _local_5.push(k, _arg_3, _arg_2, _arg_4);
                    }
                    else
                    {
                        _local_5.push(k, _arg_2, _arg_3, _arg_4);
                    }
                }
            }
            if (_local_5[0].x < _local_5[1].x)
            {
                _local_6 = _local_5[0];
                _local_5[0] = _local_5[1];
                _local_5[1] = _local_6;
                _local_6 = _local_5[2];
                _local_5[2] = _local_5[3];
                _local_5[3] = _local_6;
            }
            if (_local_5[0].y < _local_5[2].y)
            {
                _local_6 = _local_5[0];
                _local_5[0] = _local_5[2];
                _local_5[2] = _local_6;
                _local_6 = _local_5[1];
                _local_5[1] = _local_5[3];
                _local_5[3] = _local_6;
            }
            return _local_5;
        }


        public function getFurniData(k:Rectangle, _arg_2:IRoomRenderingCanvas, _arg_3:RoomEngine, _arg_4:int):String
        {
            var _local_8:IRoomObject;
            var _local_9:RoomObjectSpriteData;
            var _local_10:String;
            var _local_11:Array;
            var _local_12:Number;
            var _local_13:int;
            var _local_14:RoomObjectSpriteData;
            var _local_15:Point;
            var _local_16:RoomObjectSpriteData;
            var _local_5:Vector.<Object> = new Vector.<Object>();
            var _local_6:Vector.<RoomObjectSpriteData> = _arg_2.getSortableSpriteList();
            var _local_7:Array = _arg_3.getRoomObjects(_arg_3.activeRoomId, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
            for each (_local_8 in _local_7)
            {
                if (_local_8.getId() != _arg_4)
                {
                    _local_11 = IRoomObjectSpriteVisualization(_local_8.getVisualization()).getSpriteList();
                    if (_local_11)
                    {
                        _local_12 = 0;
                        _local_13 = 0;
                        for each (_local_14 in _local_6)
                        {
                            if (_local_14.name == ("avatar_" + _local_8.getId()))
                            {
                                _local_12 = _local_14.z;
                                _local_13 = ((_local_14.y + _local_14.height) - (_arg_2.geometry.scale / 4));
                                break;
                            }
                        }
                        _local_15 = _arg_3.getRoomObjectScreenLocation(_arg_3.activeRoomId, _local_8.getId(), RoomObjectCategoryEnum.OBJECT_CATEGORY_USER, _arg_2.getId());
                        if (_local_15)
                        {
                            if (_local_13 == 0)
                            {
                                _local_13 = _local_15.y;
                            }
                            for each (_local_16 in _local_11)
                            {
                                _local_16.x = (_local_16.x + (_local_15.x - _arg_2.screenOffsetX));
                                _local_16.y = (_local_16.y + _local_13);
                                _local_16.z = (_local_16.z + _local_12);
                                if (((_local_16.name.indexOf("h_std_fx29_") == 0) || (_local_16.name.indexOf("h_std_fx185_") == 0)))
                                {
                                    _local_16.y = (_local_16.y + AVATAR_WATER_EFFECT_MAGIC_Y_OFFSET);
                                }
                                _local_6.push(_local_16);
                            }
                        }
                    }
                }
            }
            _local_6 = addMannequinSprites(_local_6, _arg_3);
            _local_6.sort(sortSpriteDataObjects);
            for each (_local_9 in _local_6)
            {
                if ((((((!(_local_9.name == null)) && (_local_9.name.length > 0)) && (!(_local_9.name.indexOf("tile_cursor_") == 0))) && (isSpriteInViewPort(_local_9, k, _arg_2))) && ((_arg_4 < 0) || (!(_local_9.objectId == _arg_4)))))
                {
                    _local_5.push(this.getSpriteDataObject(_local_9, k, _arg_2, _arg_3));
                    if (!this.maxZ)
                    {
                        this.maxZ = _local_9.z;
                    }
                    this.spriteCount++;
                }
            }
            _local_10 = JSON.stringify(_local_5);
            return _local_10;
        }

        public function getRoomRenderingModifiers(k:RoomEngine):String
        {
            var _local_2:Object = new Object();
            return JSON.stringify(_local_2);
        }

        private function getSpriteDataObject(k:RoomObjectSpriteData, _arg_2:Rectangle, _arg_3:IRoomRenderingCanvas, _arg_4:RoomEngine):Object
        {
            var _local_7:String;
            var _local_9:Array;
            var _local_10:IGraphicAssetCollection;
            var _local_11:XML;
            var _local_12:String;
            var _local_13:String;
            var _local_5:Object = new Object();
            var _local_6:String = k.name;
            if (k.name.indexOf("@") != -1)
            {
                _local_9 = k.name.split("@");
                _local_6 = _local_9[0];
                _local_7 = _local_9[1];
            }
            if (((_local_7) && (k.objectType)))
            {
                _local_10 = _arg_4.roomContentLoader.getGraphicAssetCollection(k.objectType);
                if (_local_10 != null)
                {
                    _local_11 = _local_10._Str_17888(_local_7);
                    if (((!(_local_11 == null)) && (!(_local_11.@source == null))))
                    {
                        _local_5.paletteSourceName = (_local_11.@source + "");
                    }
                }
            }
            var _local_8:String = _arg_4.configuration.getProperty("image.library.url");
            _local_6 = _local_6.replace("%image.library.url%", _local_8);
            if (_local_6.indexOf("%group.badge.url%") != -1)
            {
                _local_12 = _arg_4.configuration.getProperty("group.badge.url");
                _local_6 = _local_6.replace("%group.badge.url%", "");
                _local_13 = _local_12.replace("%imagerdata%", _local_6);
                _local_6 = _local_13;
            }
            _local_5.name = _local_6;
            _local_5.x = (k.x - _arg_2.x);
            _local_5.y = (k.y - _arg_2.y);
            _local_5.x = (_local_5.x + _arg_3.screenOffsetX);
            _local_5.y = (_local_5.y + _arg_3.screenOffsetY);
            _local_5.z = k.z;
            if (((k.alpha) && (!(k.alpha.toString() == "255"))))
            {
                _local_5.alpha = k.alpha;
            }
            if (k.flipH)
            {
                _local_5.flipH = k.flipH;
            }
            if (k.skew)
            {
                _local_5.skew = k.skew;
            }
            if (k.frame)
            {
                _local_5.frame = k.frame;
            }
            if (((k.color) && (k.color.length > 0)))
            {
                _local_5.color = int(k.color);
            }
            if (((k.blendMode) && (!(k.blendMode == "normal"))))
            {
                _local_5.blendMode = k.blendMode;
            }
            if (_local_6.indexOf("http") == 0)
            {
                _local_5.width = k.width;
                _local_5.height = k.height;
                this.externalImageCount++;
                if (this.externalImageCount > MAX_EXTERNAL_IMAGE_COUNT)
                {
                    _local_5.name = "box";
                }
            }
            if (k.posture)
            {
                _local_5.posture = k.posture;
            }
            return _local_5;
        }

        private function makeBackgroundPlane(viewport:Rectangle, color:uint, planes:Array):IPlaneDrawingData
        {
            var z:Number;
            var topleft:Point = new Point(0, 0);
            var bottomleft:Point = new Point(viewport.width, 0);
            var topright:Point = new Point(0, viewport.height);
            var bottomright:Point = new Point(viewport.width, viewport.height);
            var cornerPoints:Vector.<Point> = sortQuadPoints(topleft, bottomleft, topright, bottomright);
            if (planes.length > 0)
            {
                z = planes[0].z;
                if (this.maxZ)
                {
                    z = Math.max(this.maxZ, z);
                }
            }
            else
            {
                z = ((this.maxZ) ? this.maxZ : 0);
            }
            z = (z + ((this.spriteCount * 1.776104) + (planes.length * 2.31743)));
            var backgroundPlane:IPlaneDrawingData = new PlaneDrawingData(null, color);
            backgroundPlane.cornerPoints = cornerPoints;
            backgroundPlane.z = z;
            return backgroundPlane;
        }

        private function sortRoomPlanes(k:Vector.<IRoomPlane>, _arg_2:IRoomRenderingCanvas, _arg_3:RoomEngine):Array
        {
            var _local_6:IRoomPlane;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:ISortableSprite;
            var _local_10:Object;
            var _local_11:IRoomObjectSprite;
            var _local_4:Map = new Map();
            var _local_5:Number = 1;
            if (this.maxZ)
            {
                _local_5 = (_local_5 + this.maxZ);
            }
            for each (_local_6 in k)
            {
                _local_10 = {};
                _local_10.plane = _local_6;
                _local_10.z = _local_5;
                _local_4.add(_local_6.uniqueId, _local_10);
            }
            _local_7 = _arg_2.getPlaneSortableSprites();
            _local_7.sortOn("z", Array.NUMERIC);
            _local_7.reverse();
            _local_8 = [];
            for each (_local_9 in _local_7)
            {
                _local_11 = _local_9.sprite;
                if (_local_11 != null)
                {
                    _local_10 = _local_4.remove(_local_11.spriteType);
                    if (_local_10 != null)
                    {
                        _local_10.z = _local_9.z;
                        _local_8.push(_local_10);
                    }
                }
            }
            _local_8 = _local_8.concat(_local_4.getValues());
            return _local_8;
        }

        public function getRoomPlanes(viewport:Rectangle, _arg_2:IRoomRenderingCanvas, _arg_3:RoomEngine, color:uint):Array
        {
            var _local_8:IRoomGeometry;
            var _local_9:Array;
            var _local_10:Stage;
            var _local_11:Object;
            var _local_12:IRoomPlane;
            var _local_13:Vector.<Point>;
            var _local_14:Vector3d;
            var _local_15:Point;
            var _local_16:Point;
            var _local_17:Point;
            var _local_18:Point;
            var _local_19:int;
            var _local_20:int;
            var _local_21:Point;
            var _local_22:Vector.<Point>;
            var _local_23:IPlaneDrawingData;
            var planes:Array = [];
            var _local_6:IRoomObject = _arg_3.getRoomObject(_arg_3.activeRoomId, RoomEngine.OBJECT_ID_ROOM, RoomObjectCategoryEnum.OBJECT_CATEGORY_ROOM);
            var _local_7:IPlaneVisualization = (_local_6.getVisualization() as IPlaneVisualization);
            if (_local_7)
            {
                _local_8 = _arg_2.geometry;
                _local_9 = this.sortRoomPlanes(_local_7._Str_19113, _arg_2, _arg_3);
                _local_10 = Core.instance.displayObjectContainer.stage;
                for each (_local_11 in _local_9)
                {
                    _local_12 = _local_11.plane;
                    _local_13 = new Vector.<Point>(0);
                    _local_14 = Vector3d.sum(_local_12.location, _local_12.leftSide);
                    _local_15 = _local_8.getScreenPoint(_local_12.location);
                    _local_16 = _local_8.getScreenPoint(_local_14);
                    _local_17 = _local_8.getScreenPoint(Vector3d.sum(_local_12.location, _local_12.rightSide));
                    _local_18 = _local_8.getScreenPoint(Vector3d.sum(_local_14, _local_12.rightSide));
                    _local_13.push(_local_15, _local_16, _local_17, _local_18);
                    _local_19 = 0;
                    _local_20 = 0;
                    for each (_local_21 in _local_13)
                    {
                        _local_21.offset((_local_10.stageWidth / 2), (_local_10.stageHeight / 2));
                        _local_21.offset(_arg_2.screenOffsetX, _arg_2.screenOffsetY);
                        _local_21.offset(-(viewport.x), -(viewport.y));
                        if (_local_21.x < 0)
                        {
                            _local_19--;
                        }
                        else
                        {
                            if (_local_21.x >= viewport.width)
                            {
                                _local_19++;
                            }
                        }
                        if (_local_21.y < 0)
                        {
                            _local_20--;
                        }
                        else
                        {
                            if (_local_21.y >= viewport.height)
                            {
                                _local_20++;
                            }
                        }
                    }
                    if (((Math.abs(_local_19) == 4) || (Math.abs(_local_20) == 4)))
                    {
                    }
                    else
                    {
                        _local_22 = sortQuadPoints(_local_15, _local_16, _local_17, _local_18);
                        for each (_local_23 in _local_12.getDrawingDatas(_local_8))
                        {
                            _local_23.cornerPoints = _local_22;
                            _local_23.z = _local_11.z;
                            planes.push(_local_23);
                        }
                    }
                }
                planes.unshift(this.makeBackgroundPlane(viewport, color, planes));
            }
            return planes;
        }
    }
}
