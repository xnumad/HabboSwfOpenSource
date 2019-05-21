package com.sulake.habbo.room.object.visualization.room
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.room.object.visualization.IPlaneVisualization;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import flash.geom.Rectangle;
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
    import com.sulake.core.assets.IAsset;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.room.object.enum.AlphaTolerance;
    import com.sulake.room.object.enum.RoomObjectSpriteType;
    import com.sulake.room.utils.IVector3D;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.object.RoomPlaneData;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskData;
    import com.sulake.room.object.visualization.IRoomPlane;
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class RoomVisualization extends RoomObjectSpriteVisualization implements IPlaneVisualization 
    {
        public static const _Str_18544:int = 0xFFFFFF;
        public static const _Str_18640:int = 0xDDDDDD;
        public static const _Str_16664:int = 0xBBBBBB;
        private static const _Str_14503:int = 0xFFFFFF;
        private static const _Str_15851:int = 0xCCCCCC;
        private static const _Str_13715:int = 0x999999;
        private static const _Str_14868:int = 0x999999;
        public static const _Str_17403:int = 0xFFFFFF;
        public static const _Str_16113:int = 0xCCCCCC;
        public static const _Str_18370:int = 0x999999;
        private static const _Str_8621:Number = 1000;

        private const _Str_9654:int = 250;

        protected var _Str_594:RoomVisualizationData = null;
        private var _Str_2430:AssetLibrary = null;
        private var _roomPlaneParser:RoomPlaneParser = null;
        private var _Str_2540:Array;
        private var _Str_8555:Boolean = false;
        private var _Str_4864:Array;
        private var _Str_6648:Array;
        private var _Str_7253:Rectangle = null;
        private var _roomPlaneBitmapMaskParser:RoomPlaneBitmapMaskParser = null;
        private var _Str_4577:String = null;
        private var _Str_4489:String = null;
        private var _Str_4496:String = null;
        private var _Str_4215:Number = NaN;
        private var _Str_4397:Number = NaN;
        private var _Str_19240:Number = NaN;
        private var _Str_16710:String = null;
        private var _Str_4479:uint = 0xFFFFFF;
        private var _Str_20538:int = 0xFF;
        private var _Str_19971:int = 0xFF;
        private var _Str_19611:int = 0xFF;
        private var _Str_17387:Boolean = true;
        private var _Str_5928:int = 0;
        private var _Str_4631:int = -1000;
        private var _Str_3406:int = -1;
        private var _Str_7380:Number = 0;
        private var _Str_10109:Number = 0;
        private var _Str_11932:Number = 0;
        private var _Str_9108:Number = 0;
        private var _Str_4852:Array;

        public function RoomVisualization()
        {
            this._Str_2540 = [];
            this._Str_4864 = [];
            this._Str_6648 = [];
            this._Str_4852 = [];
            super();
            this._Str_2430 = new AssetLibrary("room visualization");
            this._roomPlaneParser = new RoomPlaneParser();
            this._roomPlaneBitmapMaskParser = new RoomPlaneBitmapMaskParser();
            this._Str_4852[RoomPlane._Str_16830] = false;
            this._Str_4852[RoomPlane._Str_3258] = true;
            this._Str_4852[RoomPlane._Str_3587] = true;
            this._Str_4852[RoomPlane._Str_3272] = true;
        }

        public function get _Str_24891():Number
        {
            return _Str_8621 + 0.1;
        }

        public function get _Str_25403():Number
        {
            return _Str_8621 + 0.5;
        }

        public function get _Str_26287():Number
        {
            return _Str_8621 + 0.49;
        }

        public function get _Str_3828():int
        {
            return this._Str_2540.length;
        }

        override public function dispose():void
        {
            var k:int;
            var _local_2:IAsset;
            super.dispose();
            if (this._Str_2430 != null)
            {
                k = 0;
                while (k < this._Str_2430.numAssets)
                {
                    _local_2 = this._Str_2430.getAssetByIndex(k);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._Str_2430.dispose();
                this._Str_2430 = null;
            }
            this._Str_17346();
            this._Str_2540 = null;
            this._Str_4864 = null;
            this._Str_6648 = null;
            if (this._roomPlaneParser != null)
            {
                this._roomPlaneParser.dispose();
                this._roomPlaneParser = null;
            }
            if (this._roomPlaneBitmapMaskParser != null)
            {
                this._roomPlaneBitmapMaskParser.dispose();
                this._roomPlaneBitmapMaskParser = null;
            }
            if (this._Str_594 != null)
            {
                this._Str_594._Str_3355();
                this._Str_594 = null;
            }
        }

        private function _Str_17346():void
        {
            var k:int;
            var _local_2:RoomPlane;
            if (this._Str_2540 != null)
            {
                k = 0;
                while (k < this._Str_2540.length)
                {
                    _local_2 = (this._Str_2540[k] as RoomPlane);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._Str_2540 = [];
            }
            this._Str_8555 = false;
            this._Str_5928 = (this._Str_5928 + 1);
            this.reset();
        }

        override protected function reset():void
        {
            super.reset();
            this._Str_4577 = null;
            this._Str_4489 = null;
            this._Str_4496 = null;
            this._Str_16710 = null;
            this._Str_3406 = -1;
            this._Str_9108 = 0;
        }

        override public function get boundingRectangle():Rectangle
        {
            if (this._Str_7253 == null)
            {
                this._Str_7253 = super.boundingRectangle;
            }
            return new Rectangle(this._Str_7253.x, this._Str_7253.y, this._Str_7253.width, this._Str_7253.height);
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            this.reset();
            if (((k == null) || (!(k is RoomVisualizationData))))
            {
                return false;
            }
            this._Str_594 = (k as RoomVisualizationData);
            this._Str_594._Str_6703(_Str_2697);
            return true;
        }

        protected function _Str_18024():void
        {
            var _local_3:RoomPlane;
            var _local_4:IRoomObjectSprite;
            var k:int = this._Str_2540.length;
            _Str_3773(k);
            var _local_2:int;
            while (_local_2 < k)
            {
                _local_3 = (this._Str_2540[_local_2] as RoomPlane);
                _local_4 = _Str_2505(_local_2);
                if (((((!(_local_4 == null)) && (!(_local_3 == null))) && (!(_local_3._Str_5424 == null))) && (!(_local_3._Str_4968 == null))))
                {
                    if (((_local_3.type == RoomPlane._Str_3587) && ((_local_3._Str_5424.length < 1) || (_local_3._Str_4968.length < 1))))
                    {
                        _local_4._Str_4023 = AlphaTolerance.MATCH_NOTHING;
                    }
                    else
                    {
                        _local_4._Str_4023 = AlphaTolerance.MATCH_OPAQUE_PIXELS;
                    }
                    if (_local_3.type == RoomPlane._Str_3587)
                    {
                        _local_4.tag = ("plane.wall@" + (_local_2 + 1));
                    }
                    else
                    {
                        if (_local_3.type == RoomPlane._Str_3258)
                        {
                            _local_4.tag = ("plane.floor@" + (_local_2 + 1));
                        }
                        else
                        {
                            _local_4.tag = ("plane@" + (_local_2 + 1));
                        }
                    }
                    _local_4._Str_4918 = RoomObjectSpriteType.ROOM_PLANE;
                }
                _local_2++;
            }
        }

        protected function _Str_25732():void
        {
            var _local_8:IVector3D;
            var _local_9:IVector3D;
            var _local_10:IVector3D;
            var _local_11:Array;
            var _local_12:int;
            var _local_13:RoomPlane;
            var _local_14:IVector3D;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:int;
            var _local_20:Number;
            var _local_21:Number;
            var _local_22:Number;
            var _local_23:Number;
            if (this._Str_8555)
            {
                return;
            }
            var k:IRoomObject = object;
            if (k == null)
            {
                return;
            }
            if (!isNaN(this._Str_4215))
            {
                this._roomPlaneParser._Str_9990 = this._Str_4215;
            }
            if (!isNaN(this._Str_4397))
            {
                this._roomPlaneParser._Str_9955 = this._Str_4397;
            }
            var _local_2:String = k.getModel().getString(RoomObjectVariableEnum.ROOM_PLANE_XML);
            if (!this._roomPlaneParser._Str_16659(new XML(_local_2)))
            {
                return;
            }
            var _local_3:Number = this._Str_23949();
            var _local_4:Number = this._Str_23063();
            var _local_5:Number = 0;
            var _local_6:int = k.getModel().getNumber(RoomObjectVariableEnum.ROOM_RANDOM_SEED);
            var _local_7:int;
            while (_local_7 < this._roomPlaneParser._Str_3828)
            {
                _local_8 = this._roomPlaneParser._Str_20362(_local_7);
                _local_9 = this._roomPlaneParser._Str_16904(_local_7);
                _local_10 = this._roomPlaneParser._Str_18119(_local_7);
                _local_11 = this._roomPlaneParser._Str_24698(_local_7);
                _local_12 = this._roomPlaneParser._Str_13037(_local_7);
                _local_13 = null;
                if ((((!(_local_8 == null)) && (!(_local_9 == null))) && (!(_local_10 == null))))
                {
                    _local_14 = Vector3d._Str_7423(_local_9, _local_10);
                    _local_6 = ((_local_6 * 7613) + 517);
                    _local_13 = null;
                    if (_local_12 == RoomPlaneData._Str_6072)
                    {
                        _local_15 = ((_local_8.x + _local_9.x) + 0.5);
                        _local_16 = ((_local_8.y + _local_10.y) + 0.5);
                        _local_17 = (int(_local_15) - _local_15);
                        _local_18 = (int(_local_16) - _local_16);
                        _local_13 = new RoomPlane(k.getLocation(), _local_8, _local_9, _local_10, RoomPlane._Str_3258, true, _local_11, _local_6, -(_local_17), -(_local_18));
                        if (_local_14.z != 0)
                        {
                            _local_13.color = _Str_18544;
                        }
                        else
                        {
                            _local_13.color = ((_local_14.x != 0) ? _Str_16664 : _Str_18640);
                        }
                        if (this._Str_594 != null)
                        {
                            _local_13.rasterizer = this._Str_594._Str_23667;
                        }
                    }
                    else
                    {
                        if (_local_12 == RoomPlaneData._Str_6206)
                        {
                            _local_13 = new RoomPlane(k.getLocation(), _local_8, _local_9, _local_10, RoomPlane._Str_3587, true, _local_11, _local_6);
                            if (((_local_9.length < 1) || (_local_10.length < 1)))
                            {
                                _local_13._Str_18448 = false;
                            }
                            if (((_local_14.x == 0) && (_local_14.y == 0)))
                            {
                                _local_13.color = _Str_14868;
                            }
                            else
                            {
                                if (_local_14.y > 0)
                                {
                                    _local_13.color = _Str_14503;
                                }
                                else
                                {
                                    if (_local_14.y == 0)
                                    {
                                        _local_13.color = _Str_15851;
                                    }
                                    else
                                    {
                                        _local_13.color = _Str_13715;
                                    }
                                }
                            }
                            if (this._Str_594 != null)
                            {
                                _local_13.rasterizer = this._Str_594._Str_25596;
                            }
                        }
                        else
                        {
                            if (_local_12 == RoomPlaneData._Str_7988)
                            {
                                _local_13 = new RoomPlane(k.getLocation(), _local_8, _local_9, _local_10, RoomPlane._Str_3272, true, _local_11, _local_6, _local_5, 0, _local_3, _local_4);
                                if (_local_14.y > 0)
                                {
                                    _local_13.color = _Str_17403;
                                }
                                else
                                {
                                    if (_local_14.y == 0)
                                    {
                                        _local_13.color = _Str_16113;
                                    }
                                    else
                                    {
                                        _local_13.color = _Str_18370;
                                    }
                                }
                                if (this._Str_594 != null)
                                {
                                    _local_13.rasterizer = this._Str_594._Str_24979;
                                }
                                _local_5 = (_local_5 + _local_9.length);
                            }
                            else
                            {
                                if (_local_12 == RoomPlaneData._Str_18788)
                                {
                                    _local_13 = new RoomPlane(k.getLocation(), _local_8, _local_9, _local_10, RoomPlane._Str_3587, true, _local_11, _local_6);
                                    if (((_local_9.length < 1) || (_local_10.length < 1)))
                                    {
                                        _local_13._Str_18448 = false;
                                    }
                                    if (((_local_14.x == 0) && (_local_14.y == 0)))
                                    {
                                        _local_13.color = _Str_14868;
                                    }
                                    else
                                    {
                                        if (_local_14.y > 0)
                                        {
                                            _local_13.color = _Str_14503;
                                        }
                                        else
                                        {
                                            if (_local_14.y == 0)
                                            {
                                                _local_13.color = _Str_15851;
                                            }
                                            else
                                            {
                                                _local_13.color = _Str_13715;
                                            }
                                        }
                                    }
                                    if (this._Str_594 != null)
                                    {
                                        _local_13.rasterizer = this._Str_594._Str_23913;
                                    }
                                }
                            }
                        }
                    }
                    if (_local_13 != null)
                    {
                        _local_13._Str_16279 = this._Str_594._Str_16279;
                        _local_19 = 0;
                        while (_local_19 < this._roomPlaneParser._Str_25447(_local_7))
                        {
                            _local_20 = this._roomPlaneParser._Str_23769(_local_7, _local_19);
                            _local_21 = this._roomPlaneParser._Str_23247(_local_7, _local_19);
                            _local_22 = this._roomPlaneParser._Str_23431(_local_7, _local_19);
                            _local_23 = this._roomPlaneParser._Str_22914(_local_7, _local_19);
                            _local_13._Str_24758(_local_20, _local_21, _local_22, _local_23);
                            _local_19++;
                        }
                        this._Str_2540.push(_local_13);
                    }
                }
                else
                {
                    return;
                }
                _local_7++;
            }
            this._Str_8555 = true;
            this._Str_18024();
        }

        private function _Str_23949():Number
        {
            var _local_3:int;
            var _local_4:IVector3D;
            var k:Number = 0;
            var _local_2:int;
            while (_local_2 < this._roomPlaneParser._Str_3828)
            {
                _local_3 = this._roomPlaneParser._Str_13037(_local_2);
                if (_local_3 == RoomPlaneData._Str_7988)
                {
                    _local_4 = this._roomPlaneParser._Str_16904(_local_2);
                    k = (k + _local_4.length);
                }
                _local_2++;
            }
            return k;
        }

        private function _Str_23063():Number
        {
            var _local_3:int;
            var _local_4:IVector3D;
            var k:Number = 0;
            var _local_2:int;
            while (_local_2 < this._roomPlaneParser._Str_3828)
            {
                _local_3 = this._roomPlaneParser._Str_13037(_local_2);
                if (_local_3 == RoomPlaneData._Str_7988)
                {
                    _local_4 = this._roomPlaneParser._Str_18119(_local_2);
                    if (_local_4.length > k)
                    {
                        k = _local_4.length;
                    }
                }
                _local_2++;
            }
            if (k > 5)
            {
                k = 5;
            }
            return k;
        }

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            var _local_10:int;
            var _local_11:int;
            var _local_12:IRoomObjectSprite;
            var _local_13:RoomPlane;
            var _local_14:uint;
            var _local_15:uint;
            var _local_16:uint;
            var _local_17:uint;
            var _local_18:uint;
            var _local_5:IRoomObject = object;
            if (_local_5 == null)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            var _local_6:Boolean = this._Str_24551(k);
            var _local_7:IRoomObjectModel = _local_5.getModel();
            var _local_8:Boolean;
            if (this._Str_23316(_local_7))
            {
                _local_8 = true;
            }
            if (this._Str_18134(_local_7))
            {
                _local_8 = true;
            }
            this._Str_25732();
            _local_8 = this._Str_25669(_local_7);
            var _local_9:int = _arg_2;
            if ((((_local_9 < (this._Str_4631 + this._Str_9654)) && (!(_local_6))) && (!(_local_8))))
            {
                return;
            }
            if (this._Str_24171(_local_7))
            {
                _local_8 = true;
            }
            if (this._Str_16913(k, _local_6, _arg_2))
            {
                _local_8 = true;
            }
            if (_local_8)
            {
                _local_10 = 0;
                while (_local_10 < this._Str_4864.length)
                {
                    _local_11 = this._Str_6648[_local_10];
                    _local_12 = _Str_2505(_local_11);
                    _local_13 = (this._Str_4864[_local_10] as RoomPlane);
                    if ((((!(_local_12 == null)) && (!(_local_13 == null))) && (!(_local_13.type == RoomPlane._Str_3272))))
                    {
                        if (this._Str_17387)
                        {
                            _local_14 = _local_13.color;
                            _local_15 = (((_local_14 & 0xFF) * this._Str_19611) / 0xFF);
                            _local_16 = ((((_local_14 >> 8) & 0xFF) * this._Str_19971) / 0xFF);
                            _local_17 = ((((_local_14 >> 16) & 0xFF) * this._Str_20538) / 0xFF);
                            _local_18 = (_local_14 >> 24);
                            _local_14 = ((((_local_18 << 24) + (_local_17 << 16)) + (_local_16 << 8)) + _local_15);
                            _local_12.color = _local_14;
                        }
                        else
                        {
                            _local_12.color = _local_13.color;
                        }
                    }
                    _local_10++;
                }
                _Str_6936();
            }
            _Str_3603 = _local_7._Str_3273();
            this._Str_4631 = _local_9;
        }

        private function _Str_24551(k:IRoomGeometry):Boolean
        {
            var _local_3:IVector3D;
            var _local_2:Boolean;
            if (k.updateId != this._Str_3406)
            {
                this._Str_3406 = k.updateId;
                this._Str_7253 = null;
                _local_3 = k.direction;
                if (((!(_local_3 == null)) && ((((!(_local_3.x == this._Str_7380)) || (!(_local_3.y == this._Str_10109))) || (!(_local_3.z == this._Str_11932))) || (!(k.scale == this._Str_9108)))))
                {
                    this._Str_7380 = _local_3.x;
                    this._Str_10109 = _local_3.y;
                    this._Str_11932 = _local_3.z;
                    this._Str_9108 = k.scale;
                    _local_2 = true;
                }
            }
            return _local_2;
        }

        private function _Str_25669(k:IRoomObjectModel):Boolean
        {
            var _local_3:String;
            var _local_4:uint;
            var _local_5:Boolean;
            var _local_2:Boolean;
            if (_Str_3603 != k._Str_3273())
            {
                _local_3 = k.getString(RoomObjectVariableEnum.ROOM_PLANE_MASK_XML);
                if (_local_3 != this._Str_16710)
                {
                    this._Str_15935(_local_3);
                    this._Str_16710 = _local_3;
                    _local_2 = true;
                }
                _local_4 = k.getNumber(RoomObjectVariableEnum.ROOM_BACKGROUND_COLOR);
                if (_local_4 != this._Str_4479)
                {
                    this._Str_4479 = _local_4;
                    this._Str_19611 = (this._Str_4479 & 0xFF);
                    this._Str_19971 = ((this._Str_4479 >> 8) & 0xFF);
                    this._Str_20538 = ((this._Str_4479 >> 16) & 0xFF);
                    _local_2 = true;
                }
                _local_5 = Boolean(k.getNumber(RoomObjectVariableEnum.ROOM_COLORIZE_BG_ONLY));
                if (_local_5 != this._Str_17387)
                {
                    this._Str_17387 = _local_5;
                    _local_2 = true;
                }
            }
            return _local_2;
        }

        private function _Str_24171(k:IRoomObjectModel):Boolean
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:String;
            var _local_5:Boolean;
            var _local_6:Boolean;
            var _local_7:Boolean;
            if (_Str_3603 != k._Str_3273())
            {
                _local_2 = k.getString(RoomObjectVariableEnum.ROOM_WALL_TYPE);
                _local_3 = k.getString(RoomObjectVariableEnum.ROOM_FLOOR_TYPE);
                _local_4 = k.getString(RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE);
                this._Str_25341(_local_3, _local_2, _local_4);
                _local_5 = Boolean(k.getNumber(RoomObjectVariableEnum.ROOM_FLOOR_VISIBILITY));
                _local_6 = Boolean(k.getNumber(RoomObjectVariableEnum.ROOM_WALL_VISIBILITY));
                _local_7 = Boolean(k.getNumber(RoomObjectVariableEnum.ROOM_LANDSCAPE_VISIBILITY));
                this._Str_23076(_local_5, _local_6, _local_7);
                return true;
            }
            return false;
        }

        private function _Str_23316(k:IRoomObjectModel):Boolean
        {
            var _local_2:Number;
            var _local_3:Number;
            if (_Str_3603 != k._Str_3273())
            {
                _local_2 = k.getNumber(RoomObjectVariableEnum.ROOM_FLOOR_THICKNESS);
                _local_3 = k.getNumber(RoomObjectVariableEnum.ROOM_WALL_THICKNESS);
                if ((((!(isNaN(_local_2))) && (!(isNaN(_local_3)))) && ((!(_local_2 == this._Str_4215)) || (!(_local_3 == this._Str_4397)))))
                {
                    this._Str_4215 = _local_2;
                    this._Str_4397 = _local_3;
                    this._Str_17346();
                    return true;
                }
            }
            return false;
        }

        private function _Str_18134(k:IRoomObjectModel):Boolean
        {
            var _local_2:Number;
            if (_Str_3603 != k._Str_3273())
            {
                _local_2 = k.getNumber(RoomObjectVariableEnum.ROOM_FLOOR_HOLE_UPDATE_TIME);
                if (((!(isNaN(_local_2))) && (!(_local_2 == this._Str_19240))))
                {
                    this._Str_19240 = _local_2;
                    this._Str_17346();
                    return true;
                }
            }
            return false;
        }

        protected function _Str_25341(k:String, _arg_2:String, _arg_3:String):Boolean
        {
            var _local_5:RoomPlane;
            if (k != this._Str_4489)
            {
                this._Str_4489 = k;
            }
            else
            {
                k = null;
            }
            if (_arg_2 != this._Str_4577)
            {
                this._Str_4577 = _arg_2;
            }
            else
            {
                _arg_2 = null;
            }
            if (_arg_3 != this._Str_4496)
            {
                this._Str_4496 = _arg_3;
            }
            else
            {
                _arg_3 = null;
            }
            if ((((k == null) && (_arg_2 == null)) && (_arg_3 == null)))
            {
                return false;
            }
            var _local_4:int;
            while (_local_4 < this._Str_2540.length)
            {
                _local_5 = (this._Str_2540[_local_4] as RoomPlane);
                if (_local_5 != null)
                {
                    if (((_local_5.type == RoomPlane._Str_3258) && (!(k == null))))
                    {
                        _local_5.id = k;
                    }
                    else
                    {
                        if (((_local_5.type == RoomPlane._Str_3587) && (!(_arg_2 == null))))
                        {
                            _local_5.id = _arg_2;
                        }
                        else
                        {
                            if (((_local_5.type == RoomPlane._Str_3272) && (!(_arg_3 == null))))
                            {
                                _local_5.id = _arg_3;
                            }
                        }
                    }
                }
                _local_4++;
            }
            return true;
        }

        private function _Str_23076(k:Boolean, _arg_2:Boolean, _arg_3:Boolean):void
        {
            if ((((!(k == this._Str_4852[RoomPlane._Str_3258])) || (!(_arg_2 == this._Str_4852[RoomPlane._Str_3587]))) || (!(_arg_3 == this._Str_4852[RoomPlane._Str_3272]))))
            {
                this._Str_4852[RoomPlane._Str_3258] = k;
                this._Str_4852[RoomPlane._Str_3587] = _arg_2;
                this._Str_4852[RoomPlane._Str_3272] = _arg_3;
                this._Str_4864 = [];
                this._Str_6648 = [];
            }
        }

        protected function _Str_16913(k:IRoomGeometry, _arg_2:Boolean, _arg_3:int):Boolean
        {
            var _local_10:int;
            var _local_11:IRoomObjectSprite;
            var _local_12:RoomPlane;
            var _local_13:Number;
            var _local_14:String;
            var _local_4:IRoomObject = object;
            if (_local_4 == null)
            {
                return false;
            }
            if (k == null)
            {
                return false;
            }
            this._Str_5928++;
            if (_arg_2)
            {
                this._Str_4864 = [];
                this._Str_6648 = [];
            }
            var _local_5:int = _arg_3;
            var _local_6:Array = this._Str_4864;
            if (this._Str_4864.length == 0)
            {
                _local_6 = this._Str_2540;
            }
            var _local_7:Boolean;
            var _local_8:* = (this._Str_4864.length > 0);
            var _local_9:int;
            while (_local_9 < _local_6.length)
            {
                _local_10 = _local_9;
                if (_local_8)
                {
                    _local_10 = this._Str_6648[_local_9];
                }
                _local_11 = _Str_2505(_local_10);
                if (_local_11 != null)
                {
                    _local_12 = (_local_6[_local_9] as RoomPlane);
                    if (_local_12 != null)
                    {
                        _local_11._Str_9396 = _local_12.uniqueId;
                        if (_local_12.update(k, _local_5))
                        {
                            if (_local_12.visible)
                            {
                                _local_13 = ((_local_12.relativeDepth + this._Str_24891) + (Number(_local_10) / 1000));
                                if (_local_12.type != RoomPlane._Str_3258)
                                {
                                    _local_13 = ((_local_12.relativeDepth + this._Str_25403) + (Number(_local_10) / 1000));
                                    if (((_local_12._Str_5424.length < 1) || (_local_12._Str_4968.length < 1)))
                                    {
                                        _local_13 = (_local_13 + (_Str_8621 * 0.5));
                                    }
                                }
                                _local_14 = ((("plane " + _local_10) + " ") + k.scale);
                                this._Str_7421(_local_11, _local_12, _local_14, _local_13);
                            }
                            _local_7 = true;
                        }
                        if (_local_11.visible != ((_local_12.visible) && (this._Str_4852[_local_12.type])))
                        {
                            _local_11.visible = (!(_local_11.visible));
                            _local_7 = true;
                        }
                        if (_local_11.visible)
                        {
                            if (!_local_8)
                            {
                                this._Str_4864.push(_local_12);
                                this._Str_6648.push(_local_9);
                            }
                        }
                    }
                    else
                    {
                        _local_11._Str_9396 = 0;
                        if (_local_11.visible)
                        {
                            _local_11.visible = false;
                            _local_7 = true;
                        }
                    }
                }
                _local_9++;
            }
            return _local_7;
        }

        private function _Str_7421(k:IRoomObjectSprite, _arg_2:RoomPlane, _arg_3:String, _arg_4:Number):void
        {
            var _local_5:Point = _arg_2.offset;
            k.offsetX = -(_local_5.x);
            k.offsetY = -(_local_5.y);
            k.relativeDepth = _arg_4;
            k.color = _arg_2.color;
            k.asset = this._Str_22446(_arg_2, _arg_3);
            k.assetName = ((_arg_3 + "_") + this._Str_5928);
        }

        private function _Str_22446(k:RoomPlane, _arg_2:String):BitmapData
        {
            var _local_3:BitmapDataAsset = (this._Str_2430.getAssetByName(_arg_2) as BitmapDataAsset);
            if (_local_3 == null)
            {
                _local_3 = new BitmapDataAsset(this._Str_2430.getAssetTypeDeclarationByClass(BitmapDataAsset));
                this._Str_2430.setAsset(_arg_2, _local_3);
            }
            var _local_4:BitmapData = (_local_3.content as BitmapData);
            var _local_5:BitmapData = k._Str_24896(_local_4);
            if (_local_5 == null)
            {
                _local_5 = k.bitmapData;
                if (_local_5 != null)
                {
                    if (_local_4 != _local_5)
                    {
                        if (_local_4 != null)
                        {
                            _local_4.dispose();
                        }
                        _local_3.setUnknownContent(_local_5);
                    }
                }
            }
            return _local_5;
        }

        protected function _Str_15935(k:String):void
        {
            var _local_10:String;
            var _local_11:IVector3D;
            var _local_12:String;
            var _local_13:int;
            var _local_14:IVector3D;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:int;
            if (k == null)
            {
                return;
            }
            var _local_2:XML = XML(k);
            this._roomPlaneBitmapMaskParser.initialize(_local_2);
            var _local_3:RoomPlane;
            var _local_4:Array = [];
            var _local_5:Array = [];
            var _local_6:Boolean;
            var _local_7:int;
            while (_local_7 < this._Str_2540.length)
            {
                _local_3 = (this._Str_2540[_local_7] as RoomPlane);
                if (_local_3 != null)
                {
                    _local_3._Str_25213();
                    if (_local_3.type == RoomPlane._Str_3272)
                    {
                        _local_4.push(_local_7);
                    }
                }
                _local_7++;
            }
            var _local_8:int;
            while (_local_8 < this._roomPlaneBitmapMaskParser._Str_6845)
            {
                _local_10 = this._roomPlaneBitmapMaskParser._Str_21678(_local_8);
                _local_11 = this._roomPlaneBitmapMaskParser._Str_19038(_local_8);
                _local_12 = this._roomPlaneBitmapMaskParser._Str_21644(_local_8);
                if (_local_11 != null)
                {
                    _local_13 = 0;
                    while (_local_13 < this._Str_2540.length)
                    {
                        _local_3 = (this._Str_2540[_local_13] as RoomPlane);
                        if (((_local_3.type == RoomPlane._Str_3587) || (_local_3.type == RoomPlane._Str_3272)))
                        {
                            if ((((!(_local_3 == null)) && (!(_local_3.location == null))) && (!(_local_3.normal == null))))
                            {
                                _local_14 = Vector3d._Str_5385(_local_11, _local_3.location);
                                _local_15 = Math.abs(Vector3d._Str_4733(_local_14, _local_3.normal));
                                if (_local_15 < 0.01)
                                {
                                    if (((!(_local_3._Str_5424 == null)) && (!(_local_3._Str_4968 == null))))
                                    {
                                        _local_16 = Vector3d._Str_4733(_local_14, _local_3._Str_5424);
                                        _local_17 = Vector3d._Str_4733(_local_14, _local_3._Str_4968);
                                        if (((_local_3.type == RoomPlane._Str_3587) || ((_local_3.type == RoomPlane._Str_3272) && (_local_12 == RoomPlaneBitmapMaskData.HOLE))))
                                        {
                                            _local_3._Str_24569(_local_10, _local_16, _local_17);
                                        }
                                        else
                                        {
                                            if (_local_3.type == RoomPlane._Str_3272)
                                            {
                                                if (!_local_3._Str_14801)
                                                {
                                                    _local_6 = true;
                                                }
                                                _local_3._Str_14801 = true;
                                                _local_5.push(_local_13);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        _local_13++;
                    }
                }
                _local_8++;
            }
            var _local_9:int;
            while (_local_9 < _local_4.length)
            {
                _local_18 = _local_4[_local_9];
                if (_local_5.indexOf(_local_18) < 0)
                {
                    _local_3 = (this._Str_2540[_local_18] as RoomPlane);
                    _local_3._Str_14801 = false;
                    _local_6 = true;
                }
                _local_9++;
            }
            if (_local_6)
            {
                this._Str_4864 = [];
                this._Str_6648 = [];
            }
        }

        public function get _Str_19113():Vector.<IRoomPlane>
        {
            var _local_2:RoomPlane;
            var k:Vector.<IRoomPlane> = new Vector.<IRoomPlane>(0);
            for each (_local_2 in this._Str_4864)
            {
                k.push(_local_2);
            }
            return k;
        }
    }
}
