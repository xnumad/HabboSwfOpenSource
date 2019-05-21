package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.display.BitmapData;
    import com.sulake.room.object.enum.AlphaTolerance;
    import flash.display.BlendMode;
    import com.sulake.habbo.room.object.visualization.data.LayerData;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.object.visualization.data.ColorData;

    public class FurnitureVisualization extends RoomObjectSpriteVisualization 
    {
        protected static const _Str_19020:Number = Math.sqrt(0.5);

        private var _Str_2405:int;
        private var _Str_20921:Number = NaN;
        private var _Str_20708:int = -1;
        protected var _Str_1240:Number = 1;
        private var _Str_3944:String = null;
        private var _Str_6190:Boolean = false;
        private var _Str_594:FurnitureVisualizationData = null;
        private var _Str_578:String = "";
        private var _assetNames:Array;
        private var _Str_9557:Array;
        private var _Str_19776:Number = 0;
        private var _Str_19019:int = -1;
        private var _Str_19680:int = -1;
        private var _Str_6997:Array;
        private var _Str_7886:Array;
        private var _Str_8100:Array;
        private var _Str_7644:Array;
        private var _Str_8079:Array;
        private var _Str_7588:Array;
        private var _Str_7703:Array;
        private var _Str_7624:Array;
        protected var _Str_11460:Boolean = true;
        protected var _Str_3416:int = 0;
        protected var _Str_13574:int = -1;
        private var _Str_15707:int = 0;
        private var _Str_20044:Number = 0;

        public function FurnitureVisualization()
        {
            this._assetNames = [];
            this._Str_9557 = [];
            this._Str_6997 = [];
            this._Str_7886 = [];
            this._Str_8100 = [];
            this._Str_7644 = [];
            this._Str_8079 = [];
            this._Str_7588 = [];
            this._Str_7703 = [];
            this._Str_7624 = [];
            super();
            this.reset();
        }

        protected function set direction(k:int):void
        {
            this._Str_2405 = k;
        }

        protected function get direction():int
        {
            return this._Str_2405;
        }

        protected function get type():String
        {
            return this._Str_578;
        }

        override public function dispose():void
        {
            super.dispose();
            this._Str_594 = null;
            this._assetNames = null;
            this._Str_9557 = null;
            this._Str_6997 = null;
            this._Str_7886 = null;
            this._Str_8100 = null;
            this._Str_7644 = null;
            this._Str_8079 = null;
            this._Str_7588 = null;
            this._Str_7703 = null;
            this._Str_7624 = null;
        }

        override protected function reset():void
        {
            super.reset();
            this.direction = -1;
            this._Str_594 = null;
            this._assetNames = [];
            this._Str_9557 = [];
            this._Str_6997 = [];
            this._Str_7886 = [];
            this._Str_8100 = [];
            this._Str_7644 = [];
            this._Str_8079 = [];
            this._Str_7588 = [];
            this._Str_7703 = [];
            this._Str_7624 = [];
            this._Str_3773(0);
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            this.reset();
            if (((k == null) || (!(k is FurnitureVisualizationData))))
            {
                return false;
            }
            this._Str_594 = (k as FurnitureVisualizationData);
            this._Str_578 = this._Str_594.getType();
            return true;
        }

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            if (k == null)
            {
                return;
            }
            var _local_5:Boolean;
            var _local_6:Number = k.scale;
            if (this.updateObject(_local_6, k.direction.x))
            {
                _local_5 = true;
            }
            if (this.updateModel(_local_6))
            {
                _local_5 = true;
            }
            var _local_7:int;
            if (_arg_4)
            {
                this._Str_15707 = (this._Str_15707 | this.updateAnimation(_local_6));
            }
            else
            {
                _local_7 = (this.updateAnimation(_local_6) | this._Str_15707);
                this._Str_15707 = 0;
            }
            if (((_local_5) || (!(_local_7 == 0))))
            {
                this.updateSprites(_local_6, _local_5, _local_7);
                _Str_3289 = _local_6;
                _Str_6936();
            }
        }

        protected function updateSprites(k:int, _arg_2:Boolean, _arg_3:int):void
        {
            var _local_4:int;
            var _local_5:int;
            if (this._Str_3416 != _Str_3008)
            {
                _Str_3773(this._Str_3416);
            }
            if (_arg_2)
            {
                _local_4 = (_Str_3008 - 1);
                while (_local_4 >= 0)
                {
                    this._Str_7421(k, _local_4);
                    _local_4--;
                }
            }
            else
            {
                _local_5 = 0;
                while (_arg_3 > 0)
                {
                    if ((_arg_3 & 0x01))
                    {
                        this._Str_7421(k, _local_5);
                    }
                    _local_5++;
                    _arg_3 = (_arg_3 >> 1);
                }
            }
            this._Str_11460 = false;
        }

        protected function _Str_7421(k:int, _arg_2:int):void
        {
            var _local_5:IGraphicAsset;
            var _local_6:Number;
            var _local_7:int;
            var _local_3:String = this.getSpriteAssetName(k, _arg_2);
            var _local_4:IRoomObjectSprite = _Str_2505(_arg_2);
            if (((!(_local_4 == null)) && (!(_local_3 == null))))
            {
                _local_5 = this.getAsset(_local_3, _arg_2);
                if (((!(_local_5 == null)) && (!(_local_5.asset == null))))
                {
                    _local_4.visible = true;
                    _local_4._Str_1723 = this._Str_578;
                    _local_4.asset = (_local_5.asset.content as BitmapData);
                    if (_local_5.asset.content == null)
                    {
                        _Str_3603++;
                    }
                    _local_4.flipH = _local_5.flipH;
                    _local_4.flipV = _local_5.flipV;
                    _local_4.direction = this._Str_2405;
                    _local_6 = 0;
                    if (_arg_2 != this._Str_13574)
                    {
                        _local_4.tag = this.getSpriteTag(k, this._Str_2405, _arg_2);
                        _local_4.alpha = this.getSpriteAlpha(k, this._Str_2405, _arg_2);
                        _local_4.color = this.getSpriteColor(k, _arg_2, this._Str_20708);
                        _local_4.offsetX = (_local_5.offsetX + this.getSpriteXOffset(k, this._Str_2405, _arg_2));
                        _local_4.offsetY = (_local_5.offsetY + this.getSpriteYOffset(k, this._Str_2405, _arg_2));
                        _local_4._Str_4023 = ((this.getSpriteMouseCapture(k, this._Str_2405, _arg_2)) ? AlphaTolerance.MATCH_OPAQUE_PIXELS : AlphaTolerance.MATCH_NOTHING);
                        _local_4.blendMode = this._Str_24151(this.getSpriteInk(k, this._Str_2405, _arg_2));
                        _local_6 = this.getSpriteZOffset(k, this._Str_2405, _arg_2);
                        _local_6 = (_local_6 - (_arg_2 * 0.001));
                    }
                    else
                    {
                        _local_4.offsetX = _local_5.offsetX;
                        _local_4.offsetY = (_local_5.offsetY + this.getSpriteYOffset(k, this._Str_2405, _arg_2));
                        _local_7 = 48;
                        _local_7 = (_local_7 * this._Str_1240);
                        _local_4.alpha = _local_7;
                        _local_4._Str_4023 = AlphaTolerance.MATCH_NOTHING;
                        _local_6 = 1;
                    }
                    _local_6 = (_local_6 * _Str_19020);
                    _local_4.relativeDepth = _local_6;
                    _local_4.assetName = _local_5.assetName;
                    _local_4._Str_3582 = this.getLibraryAssetNameForSprite(_local_5, _local_4);
                    _local_4._Str_8401 = this.getPostureForAssetFile(k, _local_5._Str_3582);
                    _local_4._Str_4530 = this._Str_6190;
                }
                else
                {
                    this._Str_21294(_local_4);
                }
            }
            else
            {
                if (_local_4 != null)
                {
                    this._Str_21294(_local_4);
                }
            }
        }

        protected function getLibraryAssetNameForSprite(k:IGraphicAsset, _arg_2:IRoomObjectSprite):String
        {
            return k._Str_3582;
        }

        private function _Str_21294(k:IRoomObjectSprite):void
        {
            k.asset = null;
            k.assetName = "";
            k._Str_8401 = null;
            k.tag = "";
            k.flipH = false;
            k.flipV = false;
            k.offsetX = 0;
            k.offsetY = 0;
            k.relativeDepth = 0;
            k._Str_4530 = false;
        }

        protected function _Str_24151(k:int):String
        {
            var _local_2:String = BlendMode.NORMAL;
            switch (k)
            {
                case LayerData._Str_7943:
                    break;
                case LayerData._Str_15822:
                    _local_2 = BlendMode.ADD;
                    break;
                case LayerData._Str_12864:
                    _local_2 = BlendMode.DARKEN;
                    break;
                case LayerData._Str_12715:
                    _local_2 = BlendMode.SUBTRACT;
                    break;
            }
            return _local_2;
        }

        protected function updateObject(k:Number, _arg_2:Number):Boolean
        {
            var _local_4:Number;
            var _local_5:int;
            var _local_3:IRoomObject = object;
            if (_local_3 == null)
            {
                return false;
            }
            if ((((!(_Str_7475 == _local_3._Str_3273())) || (!(k == _Str_3289))) || (!(_arg_2 == this._Str_20921))))
            {
                _local_4 = (_local_3.getDirection().x - (_arg_2 + 135));
                _local_4 = (((_local_4 % 360) + 360) % 360);
                if (this._Str_594 != null)
                {
                    _local_5 = this._Str_594._Str_15687(k, _local_4);
                    this.direction = _local_5;
                }
                _Str_7475 = _local_3._Str_3273();
                this._Str_20921 = _arg_2;
                _Str_3289 = k;
                this._Str_24917(k, this._Str_2405);
                return true;
            }
            return false;
        }

        protected function updateModel(k:Number):Boolean
        {
            var _local_4:Number;
            var _local_2:IRoomObject = object;
            if (_local_2 == null)
            {
                return false;
            }
            var _local_3:IRoomObjectModel = _local_2.getModel();
            if (_local_3 == null)
            {
                return false;
            }
            if (_Str_3603 != _local_3._Str_3273())
            {
                this._Str_20708 = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_COLOR);
                _local_4 = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_ALPHA_MULTIPLIER);
                if (isNaN(_local_4))
                {
                    _local_4 = 1;
                }
                if (_local_4 != this._Str_1240)
                {
                    this._Str_1240 = _local_4;
                    this._Str_11460 = true;
                }
                this._Str_3944 = this.getAdClickUrl(_local_3);
                this._Str_6190 = (((!(this._Str_3944 == null)) && (!(this._Str_3944 == ""))) && (this._Str_3944.indexOf("http") == 0));
                this._Str_20044 = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_LIFT_AMOUNT);
                _Str_3603 = _local_3._Str_3273();
                return true;
            }
            return false;
        }

        protected function getAdClickUrl(k:IRoomObjectModel):String
        {
            return k.getString(RoomObjectVariableEnum.FURNITURE_AD_URL);
        }

        protected function updateAnimation(k:Number):int
        {
            return 0;
        }

        private function _Str_24917(k:Number, _arg_2:int):void
        {
            if (((!(this._Str_19680 == _arg_2)) || (!(this._Str_19776 == k))))
            {
                this._assetNames = [];
                this._Str_9557 = [];
                this._Str_6997 = [];
                this._Str_7886 = [];
                this._Str_8100 = [];
                this._Str_7644 = [];
                this._Str_8079 = [];
                this._Str_7588 = [];
                this._Str_7703 = [];
                this._Str_7624 = [];
                this._Str_19680 = _arg_2;
                this._Str_19776 = k;
                this._Str_19019 = this._Str_3033(k);
                this.updateLayerCount((this._Str_594.getLayerCount(k) + this.getAdditionalSpriteCount()));
            }
        }

        protected function updateLayerCount(k:int):void
        {
            this._Str_3416 = k;
            this._Str_13574 = (this._Str_3416 - this.getAdditionalSpriteCount());
        }

        protected function getAdditionalSpriteCount():int
        {
            return 1;
        }

        protected function getFrameNumber(k:int, _arg_2:int):int
        {
            return 0;
        }

        protected function getPostureForAssetFile(k:int, _arg_2:String):String
        {
            return null;
        }

        protected function getAsset(k:String, _arg_2:int=-1):IGraphicAsset
        {
            var _local_3:IGraphicAsset;
            if (_Str_2697 != null)
            {
                _local_3 = _Str_2697.getAsset(k);
                return _local_3;
            }
            return null;
        }

        protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            if (((this._Str_594 == null) || (_arg_2 >= FurnitureVisualizationData._Str_8875.length)))
            {
                return "";
            }
            var _local_3:String = this._assetNames[_arg_2];
            var _local_4:Boolean = this._Str_9557[_arg_2];
            if (((_local_3 == null) || (_local_3.length == 0)))
            {
                _local_3 = this._Str_18363(k, _arg_2, true);
                _local_4 = (!(this._Str_19019 == 1));
            }
            if (_local_4)
            {
                _local_3 = (_local_3 + this.getFrameNumber(k, _arg_2));
            }
            return _local_3;
        }

        protected function _Str_18363(k:int, _arg_2:int, _arg_3:Boolean):String
        {
            var _local_4:String = this._Str_578;
            var _local_5:String = "";
            var _local_6:int = ((_arg_3) ? this._Str_19019 : this._Str_3033(k));
            var _local_7:* = (!(_local_6 == 1));
            if (_arg_2 != this._Str_13574)
            {
                _local_5 = FurnitureVisualizationData._Str_8875[_arg_2];
            }
            else
            {
                _local_5 = "sd";
            }
            _local_4 = (_local_4 + ((_local_7) ? (((((("_" + _local_6) + "_") + _local_5) + "_") + this._Str_2405) + "_") : ("_icon_" + _local_5)));
            if (_arg_3)
            {
                this._assetNames[_arg_2] = _local_4;
                this._Str_9557[_arg_2] = _local_7;
            }
            return _local_4;
        }

        protected function getSpriteTag(k:int, _arg_2:int, _arg_3:int):String
        {
            if (this._Str_6997[_arg_3] != null)
            {
                return this._Str_6997[_arg_3];
            }
            if (this._Str_594 == null)
            {
                return "";
            }
            var _local_4:String = this._Str_594._Str_6014(k, _arg_2, _arg_3);
            this._Str_6997[_arg_3] = _local_4;
            return _local_4;
        }

        protected function getSpriteAlpha(k:int, _arg_2:int, _arg_3:int):int
        {
            if (((!(this._Str_7886[_arg_3] == null)) && (!(this._Str_11460))))
            {
                return this._Str_7886[_arg_3];
            }
            if (this._Str_594 == null)
            {
                return LayerData._Str_8655;
            }
            var _local_4:int = this._Str_594._Str_11350(k, _arg_2, _arg_3);
            _local_4 = (_local_4 * this._Str_1240);
            this._Str_7886[_arg_3] = _local_4;
            return _local_4;
        }

        protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int
        {
            if (this._Str_8100[_arg_2] != null)
            {
                return this._Str_8100[_arg_2];
            }
            if (this._Str_594 == null)
            {
                return ColorData._Str_2531;
            }
            var _local_4:int = this._Str_594._Str_751(k, _arg_2, _arg_3);
            this._Str_8100[_arg_2] = _local_4;
            return _local_4;
        }

        protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            if (this._Str_7644[_arg_3] != null)
            {
                return this._Str_7644[_arg_3];
            }
            if (this._Str_594 == null)
            {
                return LayerData._Str_9326;
            }
            var _local_4:int = this._Str_594._Str_10372(k, _arg_2, _arg_3);
            this._Str_7644[_arg_3] = _local_4;
            return _local_4;
        }

        protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:int;
            if (_arg_3 != this._Str_13574)
            {
                if (this._Str_8079[_arg_3] != null)
                {
                    return this._Str_8079[_arg_3];
                }
                if (this._Str_594 != null)
                {
                    _local_4 = this._Str_594._Str_10926(k, _arg_2, _arg_3);
                    this._Str_8079[_arg_3] = _local_4;
                    return _local_4;
                }
                return LayerData._Str_9412;
            }
            return Math.ceil((this._Str_20044 * (k / 2)));
        }

        protected function getSpriteMouseCapture(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            if (this._Str_7703[_arg_3] != null)
            {
                return this._Str_7703[_arg_3];
            }
            if (this._Str_594 == null)
            {
                return true;
            }
            var _local_4:* = (!(this._Str_594._Str_12280(k, _arg_2, _arg_3)));
            this._Str_7703[_arg_3] = _local_4;
            return _local_4;
        }

        protected function getSpriteInk(k:int, _arg_2:int, _arg_3:int):int
        {
            if (this._Str_7624[_arg_3] != null)
            {
                return this._Str_7624[_arg_3];
            }
            if (this._Str_594 == null)
            {
                return LayerData._Str_7943;
            }
            var _local_4:int = this._Str_594._Str_10682(k, _arg_2, _arg_3);
            this._Str_7624[_arg_3] = _local_4;
            return _local_4;
        }

        protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number
        {
            if (this._Str_7588[_arg_3] != null)
            {
                return this._Str_7588[_arg_3];
            }
            if (this._Str_594 == null)
            {
                return LayerData._Str_7951;
            }
            var _local_4:Number = this._Str_594._Str_8329(k, _arg_2, _arg_3);
            this._Str_7588[_arg_3] = _local_4;
            return _local_4;
        }

        protected function _Str_3033(k:int):int
        {
            if (this._Str_594 != null)
            {
                return this._Str_594._Str_3033(k);
            }
            return k;
        }

        protected function get data():FurnitureVisualizationData
        {
            return this._Str_594;
        }
    }
}
