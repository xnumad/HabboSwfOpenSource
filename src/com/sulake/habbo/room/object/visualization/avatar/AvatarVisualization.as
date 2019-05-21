package com.sulake.habbo.room.object.visualization.avatar
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.avatar._Str_936;
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.room.object.visualization.avatar.additions.IAvatarAddition;
    import com.sulake.room.data.RoomObjectSpriteData;
    import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
    import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
    import com.sulake.habbo.avatar.animation.IAnimationLayerData;
    import flash.geom.Rectangle;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.object.visualization.avatar.additions.FloatingIdleZ;
    import com.sulake.habbo.room.object.visualization.avatar.additions.MutedBubble;
    import com.sulake.habbo.room.object.visualization.avatar.additions.TypingBubble;
    import com.sulake.habbo.avatar.enum.AvatarGuideStatus;
    import com.sulake.habbo.room.object.visualization.avatar.additions.GuideStatusBubble;
    import com.sulake.habbo.room.object.visualization.avatar.additions.GameClickTarget;
    import com.sulake.habbo.room.object.visualization.avatar.additions.NumberBubble;
    import com.sulake.habbo.room.object.visualization.avatar.additions.ExpressionAdditionFactory;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import flash.filters.BitmapFilter;
    import flash.filters.GlowFilter;
    import flash.geom.Point;
    import com.sulake.room.object.enum.RoomObjectSpriteType;
    import com.sulake.room.object.enum.AlphaTolerance;
    import flash.display.BlendMode;
    import com.sulake.habbo.avatar.enum.AvatarAction;

    public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener, _Str_936 
    {
        private static const AVATAR:String = "avatar";
        private static const _Str_11358:Number = -0.01;
        private static const _Str_17708:Number = 0.001;
        private static const _Str_9235:Number = -0.409;
        private static const _Str_12370:int = 1000;
        private static const _Str_14491:int = 2;
        private static const _Str_18338:Array = [0, 0, 0];
        private static const _Str_17502:int = 97;
        private static const _Str_18169:int = 3;
        private static const _Str_9540:int = 0;
        private static const _Str_14111:int = 1;
        private static const _Str_11587:int = 2;
        private static const _Str_12269:int = 1;
        private static const _Str_7651:int = 2;
        private static const _Str_10546:int = 3;
        private static const _Str_10054:int = 4;
        private static const _Str_11164:int = 5;
        private static const _Str_10168:int = 6;
        private static const _Str_8837:int = 7;

        private const _Str_9654:int = 41;

        private var _Str_4631:int = -1000;
        private var _Str_8256:AvatarVisualizationData = null;
        private var _Str_6736:Map;
        private var _Str_5861:Map;
        private var _Str_14276:int = 0;
        private var _Str_1222:Boolean;
        private var _Str_1710:String;
        private var _Str_625:String;
        private var _Str_12697:int = 0;
        private var _Str_6428:BitmapDataAsset;
        private var _Str_16644:int = -1;
        private var _angle:int = -1;
        private var _Str_16172:int = -1;
        private var _Str_16697:int = 2;
        private var _Str_3663:Map;
        private var _Str_3406:int = -1;
        private var _posture:String = "";
        private var _Str_13611:String = "";
        private var _Str_18190:Boolean = false;
        private var _Str_6061:Boolean = false;
        private var _Str_13515:Boolean = false;
        private var _Str_5043:int = 0;
        private var _Str_3760:int = 0;
        private var _Str_4384:int = 0;
        private var _Str_21309:int = 0;
        private var _Str_17713:Boolean = false;
        private var _Str_7434:int = -1;
        private var _Str_5192:int = 0;
        private var _Str_7562:int = 0;
        private var _Str_6928:int = 0;
        private var _Str_13130:int = 0;
        private var _Str_7508:int = 0;
        private var _Str_6643:Boolean = false;
        private var _Str_8935:Boolean = false;
        private var _Str_17860:Boolean = false;
        private var _Str_2842:IAvatarImage = null;
        private var _Str_16138:Boolean = false;
        private var _disposed:Boolean;

        public function AvatarVisualization()
        {
            this._Str_6736 = new Map();
            this._Str_5861 = new Map();
            this._Str_1222 = false;
        }

        override public function dispose():void
        {
            var k:IAvatarAddition;
            if (this._Str_6736 != null)
            {
                this._Str_15248();
                this._Str_6736.dispose();
                this._Str_5861.dispose();
                this._Str_6736 = null;
            }
            this._Str_8256 = null;
            this._Str_6428 = null;
            if (this._Str_3663)
            {
                for each (k in this._Str_3663)
                {
                    k.dispose();
                }
                this._Str_3663 = null;
            }
            super.dispose();
            this._disposed = true;
        }

        override public function getSpriteList():Array
        {
            var _local_2:RoomObjectSpriteData;
            var _local_4:ISpriteDataContainer;
            var _local_5:IAvatarDataContainer;
            var _local_6:RoomObjectSpriteData;
            var _local_7:IAnimationLayerData;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:String;
            var _local_16:BitmapDataAsset;
            var _local_17:Rectangle;
            var _local_18:String;
            var _local_19:RoomObjectSpriteData;
            if (this._Str_2842 == null)
            {
                return null;
            }
            var k:IRoomObjectSprite = _Str_2505(_Str_14111);
            if (k)
            {
                _local_2 = new RoomObjectSpriteData();
                _local_2.alpha = k.alpha;
                _local_2.x = k.offsetX;
                _local_2.y = k.offsetY;
                _local_2.name = k.assetName;
                _local_2.width = k.width;
                _local_2.height = k.height;
            }
            var _local_3:Array = this._Str_2842._Str_1009();
            for each (_local_4 in this._Str_2842._Str_754())
            {
                _local_6 = new RoomObjectSpriteData();
                _local_7 = this._Str_2842._Str_607(_local_4);
                _local_8 = 0;
                _local_9 = this._Str_2842.getDirection();
                _local_10 = _local_4._Str_809(_local_9);
                _local_11 = _local_4._Str_739(_local_9);
                _local_12 = _local_4._Str_839(_local_9);
                _local_13 = 0;
                if (_local_4._Str_949)
                {
                    _local_13 = _local_9;
                }
                if (_local_7 != null)
                {
                    _local_8 = _local_7._Str_891;
                    _local_10 = (_local_10 + _local_7.dx);
                    _local_11 = (_local_11 + _local_7.dy);
                    _local_13 = (_local_13 + _local_7.dd);
                }
                _local_14 = 64;
                if (_local_14 < 48)
                {
                    _local_10 = (_local_10 / 2);
                    _local_11 = (_local_11 / 2);
                }
                if (_local_13 < 0)
                {
                    _local_13 = (_local_13 + 8);
                }
                else
                {
                    if (_local_13 > 7)
                    {
                        _local_13 = (_local_13 - 8);
                    }
                }
                _local_15 = ((((((this._Str_2842._Str_797() + "_") + _local_4.member) + "_") + _local_13) + "_") + _local_8);
                _local_16 = this._Str_2842.getAsset(_local_15);
                if (_local_16 != null)
                {
                    _local_6.x = ((-(_local_16.offset.x) - (_local_14 / 2)) + _local_10);
                    _local_6.y = (-(_local_16.offset.y) + _local_11);
                    if (_local_4._Str_767)
                    {
                        _local_6.y = (_local_6.y + ((this._Str_7508 * _local_14) / (2 * _Str_12370)));
                    }
                    if (_local_4.ink == 33)
                    {
                        _local_6.blendMode = "add";
                    }
                    _local_6.name = _local_15;
                    if (this._Str_8935)
                    {
                        _local_6.z = (_Str_9235 - ((0.001 * _Str_3008) * _local_12));
                    }
                    else
                    {
                        _local_6.z = ((-0.001 * _Str_3008) * _local_12);
                    }
                    _local_17 = _local_16.rectangle;
                    if (_local_17 == null)
                    {
                        _local_6.width = 60;
                        _local_6.height = 60;
                    }
                    else
                    {
                        _local_6.width = _local_17.width;
                        _local_6.height = _local_17.height;
                    }
                    _local_3.push(_local_6);
                }
            }
            _local_5 = this._Str_2842._Str_920;
            if (((!(_local_5 == null)) && (_local_5._Str_832)))
            {
                _local_18 = _local_5.reds[0].toString();
                for each (_local_19 in _local_3)
                {
                    if (((_local_19.name.indexOf("h_std_fx") == -1) && (_local_19.name.indexOf("h_std_sd") == -1)))
                    {
                        _local_19.color = _local_18;
                    }
                }
            }
            if (_local_2)
            {
                _local_3.push(_local_2);
            }
            return _local_3;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get angle():int
        {
            return this._angle;
        }

        public function get posture():String
        {
            return this._posture;
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            this._Str_8256 = (k as AvatarVisualizationData);
            _Str_3773(_Str_11587);
            return true;
        }

        private function updateModel(k:IRoomObjectModel, _arg_2:Number, _arg_3:Boolean):Boolean
        {
            var _local_4:Boolean;
            var _local_5:Boolean;
            var _local_6:int;
            var _local_7:String;
            var _local_8:IAvatarAddition;
            var _local_9:String;
            if (k._Str_3273() != _Str_3603)
            {
                _local_4 = false;
                _local_5 = false;
                _local_6 = 0;
                _local_7 = "";
                _local_5 = ((k.getNumber(RoomObjectVariableEnum.FIGURE_TALK) > 0) && (_arg_3));
                if (_local_5 != this._Str_18190)
                {
                    this._Str_18190 = _local_5;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_EXPRESSION);
                if (_local_6 != this._Str_5043)
                {
                    this._Str_5043 = _local_6;
                    _local_4 = true;
                }
                _local_5 = (k.getNumber(RoomObjectVariableEnum.FIGURE_SLEEP) > 0);
                if (_local_5 != this._Str_6061)
                {
                    this._Str_6061 = _local_5;
                    _local_4 = true;
                }
                _local_5 = ((k.getNumber(RoomObjectVariableEnum.FIGURE_BLINK) > 0) && (_arg_3));
                if (_local_5 != this._Str_13515)
                {
                    this._Str_13515 = _local_5;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_GESTURE);
                if (_local_6 != this._Str_3760)
                {
                    this._Str_3760 = _local_6;
                    _local_4 = true;
                }
                _local_7 = k.getString(RoomObjectVariableEnum.FIGURE_POSTURE);
                if (_local_7 != this._posture)
                {
                    this._posture = _local_7;
                    _local_4 = true;
                }
                _local_7 = k.getString(RoomObjectVariableEnum.FIGURE_POSTURE_PARAMETER);
                if (_local_7 != this._Str_13611)
                {
                    this._Str_13611 = _local_7;
                    _local_4 = true;
                }
                _local_5 = (k.getNumber(RoomObjectVariableEnum.FIGURE_CAN_STAND_UP) > 0);
                if (_local_5 != this._Str_6643)
                {
                    this._Str_6643 = _local_5;
                    _local_4 = true;
                }
                _local_6 = (k.getNumber(RoomObjectVariableEnum.FIGURE_VERTICAL_OFFSET) * _Str_12370);
                if (_local_6 != this._Str_7508)
                {
                    this._Str_7508 = _local_6;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_DANCE);
                if (_local_6 != this._Str_4384)
                {
                    this._Str_4384 = _local_6;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_EFFECT);
                if (_local_6 != this._Str_5192)
                {
                    this._Str_5192 = _local_6;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT);
                if (_local_6 != this._Str_7562)
                {
                    this._Str_7562 = _local_6;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_USE_OBJECT);
                if (_local_6 != this._Str_6928)
                {
                    this._Str_6928 = _local_6;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.HEAD_DIRECTION);
                if (_local_6 != this._Str_16644)
                {
                    this._Str_16644 = _local_6;
                    _local_4 = true;
                }
                if (((this._Str_7562 > 0) && (k.getNumber(RoomObjectVariableEnum.FIGURE_USE_OBJECT) > 0)))
                {
                    if (this._Str_6928 != this._Str_7562)
                    {
                        this._Str_6928 = this._Str_7562;
                        _local_4 = true;
                    }
                }
                else
                {
                    if (this._Str_6928 != 0)
                    {
                        this._Str_6928 = 0;
                        _local_4 = true;
                    }
                }
                _local_8 = (this._Str_6142(_Str_12269) as FloatingIdleZ);
                if (this._Str_6061)
                {
                    if (!_local_8)
                    {
                        _local_8 = this._Str_8211(new FloatingIdleZ(_Str_12269, this));
                    }
                    _local_4 = true;
                }
                else
                {
                    if (_local_8)
                    {
                        this._Str_5801(_Str_12269);
                    }
                }
                _local_5 = (k.getNumber(RoomObjectVariableEnum.FIGURE_IS_MUTED) > 0);
                _local_8 = (this._Str_6142(_Str_10168) as MutedBubble);
                if (_local_5)
                {
                    if (!_local_8)
                    {
                        _local_8 = this._Str_8211(new MutedBubble(_Str_10168, this));
                    }
                    this._Str_5801(_Str_7651);
                    _local_4 = true;
                }
                else
                {
                    if (_local_8)
                    {
                        this._Str_5801(_Str_10168);
                        _local_4 = true;
                    }
                    _local_5 = (k.getNumber(RoomObjectVariableEnum.FIGURE_IS_TYPING) > 0);
                    _local_8 = (this._Str_6142(_Str_7651) as TypingBubble);
                    if (_local_5)
                    {
                        if (!_local_8)
                        {
                            _local_8 = this._Str_8211(new TypingBubble(_Str_7651, this));
                        }
                        _local_4 = true;
                    }
                    else
                    {
                        if (_local_8)
                        {
                            this._Str_5801(_Str_7651);
                        }
                    }
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_GUIDE_STATUS);
                if (_local_6 != AvatarGuideStatus.NONE)
                {
                    this._Str_5801(_Str_8837);
                    this._Str_8211(new GuideStatusBubble(_Str_8837, this, _local_6));
                    _local_4 = true;
                }
                else
                {
                    if ((this._Str_6142(_Str_8837) as GuideStatusBubble) != null)
                    {
                        this._Str_5801(_Str_8837);
                        _local_4 = true;
                    }
                }
                _local_5 = (k.getNumber(RoomObjectVariableEnum.FIGURE_IS_PLAYING_GAME) > 0);
                _local_8 = (this._Str_6142(_Str_11164) as GameClickTarget);
                if (_local_5)
                {
                    if (!_local_8)
                    {
                        _local_8 = this._Str_8211(new GameClickTarget(_Str_11164));
                    }
                    _local_4 = true;
                }
                else
                {
                    if (_local_8)
                    {
                        this._Str_5801(_Str_11164);
                    }
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_NUMBER_VALUE);
                _local_8 = (this._Str_6142(_Str_10054) as NumberBubble);
                if (_local_6 > 0)
                {
                    if (!_local_8)
                    {
                        _local_8 = this._Str_8211(new NumberBubble(_Str_10054, _local_6, this));
                    }
                    _local_4 = true;
                }
                else
                {
                    if (_local_8)
                    {
                        this._Str_5801(_Str_10054);
                    }
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_EXPRESSION);
                _local_8 = this._Str_6142(_Str_10546);
                if (_local_6 > 0)
                {
                    if (!_local_8)
                    {
                        _local_8 = ExpressionAdditionFactory._Str_24515(_Str_10546, _local_6, this);
                        if (_local_8)
                        {
                            this._Str_8211(_local_8);
                        }
                    }
                }
                else
                {
                    if (_local_8)
                    {
                        this._Str_5801(_Str_10546);
                    }
                }
                this._Str_14314(_arg_2);
                _local_7 = k.getString(RoomObjectVariableEnum.GENDER);
                if (_local_7 != this._Str_625)
                {
                    this._Str_625 = _local_7;
                    _local_4 = true;
                }
                _local_9 = k.getString(RoomObjectVariableEnum.FIGURE);
                if (this.updateFigure(_local_9))
                {
                    _local_4 = true;
                }
                if (k.hasNumber(RoomObjectVariableEnum.FIGURE_SIGN))
                {
                    _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_SIGN);
                    if (_local_6 != this._Str_7434)
                    {
                        _local_4 = true;
                        this._Str_7434 = _local_6;
                    }
                }
                _local_5 = (k.getNumber(RoomObjectVariableEnum.FIGURE_HIGHLIGHT_ENABLE) > 0);
                if (_local_5 != this._Str_17713)
                {
                    this._Str_17713 = _local_5;
                    _local_4 = true;
                }
                if (this._Str_17713)
                {
                    _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_HIGHLIGHT);
                    if (_local_6 != this._Str_21309)
                    {
                        this._Str_21309 = _local_6;
                        _local_4 = true;
                    }
                }
                _local_5 = (k.getNumber(RoomObjectVariableEnum.OWN_USER) > 0);
                if (_local_5 != this._Str_16138)
                {
                    this._Str_16138 = _local_5;
                    _local_4 = true;
                }
                _Str_3603 = k._Str_3273();
                return _local_4;
            }
            return false;
        }

        private function updateFigure(k:String):Boolean
        {
            if (this._Str_1710 != k)
            {
                this._Str_1710 = k;
                this._Str_15248();
                return true;
            }
            return false;
        }

        private function _Str_15248():void
        {
            var k:IAvatarImage;
            var _local_2:IRoomObjectSprite;
            for each (k in this._Str_6736)
            {
                if (k)
                {
                    k.dispose();
                }
            }
            for each (k in this._Str_5861)
            {
                if (k)
                {
                    k.dispose();
                }
            }
            this._Str_6736.reset();
            this._Str_5861.reset();
            this._Str_2842 = null;
            _local_2 = _Str_2505(_Str_9540);
            if (_local_2 != null)
            {
                _local_2.asset = null;
                _local_2.alpha = 0xFF;
            }
        }

        private function _Str_14314(k:Number):void
        {
            var _local_2:int;
            if (k < 48)
            {
                this._Str_13515 = false;
            }
            if (((this._posture == "sit") || (this._posture == "lay")))
            {
                this._Str_13130 = (k / 2);
            }
            else
            {
                this._Str_13130 = 0;
            }
            this._Str_17860 = false;
            this._Str_8935 = false;
            if (this._posture == "lay")
            {
                this._Str_8935 = true;
                _local_2 = int(this._Str_13611);
                if (_local_2 < 0)
                {
                    this._Str_17860 = true;
                }
            }
        }

        private function _Str_23124(k:Number, _arg_2:int):IAvatarImage
        {
            var _local_3:IAvatarImage;
            var _local_5:IAvatarImage;
            var _local_4:String = ("avatarImage" + k.toString());
            if (_arg_2 == 0)
            {
                _local_3 = (this._Str_6736.getValue(_local_4) as IAvatarImage);
            }
            else
            {
                _local_4 = (_local_4 + ("-" + _arg_2));
                _local_3 = (this._Str_5861.getValue(_local_4) as IAvatarImage);
                if (_local_3)
                {
                    _local_3._Str_998();
                }
            }
            if (_local_3 == null)
            {
                _local_3 = this._Str_8256._Str_8991(this._Str_1710, k, this._Str_625, this, this);
                if (_local_3 != null)
                {
                    if (_arg_2 == 0)
                    {
                        this._Str_6736.add(_local_4, _local_3);
                    }
                    else
                    {
                        if (this._Str_5861.length >= _Str_18169)
                        {
                            _local_5 = this._Str_5861.remove(this._Str_5861.getKey(0));
                            if (_local_5)
                            {
                                _local_5.dispose();
                            }
                        }
                        this._Str_5861.add(_local_4, _local_3);
                    }
                }
            }
            return _local_3;
        }

        public function getAvatarRendererAsset(k:String):IAsset
        {
            return (this._Str_8256) ? this._Str_8256.getAvatarRendererAsset(k) : null;
        }

        private function updateObject(k:IRoomObject, _arg_2:IRoomGeometry, _arg_3:Boolean, _arg_4:Boolean=false):Boolean
        {
            var _local_5:Boolean;
            var _local_6:int;
            var _local_7:int;
            if ((((_arg_4) || (!(_Str_7475 == k._Str_3273()))) || (!(this._Str_3406 == _arg_2.updateId))))
            {
                _local_5 = _arg_3;
                _local_6 = (k.getDirection().x - _arg_2.direction.x);
                _local_6 = (((_local_6 % 360) + 360) % 360);
                if (((this._posture == "sit") && (this._Str_6643)))
                {
                    _local_6 = (_local_6 - ((_local_6 % 90) - 45));
                }
                _local_7 = this._Str_16644;
                if (this._posture == "float")
                {
                    _local_7 = _local_6;
                }
                else
                {
                    _local_7 = (_local_7 - _arg_2.direction.x);
                }
                _local_7 = (((_local_7 % 360) + 360) % 360);
                if (((this._posture == "sit") && (this._Str_6643)))
                {
                    _local_7 = (_local_7 - ((_local_7 % 90) - 45));
                }
                if (((!(_local_6 == this._angle)) || (_arg_4)))
                {
                    _local_5 = true;
                    this._angle = _local_6;
                    _local_6 = (_local_6 - (135 - 22.5));
                    _local_6 = ((_local_6 + 360) % 360);
                    this._Str_2842._Str_880(AvatarSetType.FULL, _local_6);
                }
                if (((!(_local_7 == this._Str_16172)) || (_arg_4)))
                {
                    _local_5 = true;
                    this._Str_16172 = _local_7;
                    if (this._Str_16172 != this._angle)
                    {
                        _local_7 = (_local_7 - (135 - 22.5));
                        _local_7 = ((_local_7 + 360) % 360);
                        this._Str_2842._Str_880(AvatarSetType.HEAD, _local_7);
                    }
                }
                _Str_7475 = k._Str_3273();
                this._Str_3406 = _arg_2.updateId;
                return _local_5;
            }
            return false;
        }

        private function _Str_23519(k:Number):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:IRoomObjectSprite = _Str_2505(_Str_14111);
            this._Str_6428 = null;
            var _local_3:Boolean = (((this._posture == "mv") || (this._posture == "std")) || ((this._posture == "sit") && (this._Str_6643)));
            if (this._Str_5192 == _Str_17502)
            {
                _local_3 = false;
            }
            if (_local_3)
            {
                _local_2.visible = true;
                if (((this._Str_6428 == null) || (!(k == _Str_3289))))
                {
                    _local_4 = 0;
                    _local_5 = 0;
                    if (k < 48)
                    {
                        _local_2._Str_3582 = "sh_std_sd_1_0_0";
                        this._Str_6428 = this._Str_2842.getAsset(_local_2._Str_3582);
                        _local_4 = -8;
                        _local_5 = ((this._Str_6643) ? 6 : -3);
                    }
                    else
                    {
                        _local_2._Str_3582 = "h_std_sd_1_0_0";
                        this._Str_6428 = this._Str_2842.getAsset(_local_2._Str_3582);
                        _local_4 = -17;
                        _local_5 = ((this._Str_6643) ? 10 : -7);
                    }
                    if (this._Str_6428 != null)
                    {
                        _local_2.asset = (this._Str_6428.content as BitmapData);
                        _local_2.offsetX = _local_4;
                        _local_2.offsetY = _local_5;
                        _local_2.alpha = 50;
                        _local_2.relativeDepth = 1;
                    }
                    else
                    {
                        _local_2.visible = false;
                    }
                }
            }
            else
            {
                this._Str_6428 = null;
                _local_2.visible = false;
            }
        }

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            var _local_14:int;
            var _local_17:IRoomObjectSprite;
            var _local_18:IAvatarAddition;
            var _local_19:IRoomObjectSprite;
            var _local_20:Array;
            var _local_21:int;
            var _local_22:int;
            var _local_23:ISpriteDataContainer;
            var _local_24:Boolean;
            var _local_25:BitmapData;
            var _local_26:BitmapFilter;
            var _local_27:IAnimationLayerData;
            var _local_28:int;
            var _local_29:int;
            var _local_30:IAnimationLayerData;
            var _local_31:int;
            var _local_32:int;
            var _local_33:int;
            var _local_34:int;
            var _local_35:int;
            var _local_36:String;
            var _local_37:BitmapDataAsset;
            var _local_5:IRoomObject = object;
            if (_local_5 == null)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            if (this._Str_8256 == null)
            {
                return;
            }
            if (_arg_2 < (this._Str_4631 + this._Str_9654))
            {
                return;
            }
            this._Str_4631 = (this._Str_4631 + this._Str_9654);
            if ((this._Str_4631 + this._Str_9654) < _arg_2)
            {
                this._Str_4631 = (_arg_2 - this._Str_9654);
            }
            var _local_6:IRoomObjectModel = _local_5.getModel();
            var _local_7:Number = k.scale;
            var _local_8:Boolean;
            var _local_9:Boolean;
            var _local_10:Boolean;
            var _local_11:int = this._Str_5192;
            var _local_12:Boolean;
            var _local_13:Boolean = this.updateModel(_local_6, _local_7, _arg_3);
            if ((((_local_13) || (!(_local_7 == _Str_3289))) || (this._Str_2842 == null)))
            {
                if (_local_7 != _Str_3289)
                {
                    _local_9 = true;
                    this._Str_14314(_local_7);
                }
                if (_local_11 != this._Str_5192)
                {
                    _local_12 = true;
                }
                if ((((_local_9) || (this._Str_2842 == null)) || (_local_12)))
                {
                    this._Str_2842 = this._Str_23124(_local_7, this._Str_5192);
                    if (this._Str_2842 == null)
                    {
                        return;
                    }
                    _local_8 = true;
                    _local_17 = _Str_2505(_Str_9540);
                    if ((((_local_17) && (this._Str_2842)) && (this._Str_2842.isPlaceholder())))
                    {
                        _local_17.alpha = 150;
                    }
                    else
                    {
                        if (_local_17)
                        {
                            _local_17.alpha = 0xFF;
                        }
                    }
                }
                if (this._Str_2842 == null)
                {
                    return;
                }
                if (((_local_12) && (this._Str_2842._Str_677)))
                {
                    this._Str_2842._Str_833();
                }
                this._Str_23519(_local_7);
                _local_10 = this.updateObject(_local_5, k, _arg_3, true);
                this._Str_1620(this._Str_2842);
                if (this._Str_3663)
                {
                    _local_14 = this._Str_16697;
                    for each (_local_18 in this._Str_3663)
                    {
                        _local_18.update(_Str_2505(_local_14++), _local_7);
                    }
                }
                _Str_3289 = _local_7;
            }
            else
            {
                _local_10 = this.updateObject(_local_5, k, _arg_3);
            }
            if (this._Str_3663)
            {
                _local_14 = this._Str_16697;
                for each (_local_18 in this._Str_3663)
                {
                    if (_local_18.animate(_Str_2505(_local_14++)))
                    {
                        _Str_6936();
                    }
                }
            }
            var _local_15:Boolean = (((_local_10) || (_local_13)) || (_local_9));
            var _local_16:Boolean = (((this._Str_1222) || (this._Str_12697 > 0)) && (_arg_3));
            if (_local_15)
            {
                this._Str_12697 = _Str_14491;
            }
            if (((_local_15) || (_local_16)))
            {
                _Str_6936();
                this._Str_12697--;
                this._Str_14276--;
                if (((((this._Str_14276 <= 0) || (_local_9)) || (_local_13)) || (_local_8)))
                {
                    this._Str_2842._Str_953(1);
                    this._Str_14276 = _Str_14491;
                }
                else
                {
                    return;
                }
                _local_20 = this._Str_2842._Str_781();
                if (((_local_20 == null) || (_local_20.length < 3)))
                {
                    _local_20 = _Str_18338;
                }
                _local_19 = _Str_2505(_Str_9540);
                if (_local_19 != null)
                {
                    _local_24 = ((_local_6.getNumber(RoomObjectVariableEnum.FIGURE_HIGHLIGHT_ENABLE) == 1) && (_local_6.getNumber(RoomObjectVariableEnum.FIGURE_HIGHLIGHT) == 1));
                    _local_25 = this._Str_2842.getImage(AvatarSetType.FULL, _local_24);
                    if (_local_25 != null)
                    {
                        if (_local_24)
                        {
                            _local_26 = new GlowFilter(0xFFFFFF, 1, 6, 6);
                            _local_25.applyFilter(_local_25, _local_25.rect, new Point(0, 0), _local_26);
                        }
                        _local_19.asset = _local_25;
                    }
                    if (_local_19.asset)
                    {
                        _local_19.offsetX = ((((-1 * _local_7) / 2) + _local_20[0]) - ((_local_19.asset.width - _local_7) / 2));
                        _local_19.offsetY = (((-(_local_19.asset.height) + (_local_7 / 4)) + _local_20[1]) + this._Str_13130);
                    }
                    if (this._Str_8935)
                    {
                        if (this._Str_17860)
                        {
                            _local_19.relativeDepth = -0.5;
                        }
                        else
                        {
                            _local_19.relativeDepth = (_Str_9235 + _local_20[2]);
                        }
                    }
                    else
                    {
                        _local_19.relativeDepth = (_Str_11358 + _local_20[2]);
                    }
                    if (this._Str_16138)
                    {
                        _local_19.relativeDepth = (_local_19.relativeDepth - _Str_17708);
                        _local_19._Str_4918 = RoomObjectSpriteType.AVATAR_OWN;
                    }
                    else
                    {
                        _local_19._Str_4918 = RoomObjectSpriteType.AVATAR;
                    }
                }
                _local_18 = (this._Str_6142(_Str_7651) as TypingBubble);
                if (_local_18)
                {
                    if (!this._Str_8935)
                    {
                        TypingBubble(_local_18).relativeDepth = ((_Str_11358 - 0.01) + _local_20[2]);
                    }
                    else
                    {
                        TypingBubble(_local_18).relativeDepth = ((_Str_9235 - 0.01) + _local_20[2]);
                    }
                }
                this._Str_1222 = this._Str_2842._Str_899();
                _local_21 = _Str_11587;
                _local_22 = this._Str_2842.getDirection();
                for each (_local_23 in this._Str_2842._Str_754())
                {
                    if (_local_23.id == AVATAR)
                    {
                        _local_19 = _Str_2505(_Str_9540);
                        _local_27 = this._Str_2842._Str_607(_local_23);
                        _local_28 = _local_23._Str_809(_local_22);
                        _local_29 = _local_23._Str_739(_local_22);
                        if (_local_27 != null)
                        {
                            _local_28 = (_local_28 + _local_27.dx);
                            _local_29 = (_local_29 + _local_27.dy);
                        }
                        if (_local_7 < 48)
                        {
                            _local_28 = (_local_28 / 2);
                            _local_29 = (_local_29 / 2);
                        }
                        if (!this._Str_6643)
                        {
                            _local_19.offsetX = (_local_19.offsetX + _local_28);
                            _local_19.offsetY = (_local_19.offsetY + _local_29);
                        }
                    }
                    else
                    {
                        _local_19 = _Str_2505(_local_21);
                        if (_local_19 != null)
                        {
                            _local_19._Str_4023 = AlphaTolerance.MATCH_NOTHING;
                            _local_19.visible = true;
                            _local_30 = this._Str_2842._Str_607(_local_23);
                            _local_31 = 0;
                            _local_32 = _local_23._Str_809(_local_22);
                            _local_33 = _local_23._Str_739(_local_22);
                            _local_34 = _local_23._Str_839(_local_22);
                            _local_35 = 0;
                            if (_local_23._Str_949)
                            {
                                _local_35 = _local_22;
                            }
                            if (_local_30 != null)
                            {
                                _local_31 = _local_30._Str_891;
                                _local_32 = (_local_32 + _local_30.dx);
                                _local_33 = (_local_33 + _local_30.dy);
                                _local_35 = (_local_35 + _local_30.dd);
                            }
                            if (_local_7 < 48)
                            {
                                _local_32 = (_local_32 / 2);
                                _local_33 = (_local_33 / 2);
                            }
                            if (_local_35 < 0)
                            {
                                _local_35 = (_local_35 + 8);
                            }
                            else
                            {
                                if (_local_35 > 7)
                                {
                                    _local_35 = (_local_35 - 8);
                                }
                            }
                            _local_36 = ((((((this._Str_2842._Str_797() + "_") + _local_23.member) + "_") + _local_35) + "_") + _local_31);
                            _local_37 = this._Str_2842.getAsset(_local_36);
                            if (_local_37 == null) continue;
                            _local_19.asset = (_local_37.content as BitmapData);
                            _local_19.offsetX = ((-(_local_37.offset.x) - (_local_7 / 2)) + _local_32);
                            _local_19.offsetY = (-(_local_37.offset.y) + _local_33);
                            if (_local_23._Str_767)
                            {
                                _local_19.offsetY = (_local_19.offsetY + ((this._Str_7508 * _local_7) / (2 * _Str_12370)));
                            }
                            else
                            {
                                _local_19.offsetY = (_local_19.offsetY + this._Str_13130);
                            }
                            if (this._Str_8935)
                            {
                                _local_19.relativeDepth = (_Str_9235 - ((0.001 * _Str_3008) * _local_34));
                            }
                            else
                            {
                                _local_19.relativeDepth = (_Str_11358 - ((0.001 * _Str_3008) * _local_34));
                            }
                            if (_local_23.ink == 33)
                            {
                                _local_19.blendMode = BlendMode.ADD;
                            }
                            else
                            {
                                _local_19.blendMode = BlendMode.NORMAL;
                            }
                        }
                        _local_21++;
                    }
                }
            }
        }

        private function _Str_1620(k:IAvatarImage):void
        {
            var _local_3:ISpriteDataContainer;
            var _local_4:String;
            var _local_5:IAvatarAddition;
            var _local_6:IRoomObjectSprite;
            if (k == null)
            {
                return;
            }
            k._Str_913();
            k.appendAction(AvatarAction.POSTURE, this._posture, this._Str_13611);
            if (this._Str_3760 > 0)
            {
                k.appendAction(AvatarAction.GESTURE, AvatarAction.getGesture(this._Str_3760));
            }
            if (this._Str_4384 > 0)
            {
                k.appendAction(AvatarAction.DANCE, this._Str_4384);
            }
            if (this._Str_7434 > -1)
            {
                k.appendAction(AvatarAction.SIGN, this._Str_7434);
            }
            if (this._Str_7562 > 0)
            {
                k.appendAction(AvatarAction.CARRY_OBJECT, this._Str_7562);
            }
            if (this._Str_6928 > 0)
            {
                k.appendAction(AvatarAction.USE_OBJECT, this._Str_6928);
            }
            if (this._Str_18190)
            {
                k.appendAction(AvatarAction.TALK);
            }
            if (((this._Str_6061) || (this._Str_13515)))
            {
                k.appendAction(AvatarAction.SLEEP);
            }
            if (this._Str_5043 > 0)
            {
                _local_4 = AvatarAction.getExpression(this._Str_5043);
                if (_local_4 != "")
                {
                    switch (_local_4)
                    {
                        case AvatarAction.DANCE:
                            k.appendAction(AvatarAction.DANCE, 2);
                            break;
                        default:
                            k.appendAction(_local_4);
                    }
                }
            }
            if (this._Str_5192 > 0)
            {
                k.appendAction(AvatarAction.EFFECT, this._Str_5192);
            }
            k._Str_962();
            this._Str_1222 = k._Str_899();
            var _local_2:int = _Str_11587;
            for each (_local_3 in this._Str_2842._Str_754())
            {
                if (_local_3.id != AVATAR)
                {
                    _local_2++;
                }
            }
            if (_local_2 != _Str_3008)
            {
                _Str_3773(_local_2);
            }
            this._Str_16697 = _local_2;
            if (this._Str_3663)
            {
                for each (_local_5 in this._Str_3663)
                {
                    _local_6 = _Str_12937();
                }
            }
        }

        public function _Str_840(k:String):void
        {
            this._Str_15248();
        }

        public function _Str_869(k:int):void
        {
            this._Str_15248();
        }

        protected function get _Str_26131():int
        {
            return (this._Str_3663) ? this._Str_3663.length : 0;
        }

        public function _Str_8211(k:IAvatarAddition):IAvatarAddition
        {
            if (!this._Str_3663)
            {
                this._Str_3663 = new Map();
            }
            if (this._Str_3663.hasKey(k.id))
            {
                throw (new Error((("Avatar addition with index " + k.id) + "already exists!")));
            }
            this._Str_3663.add(k.id, k);
            return k;
        }

        public function _Str_6142(k:int):IAvatarAddition
        {
            return (this._Str_3663) ? this._Str_3663[k] : null;
        }

        public function _Str_5801(k:int):void
        {
            var _local_2:IAvatarAddition = this._Str_6142(k);
            if (!_local_2)
            {
                return;
            }
            this._Str_3663.remove(k);
            _local_2.dispose();
        }
    }
}
