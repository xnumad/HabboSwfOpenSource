package com.sulake.habbo.room.preview
{
    import com.sulake.habbo.room.IRoomEngine;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.room.utils.RoomId;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.data.LegacyStuffData;
    import com.sulake.room.utils.Vector3d;
    import flash.utils.getTimer;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.IStuffData;
    import flash.display.DisplayObject;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.room.object.visualization.IRoomObjectVisualization;
    import flash.display.BitmapData;

    public class RoomPreviewer 
    {
        private static const PREVIEW_CANVAS_ID:int = 1;
        private static const PREVIEW_OBJECT_ID:int = 1;
        private static const PREVIEW_OBJECT_LOCATION_X:int = 2;
        private static const PREVIEW_OBJECT_LOCATION_Y:int = 2;
        private static const ALLOWED_IMAGE_CUT:Number = 0.25;
        public static const SCALE_NORMAL:int = 64;
        public static const SCALE_SMALL:int = 32;
        private static const AUTOMATIC_STATE_CHANGE_INTERVAL:int = 2500;

        private var _roomEngine:IRoomEngine;
        private var _previewRoomId:int = 1;
        private var _currentPreviewObjectType:int = 0;
        private var _currentPreviewObjectCategory:int = 0;
        private var _currentPreviewObjectData:String = "";
        private var _currentPreviewRectangle:Rectangle = null;
        private var _currentPreviewCanvasWidth:int = 0;
        private var _currentPreviewCanvasHeight:int = 0;
        private var _currentPreviewScale:int = 64;
        private var _currentPreviewNeedsZoomOut:Boolean;
        private var _automaticStateChange:Boolean;
        private var _previousAutomaticStateChangeTime:int;
        private var _addViewOffset:Point;
        private var _disableUpdate:Boolean = false;

        public function RoomPreviewer(k:IRoomEngine, _arg_2:int=1)
        {
            this._addViewOffset = new Point(0, 0);
            super();
            this._roomEngine = k;
            this._previewRoomId = RoomId.makeRoomPreviewerId(_arg_2);
            if (this.isRoomEngineReady)
            {
                this._roomEngine.events.addEventListener(RoomEngineObjectEvent.ADDED, this.onRoomObjectAdded);
                this._roomEngine.events.addEventListener(RoomEngineObjectEvent.CONTENT_UPDATED, this.onRoomObjectAdded);
                this._roomEngine.events.addEventListener(RoomEngineEvent.INITIALIZED, this.onRoomInitialized);
            }
            this.createRoomForPreviews();
        }

        public function dispose():void
        {
            this.reset(true);
            if (((this.isRoomEngineReady) && (!(this._roomEngine.events == null))))
            {
                this._roomEngine.events.removeEventListener(RoomEngineObjectEvent.ADDED, this.onRoomObjectAdded);
                this._roomEngine.events.removeEventListener(RoomEngineObjectEvent.CONTENT_UPDATED, this.onRoomObjectAdded);
                this._roomEngine.events.removeEventListener(RoomEngineEvent.INITIALIZED, this.onRoomInitialized);
            }
        }

        private function createRoomForPreviews():void
        {
            var k:int;
            var _local_2:RoomPlaneParser;
            var _local_3:int;
            var _local_4:int;
            if (this.isRoomEngineReady)
            {
                k = 7;
                _local_2 = new RoomPlaneParser();
                _local_2.initializeTileMap((k + 2), (k + 2));
                _local_3 = 1;
                while (_local_3 < (1 + k))
                {
                    _local_4 = 1;
                    while (_local_4 < (1 + k))
                    {
                        _local_2._Str_3982(_local_4, _local_3, 0);
                        _local_4++;
                    }
                    _local_3++;
                }
                _local_2.initializeFromTileData();
                this._roomEngine.initializeRoom(this._previewRoomId, _local_2._Str_5598());
                _local_2.dispose();
            }
        }

        public function reset(k:Boolean):void
        {
            if (this.isRoomEngineReady)
            {
                this._roomEngine.disposeObjectFurniture(this._previewRoomId, PREVIEW_OBJECT_ID);
                this._roomEngine.disposeObjectWallItem(this._previewRoomId, PREVIEW_OBJECT_ID);
                this._roomEngine.disposeObjectUser(this._previewRoomId, PREVIEW_OBJECT_ID);
                if (!k)
                {
                    this.updatePreviewRoomView();
                }
            }
            this._currentPreviewObjectCategory = RoomObjectCategoryEnum.CONST_MIN2;
        }

        public function addFurnitureIntoRoom(k:int, _arg_2:IVector3d, _arg_3:IStuffData=null, _arg_4:String=null):int
        {
            var _local_6:IRoomObject;
            var _local_5:int = -1;
            if (_arg_3 == null)
            {
                _arg_3 = new LegacyStuffData();
            }
            if (this.isRoomEngineReady)
            {
                if (((this._currentPreviewObjectCategory == RoomObjectCategoryEnum.CONST_10) && (this._currentPreviewObjectType == k)))
                {
                    return PREVIEW_OBJECT_ID;
                }
                this.reset(false);
                this._currentPreviewObjectType = k;
                this._currentPreviewObjectCategory = RoomObjectCategoryEnum.CONST_10;
                this._currentPreviewObjectData = "";
                if (this._roomEngine.addObjectFurniture(this._previewRoomId, PREVIEW_OBJECT_ID, k, new Vector3d(PREVIEW_OBJECT_LOCATION_X, PREVIEW_OBJECT_LOCATION_Y, 0), _arg_2, 0, _arg_3, NaN, -1, 0, 0, "", true, false))
                {
                    this._previousAutomaticStateChangeTime = getTimer();
                    this._automaticStateChange = true;
                    _local_5 = PREVIEW_OBJECT_ID;
                    _local_6 = this._roomEngine.getRoomObject(this._previewRoomId, PREVIEW_OBJECT_ID, this._currentPreviewObjectCategory);
                    if (_local_6)
                    {
                        if (_arg_4 != null)
                        {
                            (_local_6.getModel() as IRoomObjectModelController).setString(RoomObjectVariableEnum.FURNITURE_EXTRAS, _arg_4);
                        }
                    }
                    this.updatePreviewRoomView();
                }
            }
            return _local_5;
        }

        public function addWallItemIntoRoom(k:int, _arg_2:IVector3d, _arg_3:String):int
        {
            var _local_4:int = -1;
            if (this.isRoomEngineReady)
            {
                if ((((this._currentPreviewObjectCategory == RoomObjectCategoryEnum.CONST_20) && (this._currentPreviewObjectType == k)) && (this._currentPreviewObjectData == _arg_3)))
                {
                    return PREVIEW_OBJECT_ID;
                }
                this.reset(false);
                this._currentPreviewObjectType = k;
                this._currentPreviewObjectCategory = RoomObjectCategoryEnum.CONST_20;
                this._currentPreviewObjectData = _arg_3;
                if (this._roomEngine.addObjectWallItem(this._previewRoomId, PREVIEW_OBJECT_ID, k, new Vector3d(0.5, 2.3, 1.8), _arg_2, 0, _arg_3, 0, 0, "", -1, false))
                {
                    this._previousAutomaticStateChangeTime = getTimer();
                    this._automaticStateChange = true;
                    return PREVIEW_OBJECT_ID;
                }
            }
            return _local_4;
        }

        public function addAvatarIntoRoom(k:String, _arg_2:int):int
        {
            if (this.isRoomEngineReady)
            {
                this.reset(false);
                this._currentPreviewObjectType = 1;
                this._currentPreviewObjectCategory = RoomObjectCategoryEnum.CONST_100;
                this._currentPreviewObjectData = k;
                if (this._roomEngine.addObjectUser(this._previewRoomId, PREVIEW_OBJECT_ID, new Vector3d(PREVIEW_OBJECT_LOCATION_X, PREVIEW_OBJECT_LOCATION_Y, 0), new Vector3d(90, 0, 0), 135, 1, k))
                {
                    this._previousAutomaticStateChangeTime = getTimer();
                    this._automaticStateChange = true;
                    this.updateUserGesture(1);
                    this.updateUserEffect(_arg_2);
                    this.updateUserPosture("std");
                }
                this.updatePreviewRoomView();
                return PREVIEW_OBJECT_ID;
            }
            return -1;
        }

        public function updateUserPosture(k:String, _arg_2:String=""):void
        {
            if (this.isRoomEngineReady)
            {
                this._roomEngine.updateObjectUserPosture(this._previewRoomId, PREVIEW_OBJECT_ID, k, _arg_2);
            }
        }

        public function updateUserGesture(k:int):void
        {
            if (this.isRoomEngineReady)
            {
                this._roomEngine.updateObjectUserGesture(this._previewRoomId, PREVIEW_OBJECT_ID, k);
            }
        }

        public function updateUserEffect(k:int):void
        {
            if (this.isRoomEngineReady)
            {
                this._roomEngine.updateObjectUserEffect(this._previewRoomId, PREVIEW_OBJECT_ID, k);
            }
        }

        public function updateObjectUserFigure(k:String, _arg_2:String=null, _arg_3:String=null, _arg_4:Boolean=false):Boolean
        {
            if (this.isRoomEngineReady)
            {
                return this._roomEngine.updateObjectUserFigure(this._previewRoomId, PREVIEW_OBJECT_ID, k, _arg_2, _arg_3, _arg_4);
            }
            return false;
        }

        public function updateObjectUserAction(k:String, _arg_2:int, _arg_3:String=null):void
        {
            if (this.isRoomEngineReady)
            {
                this._roomEngine.updateObjectUserAction(this._previewRoomId, PREVIEW_OBJECT_ID, k, _arg_2, _arg_3);
            }
        }

        public function _Str_15499():void
        {
            if (this.isRoomEngineReady)
            {
                this._automaticStateChange = false;
                if (this._currentPreviewObjectCategory != RoomObjectCategoryEnum.CONST_100)
                {
                    this._roomEngine.changeObjectState(this._previewRoomId, PREVIEW_OBJECT_ID, this._currentPreviewObjectCategory);
                }
            }
        }

        private function checkAutomaticRoomObjectStateChange():void
        {
            var k:int;
            if (this._automaticStateChange)
            {
                k = getTimer();
                if (k > (this._previousAutomaticStateChangeTime + AUTOMATIC_STATE_CHANGE_INTERVAL))
                {
                    this._previousAutomaticStateChangeTime = k;
                    if (this.isRoomEngineReady)
                    {
                        this._roomEngine.changeObjectState(this._previewRoomId, PREVIEW_OBJECT_ID, this._currentPreviewObjectCategory);
                    }
                }
            }
        }

        public function getRoomCanvas(k:int, _arg_2:int):DisplayObject
        {
            var _local_3:DisplayObject;
            var _local_4:IRoomGeometry;
            if (this.isRoomEngineReady)
            {
                _local_3 = this._roomEngine.createRoomCanvas(this._previewRoomId, PREVIEW_CANVAS_ID, k, _arg_2, this._currentPreviewScale);
                this._roomEngine.setRoomCanvasMask(this._previewRoomId, PREVIEW_CANVAS_ID, true);
                _local_4 = this._roomEngine.getRoomCanvasGeometry(this._previewRoomId, PREVIEW_CANVAS_ID);
                if (_local_4 != null)
                {
                    _local_4.adjustLocation(new Vector3d(PREVIEW_OBJECT_LOCATION_X, PREVIEW_OBJECT_LOCATION_Y, 0), 30);
                }
                this._currentPreviewCanvasWidth = k;
                this._currentPreviewCanvasHeight = _arg_2;
                return _local_3;
            }
            return null;
        }

        public function modifyRoomCanvas(k:int, _arg_2:int):void
        {
            if (this.isRoomEngineReady)
            {
                this._currentPreviewCanvasWidth = k;
                this._currentPreviewCanvasHeight = _arg_2;
                this._roomEngine.modifyRoomCanvas(this._previewRoomId, PREVIEW_CANVAS_ID, k, _arg_2);
            }
        }

        public function set _Str_16605(k:Point):void
        {
            this._addViewOffset = k;
        }

        public function get _Str_16605():Point
        {
            return this._addViewOffset;
        }

        private function updatePreviewObjectBoundingRectangle(k:Point):void
        {
            var _local_3:Rectangle;
            var _local_2:Rectangle = this._roomEngine.getRoomObjectBoundingRectangle(this._previewRoomId, PREVIEW_OBJECT_ID, this._currentPreviewObjectCategory, PREVIEW_CANVAS_ID);
            if (((!(_local_2 == null)) && (!(k == null))))
            {
                _local_2.offset(-(this._currentPreviewCanvasWidth >> 1), -(this._currentPreviewCanvasHeight >> 1));
                _local_2.offset(-(k.x), -(k.y));
                if (this._currentPreviewRectangle == null)
                {
                    this._currentPreviewRectangle = _local_2;
                }
                else
                {
                    _local_3 = this._currentPreviewRectangle.union(_local_2);
                    if ((((((_local_3.width - this._currentPreviewRectangle.width) > ((this._currentPreviewCanvasWidth - this._currentPreviewRectangle.width) >> 1)) || ((_local_3.height - this._currentPreviewRectangle.height) > ((this._currentPreviewCanvasHeight - this._currentPreviewRectangle.height) >> 1))) || (this._currentPreviewRectangle.width < 1)) || (this._currentPreviewRectangle.height < 1)))
                    {
                        this._currentPreviewRectangle = _local_3;
                    }
                }
            }
        }

        private function validatePreviewSize(k:Point):Point
        {
            var _local_2:IRoomGeometry;
            if (((this._currentPreviewRectangle.width < 1) || (this._currentPreviewRectangle.height < 1)))
            {
                return k;
            }
            if (this.isRoomEngineReady)
            {
                _local_2 = this._roomEngine.getRoomCanvasGeometry(this._previewRoomId, PREVIEW_CANVAS_ID);
                if (((this._currentPreviewRectangle.width > (this._currentPreviewCanvasWidth * (1 + ALLOWED_IMAGE_CUT))) || (this._currentPreviewRectangle.height > (this._currentPreviewCanvasHeight * (1 + ALLOWED_IMAGE_CUT)))))
                {
                    if ((this._roomEngine as Component).getBoolean("zoom.enabled"))
                    {
                        if (this._roomEngine._Str_5151(this._previewRoomId, PREVIEW_CANVAS_ID) != 0.5)
                        {
                            this._roomEngine._Str_5041(this._previewRoomId, PREVIEW_CANVAS_ID, 0.5, null, null, false, false, true);
                            this._currentPreviewScale = SCALE_SMALL;
                            this._currentPreviewNeedsZoomOut = true;
                            k.x = (k.x >> 1);
                            k.y = (k.y >> 1);
                            this._currentPreviewRectangle.left = (this._currentPreviewRectangle.left >> 2);
                            this._currentPreviewRectangle.right = (this._currentPreviewRectangle.right >> 2);
                            this._currentPreviewRectangle.top = (this._currentPreviewRectangle.top >> 2);
                            this._currentPreviewRectangle.bottom = (this._currentPreviewRectangle.bottom >> 2);
                        }
                    }
                    else
                    {
                        if (_local_2.isZoomedIn())
                        {
                            _local_2.performZoomOut();
                            this._currentPreviewScale = SCALE_SMALL;
                            this._currentPreviewNeedsZoomOut = true;
                            k.x = (k.x >> 1);
                            k.y = (k.y >> 1);
                            this._currentPreviewRectangle.left = (this._currentPreviewRectangle.left >> 2);
                            this._currentPreviewRectangle.right = (this._currentPreviewRectangle.right >> 2);
                            this._currentPreviewRectangle.top = (this._currentPreviewRectangle.top >> 2);
                            this._currentPreviewRectangle.bottom = (this._currentPreviewRectangle.bottom >> 2);
                        }
                    }
                }
                else
                {
                    if ((((this._currentPreviewRectangle.width << 1) < ((this._currentPreviewCanvasWidth * (1 + ALLOWED_IMAGE_CUT)) - 5)) && ((this._currentPreviewRectangle.height << 1) < ((this._currentPreviewCanvasHeight * (1 + ALLOWED_IMAGE_CUT)) - 5))))
                    {
                        if ((this._roomEngine as Component).getBoolean("zoom.enabled"))
                        {
                            if (((!(this._roomEngine._Str_5151(this._previewRoomId, PREVIEW_CANVAS_ID) == 1)) && (!(this._currentPreviewNeedsZoomOut))))
                            {
                                this._roomEngine._Str_5041(this._previewRoomId, PREVIEW_CANVAS_ID, 1, null, null, false, false, true);
                                this._currentPreviewScale = SCALE_NORMAL;
                                k.x = (k.x << 1);
                                k.y = (k.y << 1);
                            }
                        }
                        else
                        {
                            if (((!(_local_2.isZoomedIn())) && (!(this._currentPreviewNeedsZoomOut))))
                            {
                                _local_2.performZoomIn();
                                this._currentPreviewScale = SCALE_NORMAL;
                                k.x = (k.x << 1);
                                k.y = (k.y << 1);
                            }
                        }
                    }
                }
            }
            return k;
        }

        public function zoomIn():void
        {
            var k:IRoomGeometry;
            if (this.isRoomEngineReady)
            {
                if ((this._roomEngine as Component).getBoolean("zoom.enabled"))
                {
                    this._roomEngine._Str_5041(this._previewRoomId, PREVIEW_CANVAS_ID, 1);
                }
                k = this._roomEngine.getRoomCanvasGeometry(this._previewRoomId, PREVIEW_CANVAS_ID);
                k.performZoomIn();
            }
            this._currentPreviewScale = SCALE_NORMAL;
        }

        public function zoomOut():void
        {
            var _local_1:IRoomGeometry;
            if (this.isRoomEngineReady)
            {
                if ((this._roomEngine as Component).getBoolean("zoom.enabled"))
                {
                    this._roomEngine._Str_5041(this._previewRoomId, PREVIEW_CANVAS_ID, 0.5);
                }
                else
                {
                    _local_1 = this._roomEngine.getRoomCanvasGeometry(this._previewRoomId, PREVIEW_CANVAS_ID);
                    _local_1.performZoomOut();
                }
            }
            this._currentPreviewScale = SCALE_SMALL;
        }

        public function updateAvatarDirection(k:int, _arg_2:int):void
        {
            if (this.isRoomEngineReady)
            {
                this._roomEngine.updateObjectUser(this._previewRoomId, PREVIEW_OBJECT_ID, new Vector3d(PREVIEW_OBJECT_LOCATION_X, PREVIEW_OBJECT_LOCATION_Y, 0), new Vector3d(PREVIEW_OBJECT_LOCATION_X, PREVIEW_OBJECT_LOCATION_Y, 0), false, 0, new Vector3d((k * 45), 0, 0), (_arg_2 * 45));
            }
        }

        public function updateObjectRoom(k:String=null, _arg_2:String=null, _arg_3:String=null, _arg_4:Boolean=false):Boolean
        {
            if (this.isRoomEngineReady)
            {
                return this._roomEngine.updateObjectRoom(this._previewRoomId, k, _arg_2, _arg_3, false);
            }
            return false;
        }

        public function updateRoomWallsAndFloorVisibility(k:Boolean, _arg_2:Boolean=true):void
        {
            if (this.isRoomEngineReady)
            {
                this._roomEngine.updateObjectRoomVisibilities(this._previewRoomId, k, _arg_2);
            }
        }

        private function getCanvasOffset(k:Point):Point
        {
            var _local_7:Number;
            if (((this._currentPreviewRectangle.width < 1) || (this._currentPreviewRectangle.height < 1)))
            {
                return k;
            }
            var _local_2:* = (-(this._currentPreviewRectangle.left + this._currentPreviewRectangle.right) >> 1);
            var _local_3:* = (-(this._currentPreviewRectangle.top + this._currentPreviewRectangle.bottom) >> 1);
            var _local_4:* = ((this._currentPreviewCanvasHeight - this._currentPreviewRectangle.height) >> 1);
            if (_local_4 > 10)
            {
                _local_3 = (_local_3 + Math.min(15, (_local_4 - 10)));
            }
            else
            {
                if (this._currentPreviewObjectCategory != RoomObjectCategoryEnum.CONST_100)
                {
                    _local_3 = (_local_3 + (5 - Math.max(0, (_local_4 / 2))));
                }
                else
                {
                    _local_3 = (_local_3 - (5 - Math.min(0, (_local_4 / 2))));
                }
            }
            _local_3 = (_local_3 + this._addViewOffset.y);
            _local_2 = (_local_2 + this._addViewOffset.x);
            var _local_5:int = (_local_2 - k.x);
            var _local_6:int = (_local_3 - k.y);
            if (((!(_local_5 == 0)) || (!(_local_6 == 0))))
            {
                _local_7 = Math.sqrt(((_local_5 * _local_5) + (_local_6 * _local_6)));
                if (_local_7 > 10)
                {
                    _local_2 = (k.x + ((_local_5 * 10) / _local_7));
                    _local_3 = (k.y + ((_local_6 * 10) / _local_7));
                }
                return new Point(_local_2, _local_3);
            }
            return null;
        }

        public function updatePreviewRoomView(k:Boolean=false):void
        {
            var _local_2:Point;
            var _local_3:int;
            var _local_4:Point;
            if (((this._disableUpdate) && (!(k))))
            {
                return;
            }
            this.checkAutomaticRoomObjectStateChange();
            if (this.isRoomEngineReady)
            {
                _local_2 = this._roomEngine.getRoomCanvasScreenOffset(this._previewRoomId, PREVIEW_CANVAS_ID);
                if (_local_2 != null)
                {
                    this.updatePreviewObjectBoundingRectangle(_local_2);
                    if (this._currentPreviewRectangle != null)
                    {
                        _local_3 = this._currentPreviewScale;
                        _local_2 = this.validatePreviewSize(_local_2);
                        _local_4 = this.getCanvasOffset(_local_2);
                        if (_local_4 != null)
                        {
                            this._roomEngine.setRoomCanvasScreenOffset(this._previewRoomId, PREVIEW_CANVAS_ID, _local_4);
                        }
                        if (this._currentPreviewScale != _local_3)
                        {
                            this._currentPreviewRectangle = null;
                        }
                    }
                }
            }
        }

        public function set disableUpdate(k:Boolean):void
        {
            this._disableUpdate = k;
        }

        public function set disableRoomEngineUpdate(k:Boolean):void
        {
            if (this.isRoomEngineReady)
            {
                this._roomEngine.disableUpdate = k;
            }
        }

        private function onRoomInitialized(k:RoomEngineEvent):void
        {
            if (k == null)
            {
                return;
            }
            switch (k.type)
            {
                case RoomEngineEvent.INITIALIZED:
                    if (k.roomId == this._previewRoomId)
                    {
                        if (this.isRoomEngineReady)
                        {
                            this._roomEngine.updateObjectRoom(this._previewRoomId, "110", "99999");
                        }
                    }
                    return;
            }
        }

        private function onRoomObjectAdded(k:RoomEngineObjectEvent):void
        {
            var _local_2:IRoomObject;
            var _local_3:Number;
            var _local_4:Number;
            if ((((k.roomId == this._previewRoomId) && (k._Str_1577 == PREVIEW_OBJECT_ID)) && (k.category == this._currentPreviewObjectCategory)))
            {
                this._currentPreviewRectangle = null;
                this._currentPreviewNeedsZoomOut = false;
                _local_2 = this._roomEngine.getRoomObject(k.roomId, k._Str_1577, k.category);
                if ((((!(_local_2 == null)) && (!(_local_2.getModel() == null))) && (k.category == RoomObjectCategoryEnum.CONST_20)))
                {
                    _local_3 = _local_2.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Z);
                    _local_4 = _local_2.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_CENTER_Z);
                    if (((!(isNaN(_local_3))) && (!(isNaN(_local_4)))))
                    {
                        this._roomEngine.updateObjectWallItemLocation(k.roomId, k._Str_1577, new Vector3d(0.5, 2.3, (((3.6 - _local_3) / 2) + _local_4)));
                    }
                }
            }
        }

        public function updateRoomEngine():void
        {
            if (this.isRoomEngineReady)
            {
                this._roomEngine.runUpdate();
            }
        }

        public function getGenericRoomObjectImage(k:String, _arg_2:String, _arg_3:IVector3d, _arg_4:int, _arg_5:IGetImageListener, _arg_6:uint=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, _arg_10:int=-1, _arg_11:String=null):ImageResult
        {
            if (this.isRoomEngineReady)
            {
                return this._roomEngine.getGenericRoomObjectImage(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            }
            return null;
        }

        public function getRoomObjectImage(k:int, _arg_2:IVector3d, _arg_3:int, _arg_4:IGetImageListener, _arg_5:uint=0):ImageResult
        {
            if (this.isRoomEngineReady)
            {
                return this._roomEngine.getRoomObjectImage(this._previewRoomId, PREVIEW_OBJECT_ID, k, _arg_2, _arg_3, _arg_4, _arg_5);
            }
            return null;
        }

        public function getRoomObjectCurrentImage():BitmapData
        {
            var k:IRoomObject;
            var _local_2:IRoomObjectVisualization;
            if (this.isRoomEngineReady)
            {
                k = this._roomEngine.getRoomObject(this._previewRoomId, PREVIEW_OBJECT_ID, RoomObjectCategoryEnum.CONST_100);
                if (k)
                {
                    _local_2 = k.getVisualization();
                    if (_local_2)
                    {
                        return _local_2.getImage(0xFFFFFF, -1);
                    }
                }
            }
            return null;
        }

        public function get isRoomEngineReady():Boolean
        {
            return (!(this._roomEngine == null)) && (this._roomEngine.isInitialized);
        }
    }
}
