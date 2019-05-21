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
    import com.sulake.room.utils.IVector3D;
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
        private static const _Str_3694:int = 1;
        private static const _Str_3109:int = 1;
        private static const _Str_7483:int = 2;
        private static const _Str_7468:int = 2;
        private static const _Str_8975:Number = 0.25;
        public static const _Str_6747:int = 64;
        public static const _Str_8753:int = 32;
        private static const _Str_16567:int = 2500;

        private var _roomEngine:IRoomEngine;
        private var _Str_2733:int = 1;
        private var _Str_10248:int = 0;
        private var _Str_4566:int = 0;
        private var _Str_15323:String = "";
        private var _Str_2705:Rectangle = null;
        private var _Str_8626:int = 0;
        private var _Str_7356:int = 0;
        private var _Str_5883:int = 64;
        private var _Str_11693:Boolean;
        private var _Str_11574:Boolean;
        private var _Str_10076:int;
        private var _Str_9748:Point;
        private var _Str_21090:Boolean = false;

        public function RoomPreviewer(k:IRoomEngine, _arg_2:int=1)
        {
            this._Str_9748 = new Point(0, 0);
            super();
            this._roomEngine = k;
            this._Str_2733 = RoomId.makeRoomPreviewerId(_arg_2);
            if (this._Str_2949)
            {
                this._roomEngine.events.addEventListener(RoomEngineObjectEvent.ADDED, this._Str_7011);
                this._roomEngine.events.addEventListener(RoomEngineObjectEvent.CONTENT_UPDATED, this._Str_7011);
                this._roomEngine.events.addEventListener(RoomEngineEvent.INITIALIZED, this._Str_9875);
            }
            this._Str_25754();
        }

        public function dispose():void
        {
            this.reset(true);
            if (((this._Str_2949) && (!(this._roomEngine.events == null))))
            {
                this._roomEngine.events.removeEventListener(RoomEngineObjectEvent.ADDED, this._Str_7011);
                this._roomEngine.events.removeEventListener(RoomEngineObjectEvent.CONTENT_UPDATED, this._Str_7011);
                this._roomEngine.events.removeEventListener(RoomEngineEvent.INITIALIZED, this._Str_9875);
            }
        }

        private function _Str_25754():void
        {
            var k:int;
            var _local_2:RoomPlaneParser;
            var _local_3:int;
            var _local_4:int;
            if (this._Str_2949)
            {
                k = 7;
                _local_2 = new RoomPlaneParser();
                _local_2._Str_13735((k + 2), (k + 2));
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
                _local_2._Str_12919();
                this._roomEngine._Str_10152(this._Str_2733, _local_2._Str_5598());
                _local_2.dispose();
            }
        }

        public function reset(k:Boolean):void
        {
            if (this._Str_2949)
            {
                this._roomEngine._Str_6737(this._Str_2733, _Str_3109);
                this._roomEngine._Str_7974(this._Str_2733, _Str_3109);
                this._roomEngine._Str_9451(this._Str_2733, _Str_3109);
                if (!k)
                {
                    this._Str_9695();
                }
            }
            this._Str_4566 = RoomObjectCategoryEnum.CONST_MIN2;
        }

        public function _Str_18681(k:int, _arg_2:IVector3D, _arg_3:IStuffData=null, _arg_4:String=null):int
        {
            var _local_6:IRoomObject;
            var _local_5:int = -1;
            if (_arg_3 == null)
            {
                _arg_3 = new LegacyStuffData();
            }
            if (this._Str_2949)
            {
                if (((this._Str_4566 == RoomObjectCategoryEnum.CONST_10) && (this._Str_10248 == k)))
                {
                    return _Str_3109;
                }
                this.reset(false);
                this._Str_10248 = k;
                this._Str_4566 = RoomObjectCategoryEnum.CONST_10;
                this._Str_15323 = "";
                if (this._roomEngine._Str_8303(this._Str_2733, _Str_3109, k, new Vector3d(_Str_7483, _Str_7468, 0), _arg_2, 0, _arg_3, NaN, -1, 0, 0, "", true, false))
                {
                    this._Str_10076 = getTimer();
                    this._Str_11574 = true;
                    _local_5 = _Str_3109;
                    _local_6 = this._roomEngine.getRoomObject(this._Str_2733, _Str_3109, this._Str_4566);
                    if (_local_6)
                    {
                        if (_arg_4 != null)
                        {
                            (_local_6.getModel() as IRoomObjectModelController).setString(RoomObjectVariableEnum.FURNITURE_EXTRAS, _arg_4);
                        }
                    }
                    this._Str_9695();
                }
            }
            return _local_5;
        }

        public function _Str_12087(k:int, _arg_2:IVector3D, _arg_3:String):int
        {
            var _local_4:int = -1;
            if (this._Str_2949)
            {
                if ((((this._Str_4566 == RoomObjectCategoryEnum.CONST_20) && (this._Str_10248 == k)) && (this._Str_15323 == _arg_3)))
                {
                    return _Str_3109;
                }
                this.reset(false);
                this._Str_10248 = k;
                this._Str_4566 = RoomObjectCategoryEnum.CONST_20;
                this._Str_15323 = _arg_3;
                if (this._roomEngine._Str_9493(this._Str_2733, _Str_3109, k, new Vector3d(0.5, 2.3, 1.8), _arg_2, 0, _arg_3, 0, 0, "", -1, false))
                {
                    this._Str_10076 = getTimer();
                    this._Str_11574 = true;
                    return _Str_3109;
                }
            }
            return _local_4;
        }

        public function _Str_18705(k:String, _arg_2:int):int
        {
            if (this._Str_2949)
            {
                this.reset(false);
                this._Str_10248 = 1;
                this._Str_4566 = RoomObjectCategoryEnum.CONST_100;
                this._Str_15323 = k;
                if (this._roomEngine._Str_11865(this._Str_2733, _Str_3109, new Vector3d(_Str_7483, _Str_7468, 0), new Vector3d(90, 0, 0), 135, 1, k))
                {
                    this._Str_10076 = getTimer();
                    this._Str_11574 = true;
                    this._Str_25539(1);
                    this._Str_23945(_arg_2);
                    this._Str_25492("std");
                }
                this._Str_9695();
                return _Str_3109;
            }
            return -1;
        }

        public function _Str_25492(k:String, _arg_2:String=""):void
        {
            if (this._Str_2949)
            {
                this._roomEngine._Str_7176(this._Str_2733, _Str_3109, k, _arg_2);
            }
        }

        public function _Str_25539(k:int):void
        {
            if (this._Str_2949)
            {
                this._roomEngine._Str_9104(this._Str_2733, _Str_3109, k);
            }
        }

        public function _Str_23945(k:int):void
        {
            if (this._Str_2949)
            {
                this._roomEngine._Str_12204(this._Str_2733, _Str_3109, k);
            }
        }

        public function _Str_7543(k:String, _arg_2:String=null, _arg_3:String=null, _arg_4:Boolean=false):Boolean
        {
            if (this._Str_2949)
            {
                return this._roomEngine._Str_7543(this._Str_2733, _Str_3109, k, _arg_2, _arg_3, _arg_4);
            }
            return false;
        }

        public function _Str_3689(k:String, _arg_2:int, _arg_3:String=null):void
        {
            if (this._Str_2949)
            {
                this._roomEngine._Str_3689(this._Str_2733, _Str_3109, k, _arg_2, _arg_3);
            }
        }

        public function _Str_15499():void
        {
            if (this._Str_2949)
            {
                this._Str_11574 = false;
                if (this._Str_4566 != RoomObjectCategoryEnum.CONST_100)
                {
                    this._roomEngine._Str_8640(this._Str_2733, _Str_3109, this._Str_4566);
                }
            }
        }

        private function _Str_25528():void
        {
            var k:int;
            if (this._Str_11574)
            {
                k = getTimer();
                if (k > (this._Str_10076 + _Str_16567))
                {
                    this._Str_10076 = k;
                    if (this._Str_2949)
                    {
                        this._roomEngine._Str_8640(this._Str_2733, _Str_3109, this._Str_4566);
                    }
                }
            }
        }

        public function _Str_3478(k:int, _arg_2:int):DisplayObject
        {
            var _local_3:DisplayObject;
            var _local_4:IRoomGeometry;
            if (this._Str_2949)
            {
                _local_3 = this._roomEngine._Str_14750(this._Str_2733, _Str_3694, k, _arg_2, this._Str_5883);
                this._roomEngine._Str_18414(this._Str_2733, _Str_3694, true);
                _local_4 = this._roomEngine._Str_4267(this._Str_2733, _Str_3694);
                if (_local_4 != null)
                {
                    _local_4.adjustLocation(new Vector3d(_Str_7483, _Str_7468, 0), 30);
                }
                this._Str_8626 = k;
                this._Str_7356 = _arg_2;
                return _local_3;
            }
            return null;
        }

        public function _Str_6976(k:int, _arg_2:int):void
        {
            if (this._Str_2949)
            {
                this._Str_8626 = k;
                this._Str_7356 = _arg_2;
                this._roomEngine._Str_6976(this._Str_2733, _Str_3694, k, _arg_2);
            }
        }

        public function set _Str_16605(k:Point):void
        {
            this._Str_9748 = k;
        }

        public function get _Str_16605():Point
        {
            return this._Str_9748;
        }

        private function _Str_24889(k:Point):void
        {
            var _local_3:Rectangle;
            var _local_2:Rectangle = this._roomEngine.getRoomObjectBoundingRectangle(this._Str_2733, _Str_3109, this._Str_4566, _Str_3694);
            if (((!(_local_2 == null)) && (!(k == null))))
            {
                _local_2.offset(-(this._Str_8626 >> 1), -(this._Str_7356 >> 1));
                _local_2.offset(-(k.x), -(k.y));
                if (this._Str_2705 == null)
                {
                    this._Str_2705 = _local_2;
                }
                else
                {
                    _local_3 = this._Str_2705.union(_local_2);
                    if ((((((_local_3.width - this._Str_2705.width) > ((this._Str_8626 - this._Str_2705.width) >> 1)) || ((_local_3.height - this._Str_2705.height) > ((this._Str_7356 - this._Str_2705.height) >> 1))) || (this._Str_2705.width < 1)) || (this._Str_2705.height < 1)))
                    {
                        this._Str_2705 = _local_3;
                    }
                }
            }
        }

        private function _Str_25083(k:Point):Point
        {
            var _local_2:IRoomGeometry;
            if (((this._Str_2705.width < 1) || (this._Str_2705.height < 1)))
            {
                return k;
            }
            if (this._Str_2949)
            {
                _local_2 = this._roomEngine._Str_4267(this._Str_2733, _Str_3694);
                if (((this._Str_2705.width > (this._Str_8626 * (1 + _Str_8975))) || (this._Str_2705.height > (this._Str_7356 * (1 + _Str_8975)))))
                {
                    if ((this._roomEngine as Component).getBoolean("zoom.enabled"))
                    {
                        if (this._roomEngine._Str_5151(this._Str_2733, _Str_3694) != 0.5)
                        {
                            this._roomEngine._Str_5041(this._Str_2733, _Str_3694, 0.5, null, null, false, false, true);
                            this._Str_5883 = _Str_8753;
                            this._Str_11693 = true;
                            k.x = (k.x >> 1);
                            k.y = (k.y >> 1);
                            this._Str_2705.left = (this._Str_2705.left >> 2);
                            this._Str_2705.right = (this._Str_2705.right >> 2);
                            this._Str_2705.top = (this._Str_2705.top >> 2);
                            this._Str_2705.bottom = (this._Str_2705.bottom >> 2);
                        }
                    }
                    else
                    {
                        if (_local_2.isZoomedIn())
                        {
                            _local_2.performZoomOut();
                            this._Str_5883 = _Str_8753;
                            this._Str_11693 = true;
                            k.x = (k.x >> 1);
                            k.y = (k.y >> 1);
                            this._Str_2705.left = (this._Str_2705.left >> 2);
                            this._Str_2705.right = (this._Str_2705.right >> 2);
                            this._Str_2705.top = (this._Str_2705.top >> 2);
                            this._Str_2705.bottom = (this._Str_2705.bottom >> 2);
                        }
                    }
                }
                else
                {
                    if ((((this._Str_2705.width << 1) < ((this._Str_8626 * (1 + _Str_8975)) - 5)) && ((this._Str_2705.height << 1) < ((this._Str_7356 * (1 + _Str_8975)) - 5))))
                    {
                        if ((this._roomEngine as Component).getBoolean("zoom.enabled"))
                        {
                            if (((!(this._roomEngine._Str_5151(this._Str_2733, _Str_3694) == 1)) && (!(this._Str_11693))))
                            {
                                this._roomEngine._Str_5041(this._Str_2733, _Str_3694, 1, null, null, false, false, true);
                                this._Str_5883 = _Str_6747;
                                k.x = (k.x << 1);
                                k.y = (k.y << 1);
                            }
                        }
                        else
                        {
                            if (((!(_local_2.isZoomedIn())) && (!(this._Str_11693))))
                            {
                                _local_2.performZoomIn();
                                this._Str_5883 = _Str_6747;
                                k.x = (k.x << 1);
                                k.y = (k.y << 1);
                            }
                        }
                    }
                }
            }
            return k;
        }

        public function _Str_24734():void
        {
            var k:IRoomGeometry;
            if (this._Str_2949)
            {
                if ((this._roomEngine as Component).getBoolean("zoom.enabled"))
                {
                    this._roomEngine._Str_5041(this._Str_2733, _Str_3694, 1);
                }
                k = this._roomEngine._Str_4267(this._Str_2733, _Str_3694);
                k.performZoomIn();
            }
            this._Str_5883 = _Str_6747;
        }

        public function _Str_23820():void
        {
            var _local_1:IRoomGeometry;
            if (this._Str_2949)
            {
                if ((this._roomEngine as Component).getBoolean("zoom.enabled"))
                {
                    this._roomEngine._Str_5041(this._Str_2733, _Str_3694, 0.5);
                }
                else
                {
                    _local_1 = this._roomEngine._Str_4267(this._Str_2733, _Str_3694);
                    _local_1.performZoomOut();
                }
            }
            this._Str_5883 = _Str_8753;
        }

        public function _Str_25062(k:int, _arg_2:int):void
        {
            if (this._Str_2949)
            {
                this._roomEngine._Str_11976(this._Str_2733, _Str_3109, new Vector3d(_Str_7483, _Str_7468, 0), new Vector3d(_Str_7483, _Str_7468, 0), false, 0, new Vector3d((k * 45), 0, 0), (_arg_2 * 45));
            }
        }

        public function _Str_4377(k:String=null, _arg_2:String=null, _arg_3:String=null, _arg_4:Boolean=false):Boolean
        {
            if (this._Str_2949)
            {
                return this._roomEngine._Str_4377(this._Str_2733, k, _arg_2, _arg_3, false);
            }
            return false;
        }

        public function _Str_11035(k:Boolean, _arg_2:Boolean=true):void
        {
            if (this._Str_2949)
            {
                this._roomEngine._Str_15359(this._Str_2733, k, _arg_2);
            }
        }

        private function _Str_23683(k:Point):Point
        {
            var _local_7:Number;
            if (((this._Str_2705.width < 1) || (this._Str_2705.height < 1)))
            {
                return k;
            }
            var _local_2:* = (-(this._Str_2705.left + this._Str_2705.right) >> 1);
            var _local_3:* = (-(this._Str_2705.top + this._Str_2705.bottom) >> 1);
            var _local_4:* = ((this._Str_7356 - this._Str_2705.height) >> 1);
            if (_local_4 > 10)
            {
                _local_3 = (_local_3 + Math.min(15, (_local_4 - 10)));
            }
            else
            {
                if (this._Str_4566 != RoomObjectCategoryEnum.CONST_100)
                {
                    _local_3 = (_local_3 + (5 - Math.max(0, (_local_4 / 2))));
                }
                else
                {
                    _local_3 = (_local_3 - (5 - Math.min(0, (_local_4 / 2))));
                }
            }
            _local_3 = (_local_3 + this._Str_9748.y);
            _local_2 = (_local_2 + this._Str_9748.x);
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

        public function _Str_9695(k:Boolean=false):void
        {
            var _local_2:Point;
            var _local_3:int;
            var _local_4:Point;
            if (((this._Str_21090) && (!(k))))
            {
                return;
            }
            this._Str_25528();
            if (this._Str_2949)
            {
                _local_2 = this._roomEngine._Str_7201(this._Str_2733, _Str_3694);
                if (_local_2 != null)
                {
                    this._Str_24889(_local_2);
                    if (this._Str_2705 != null)
                    {
                        _local_3 = this._Str_5883;
                        _local_2 = this._Str_25083(_local_2);
                        _local_4 = this._Str_23683(_local_2);
                        if (_local_4 != null)
                        {
                            this._roomEngine._Str_16921(this._Str_2733, _Str_3694, _local_4);
                        }
                        if (this._Str_5883 != _local_3)
                        {
                            this._Str_2705 = null;
                        }
                    }
                }
            }
        }

        public function set _Str_9081(k:Boolean):void
        {
            this._Str_21090 = k;
        }

        public function set _Str_26005(k:Boolean):void
        {
            if (this._Str_2949)
            {
                this._roomEngine._Str_9081 = k;
            }
        }

        private function _Str_9875(k:RoomEngineEvent):void
        {
            if (k == null)
            {
                return;
            }
            switch (k.type)
            {
                case RoomEngineEvent.INITIALIZED:
                    if (k.roomId == this._Str_2733)
                    {
                        if (this._Str_2949)
                        {
                            this._roomEngine._Str_4377(this._Str_2733, "110", "99999");
                        }
                    }
                    return;
            }
        }

        private function _Str_7011(k:RoomEngineObjectEvent):void
        {
            var _local_2:IRoomObject;
            var _local_3:Number;
            var _local_4:Number;
            if ((((k.roomId == this._Str_2733) && (k._Str_1577 == _Str_3109)) && (k.category == this._Str_4566)))
            {
                this._Str_2705 = null;
                this._Str_11693 = false;
                _local_2 = this._roomEngine.getRoomObject(k.roomId, k._Str_1577, k.category);
                if ((((!(_local_2 == null)) && (!(_local_2.getModel() == null))) && (k.category == RoomObjectCategoryEnum.CONST_20)))
                {
                    _local_3 = _local_2.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Z);
                    _local_4 = _local_2.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_CENTER_Z);
                    if (((!(isNaN(_local_3))) && (!(isNaN(_local_4)))))
                    {
                        this._roomEngine._Str_16158(k.roomId, k._Str_1577, new Vector3d(0.5, 2.3, (((3.6 - _local_3) / 2) + _local_4)));
                    }
                }
            }
        }

        public function _Str_22348():void
        {
            if (this._Str_2949)
            {
                this._roomEngine._Str_19596();
            }
        }

        public function getGenericRoomObjectImage(k:String, _arg_2:String, _arg_3:IVector3D, _arg_4:int, _arg_5:IGetImageListener, _arg_6:uint=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, _arg_10:int=-1, _arg_11:String=null):ImageResult
        {
            if (this._Str_2949)
            {
                return this._roomEngine.getGenericRoomObjectImage(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            }
            return null;
        }

        public function _Str_8562(k:int, _arg_2:IVector3D, _arg_3:int, _arg_4:IGetImageListener, _arg_5:uint=0):ImageResult
        {
            if (this._Str_2949)
            {
                return this._roomEngine._Str_8562(this._Str_2733, _Str_3109, k, _arg_2, _arg_3, _arg_4, _arg_5);
            }
            return null;
        }

        public function _Str_26281():BitmapData
        {
            var k:IRoomObject;
            var _local_2:IRoomObjectVisualization;
            if (this._Str_2949)
            {
                k = this._roomEngine.getRoomObject(this._Str_2733, _Str_3109, RoomObjectCategoryEnum.CONST_100);
                if (k)
                {
                    _local_2 = k._Str_5222();
                    if (_local_2)
                    {
                        return _local_2.getImage(0xFFFFFF, -1);
                    }
                }
            }
            return null;
        }

        public function get _Str_2949():Boolean
        {
            return (!(this._roomEngine == null)) && (this._roomEngine._Str_3022);
        }
    }
}
