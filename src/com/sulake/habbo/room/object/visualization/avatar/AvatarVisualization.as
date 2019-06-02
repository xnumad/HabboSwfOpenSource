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
        private static const AVATAR_SPRITE_DEFAULT_DEPTH:Number = -0.01;
        private static const AVATAR_OWN_DEPTH_ADJUST:Number = 0.001;
        private static const AVATAR_SPRITE_LAYING_DEPTH:Number = -0.409;
        private static const MAX_AVATARS_WITH_EFFECT:int = 1000;
        private static const SPRITE_INDEX_AVATAR:int = 2;
        private static const _usedTextureNames:Array = [0, 0, 0];
        private static const SPRITE_INDEX_SHADOW:int = 97;
        private static const INITIAL_RESERVED_SPRITES:int = 3;
        private static const ADDITION_ID_IDLE_BUBBLE:int = 0;
        private static const ADDITION_ID_TYPING_BUBBLE:int = 1;
        private static const ADDITION_ID_EXPRESSION:int = 2;
        private static const ADDITION_ID_NUMBER_BUBBLE:int = 1;
        private static const ADDITION_ID_GAME_CLICK_TARGET:int = 2;
        private static const ADDITION_ID_MUTED_BUBBLE:int = 3;
        private static const ADDITION_ID_GUIDE_STATUS_BUBBLE:int = 4;
        private static const _Str_11164:int = 5;
        private static const _Str_10168:int = 6;
        private static const _Str_8837:int = 7;

        private const _Str_9654:int = 41;

        private var _geometryUpdateId:int = -1000;
        private var _visualizationData:AvatarVisualizationData = null;
        private var _avatars:Map;
        private var _avatarsOnEffect:Map;
        private var _headAngle:int = 0;
        private var _gpuMode:Boolean;
        private var _figure:String;
        private var _gender:String;
        private var _currentAngleDeg:int = 0;
        private var _shadowAsset:BitmapDataAsset;
        private var _currentHeadAngleDeg:int = -1;
        private var _angle:int = -1;
        private var _expressionType:int = -1;
        private var _gesture:int = 2;
        private var _additions:Map;
        private var FLOOR_COLOR:int = -1;
        private var _posture:String = "";
        private var _Str_13611:String = "";
        private var _isTalking:Boolean = false;
        private var _isSleeping:Boolean = false;
        private var _isBlinking:Boolean = false;
        private var _mouseHighlight:int = 0;
        private var _signType:int = 0;
        private var _effectType:int = 0;
        private var _carryObjectType:int = 0;
        private var _mouseHighlightEnabled:Boolean = false;
        private var _useObjectType:int = -1;
        private var _geometryOffset:int = 0;
        private var _baseY:int = 0;
        private var BASE_Y_SCALE:int = 0;
        private var ANIMATION_UPDATE_INTERVAL_MS:int = 0;
        private var SNOWBOARDING_EFFECT:int = 0;
        private var _effectJustApplied:Boolean = false;
        private var _isSittingManual:Boolean = false;
        private var _isLaying:Boolean = false;
        private var _activeAvatarImage:IAvatarImage = null;
        private var _layInside:Boolean = false;
        private var _disposed:Boolean;

        public function AvatarVisualization()
        {
            this._avatars = new Map();
            this._avatarsOnEffect = new Map();
            this._gpuMode = false;
        }

        override public function dispose():void
        {
            var k:IAvatarAddition;
            if (this._avatars != null)
            {
                this._Str_15248();
                this._avatars.dispose();
                this._avatarsOnEffect.dispose();
                this._avatars = null;
            }
            this._visualizationData = null;
            this._shadowAsset = null;
            if (this._additions)
            {
                for each (k in this._additions)
                {
                    k.dispose();
                }
                this._additions = null;
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
            if (this._activeAvatarImage == null)
            {
                return null;
            }
            var k:IRoomObjectSprite = getSprite(ADDITION_ID_TYPING_BUBBLE);
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
            var _local_3:Array = this._activeAvatarImage._Str_1009();
            for each (_local_4 in this._activeAvatarImage._Str_754())
            {
                _local_6 = new RoomObjectSpriteData();
                _local_7 = this._activeAvatarImage.getLayerData(_local_4);
                _local_8 = 0;
                _local_9 = this._activeAvatarImage.getDirection();
                _local_10 = _local_4.getDirectionOffsetX(_local_9);
                _local_11 = _local_4.getDirectionOffsetY(_local_9);
                _local_12 = _local_4.getDirectionOffsetZ(_local_9);
                _local_13 = 0;
                if (_local_4.hasDirections)
                {
                    _local_13 = _local_9;
                }
                if (_local_7 != null)
                {
                    _local_8 = _local_7.animationFrame;
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
                _local_15 = ((((((this._activeAvatarImage._Str_797() + "_") + _local_4.member) + "_") + _local_13) + "_") + _local_8);
                _local_16 = this._activeAvatarImage.getAsset(_local_15);
                if (_local_16 != null)
                {
                    _local_6.x = ((-(_local_16.offset.x) - (_local_14 / 2)) + _local_10);
                    _local_6.y = (-(_local_16.offset.y) + _local_11);
                    if (_local_4.hasStaticY)
                    {
                        _local_6.y = (_local_6.y + ((this.SNOWBOARDING_EFFECT * _local_14) / (2 * MAX_AVATARS_WITH_EFFECT)));
                    }
                    if (_local_4.ink == 33)
                    {
                        _local_6.blendMode = "add";
                    }
                    _local_6.name = _local_15;
                    if (this._isSittingManual)
                    {
                        _local_6.z = (AVATAR_SPRITE_LAYING_DEPTH - ((0.001 * spriteCount) * _local_12));
                    }
                    else
                    {
                        _local_6.z = ((-0.001 * spriteCount) * _local_12);
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
            _local_5 = this._activeAvatarImage._Str_920;
            if (((!(_local_5 == null)) && (_local_5.paletteIsGrayscale)))
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
            this._visualizationData = (k as AvatarVisualizationData);
            createSprites(ADDITION_ID_EXPRESSION);
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
            if (k.getUpdateID() != _modelUpdateID)
            {
                _local_4 = false;
                _local_5 = false;
                _local_6 = 0;
                _local_7 = "";
                _local_5 = ((k.getNumber(RoomObjectVariableEnum.FIGURE_TALK) > 0) && (_arg_3));
                if (_local_5 != this._isTalking)
                {
                    this._isTalking = _local_5;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_EXPRESSION);
                if (_local_6 != this._mouseHighlight)
                {
                    this._mouseHighlight = _local_6;
                    _local_4 = true;
                }
                _local_5 = (k.getNumber(RoomObjectVariableEnum.FIGURE_SLEEP) > 0);
                if (_local_5 != this._isSleeping)
                {
                    this._isSleeping = _local_5;
                    _local_4 = true;
                }
                _local_5 = ((k.getNumber(RoomObjectVariableEnum.FIGURE_BLINK) > 0) && (_arg_3));
                if (_local_5 != this._isBlinking)
                {
                    this._isBlinking = _local_5;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_GESTURE);
                if (_local_6 != this._signType)
                {
                    this._signType = _local_6;
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
                if (_local_5 != this._effectJustApplied)
                {
                    this._effectJustApplied = _local_5;
                    _local_4 = true;
                }
                _local_6 = (k.getNumber(RoomObjectVariableEnum.FIGURE_VERTICAL_OFFSET) * MAX_AVATARS_WITH_EFFECT);
                if (_local_6 != this.SNOWBOARDING_EFFECT)
                {
                    this.SNOWBOARDING_EFFECT = _local_6;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_DANCE);
                if (_local_6 != this._effectType)
                {
                    this._effectType = _local_6;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_EFFECT);
                if (_local_6 != this._geometryOffset)
                {
                    this._geometryOffset = _local_6;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT);
                if (_local_6 != this._baseY)
                {
                    this._baseY = _local_6;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_USE_OBJECT);
                if (_local_6 != this.BASE_Y_SCALE)
                {
                    this.BASE_Y_SCALE = _local_6;
                    _local_4 = true;
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.HEAD_DIRECTION);
                if (_local_6 != this._currentHeadAngleDeg)
                {
                    this._currentHeadAngleDeg = _local_6;
                    _local_4 = true;
                }
                if (((this._baseY > 0) && (k.getNumber(RoomObjectVariableEnum.FIGURE_USE_OBJECT) > 0)))
                {
                    if (this.BASE_Y_SCALE != this._baseY)
                    {
                        this.BASE_Y_SCALE = this._baseY;
                        _local_4 = true;
                    }
                }
                else
                {
                    if (this.BASE_Y_SCALE != 0)
                    {
                        this.BASE_Y_SCALE = 0;
                        _local_4 = true;
                    }
                }
                _local_8 = (this._Str_6142(ADDITION_ID_NUMBER_BUBBLE) as FloatingIdleZ);
                if (this._isSleeping)
                {
                    if (!_local_8)
                    {
                        _local_8 = this._Str_8211(new FloatingIdleZ(ADDITION_ID_NUMBER_BUBBLE, this));
                    }
                    _local_4 = true;
                }
                else
                {
                    if (_local_8)
                    {
                        this._Str_5801(ADDITION_ID_NUMBER_BUBBLE);
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
                    this._Str_5801(ADDITION_ID_GAME_CLICK_TARGET);
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
                    _local_8 = (this._Str_6142(ADDITION_ID_GAME_CLICK_TARGET) as TypingBubble);
                    if (_local_5)
                    {
                        if (!_local_8)
                        {
                            _local_8 = this._Str_8211(new TypingBubble(ADDITION_ID_GAME_CLICK_TARGET, this));
                        }
                        _local_4 = true;
                    }
                    else
                    {
                        if (_local_8)
                        {
                            this._Str_5801(ADDITION_ID_GAME_CLICK_TARGET);
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
                _local_8 = (this._Str_6142(ADDITION_ID_GUIDE_STATUS_BUBBLE) as NumberBubble);
                if (_local_6 > 0)
                {
                    if (!_local_8)
                    {
                        _local_8 = this._Str_8211(new NumberBubble(ADDITION_ID_GUIDE_STATUS_BUBBLE, _local_6, this));
                    }
                    _local_4 = true;
                }
                else
                {
                    if (_local_8)
                    {
                        this._Str_5801(ADDITION_ID_GUIDE_STATUS_BUBBLE);
                    }
                }
                _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_EXPRESSION);
                _local_8 = this._Str_6142(ADDITION_ID_MUTED_BUBBLE);
                if (_local_6 > 0)
                {
                    if (!_local_8)
                    {
                        _local_8 = ExpressionAdditionFactory.make(ADDITION_ID_MUTED_BUBBLE, _local_6, this);
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
                        this._Str_5801(ADDITION_ID_MUTED_BUBBLE);
                    }
                }
                this.validateActions(_arg_2);
                _local_7 = k.getString(RoomObjectVariableEnum.GENDER);
                if (_local_7 != this._gender)
                {
                    this._gender = _local_7;
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
                    if (_local_6 != this._useObjectType)
                    {
                        _local_4 = true;
                        this._useObjectType = _local_6;
                    }
                }
                _local_5 = (k.getNumber(RoomObjectVariableEnum.FIGURE_HIGHLIGHT_ENABLE) > 0);
                if (_local_5 != this._mouseHighlightEnabled)
                {
                    this._mouseHighlightEnabled = _local_5;
                    _local_4 = true;
                }
                if (this._mouseHighlightEnabled)
                {
                    _local_6 = k.getNumber(RoomObjectVariableEnum.FIGURE_HIGHLIGHT);
                    if (_local_6 != this._carryObjectType)
                    {
                        this._carryObjectType = _local_6;
                        _local_4 = true;
                    }
                }
                _local_5 = (k.getNumber(RoomObjectVariableEnum.OWN_USER) > 0);
                if (_local_5 != this._layInside)
                {
                    this._layInside = _local_5;
                    _local_4 = true;
                }
                _modelUpdateID = k.getUpdateID();
                return _local_4;
            }
            return false;
        }

        private function updateFigure(k:String):Boolean
        {
            if (this._figure != k)
            {
                this._figure = k;
                this._Str_15248();
                return true;
            }
            return false;
        }

        private function _Str_15248():void
        {
            var k:IAvatarImage;
            var _local_2:IRoomObjectSprite;
            for each (k in this._avatars)
            {
                if (k)
                {
                    k.dispose();
                }
            }
            for each (k in this._avatarsOnEffect)
            {
                if (k)
                {
                    k.dispose();
                }
            }
            this._avatars.reset();
            this._avatarsOnEffect.reset();
            this._activeAvatarImage = null;
            _local_2 = getSprite(ADDITION_ID_IDLE_BUBBLE);
            if (_local_2 != null)
            {
                _local_2.asset = null;
                _local_2.alpha = 0xFF;
            }
        }

        private function validateActions(k:Number):void
        {
            var _local_2:int;
            if (k < 48)
            {
                this._isBlinking = false;
            }
            if (((this._posture == "sit") || (this._posture == "lay")))
            {
                this.ANIMATION_UPDATE_INTERVAL_MS = (k / 2);
            }
            else
            {
                this.ANIMATION_UPDATE_INTERVAL_MS = 0;
            }
            this._isLaying = false;
            this._isSittingManual = false;
            if (this._posture == "lay")
            {
                this._isSittingManual = true;
                _local_2 = int(this._Str_13611);
                if (_local_2 < 0)
                {
                    this._isLaying = true;
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
                _local_3 = (this._avatars.getValue(_local_4) as IAvatarImage);
            }
            else
            {
                _local_4 = (_local_4 + ("-" + _arg_2));
                _local_3 = (this._avatarsOnEffect.getValue(_local_4) as IAvatarImage);
                if (_local_3)
                {
                    _local_3._Str_998();
                }
            }
            if (_local_3 == null)
            {
                _local_3 = this._visualizationData._Str_8991(this._figure, k, this._gender, this, this);
                if (_local_3 != null)
                {
                    if (_arg_2 == 0)
                    {
                        this._avatars.add(_local_4, _local_3);
                    }
                    else
                    {
                        if (this._avatarsOnEffect.length >= INITIAL_RESERVED_SPRITES)
                        {
                            _local_5 = this._avatarsOnEffect.remove(this._avatarsOnEffect.getKey(0));
                            if (_local_5)
                            {
                                _local_5.dispose();
                            }
                        }
                        this._avatarsOnEffect.add(_local_4, _local_3);
                    }
                }
            }
            return _local_3;
        }

        public function getAvatarRendererAsset(k:String):IAsset
        {
            return (this._visualizationData) ? this._visualizationData.getAvatarRendererAsset(k) : null;
        }

        private function updateObject(k:IRoomObject, _arg_2:IRoomGeometry, _arg_3:Boolean, _arg_4:Boolean=false):Boolean
        {
            var _local_5:Boolean;
            var _local_6:int;
            var _local_7:int;
            if ((((_arg_4) || (!(_objectUpdateID == k.getUpdateID()))) || (!(this.FLOOR_COLOR == _arg_2.updateId))))
            {
                _local_5 = _arg_3;
                _local_6 = (k.getDirection().x - _arg_2.direction.x);
                _local_6 = (((_local_6 % 360) + 360) % 360);
                if (((this._posture == "sit") && (this._effectJustApplied)))
                {
                    _local_6 = (_local_6 - ((_local_6 % 90) - 45));
                }
                _local_7 = this._currentHeadAngleDeg;
                if (this._posture == "float")
                {
                    _local_7 = _local_6;
                }
                else
                {
                    _local_7 = (_local_7 - _arg_2.direction.x);
                }
                _local_7 = (((_local_7 % 360) + 360) % 360);
                if (((this._posture == "sit") && (this._effectJustApplied)))
                {
                    _local_7 = (_local_7 - ((_local_7 % 90) - 45));
                }
                if (((!(_local_6 == this._angle)) || (_arg_4)))
                {
                    _local_5 = true;
                    this._angle = _local_6;
                    _local_6 = (_local_6 - (135 - 22.5));
                    _local_6 = ((_local_6 + 360) % 360);
                    this._activeAvatarImage.setDirectionAngle(AvatarSetType.FULL, _local_6);
                }
                if (((!(_local_7 == this._expressionType)) || (_arg_4)))
                {
                    _local_5 = true;
                    this._expressionType = _local_7;
                    if (this._expressionType != this._angle)
                    {
                        _local_7 = (_local_7 - (135 - 22.5));
                        _local_7 = ((_local_7 + 360) % 360);
                        this._activeAvatarImage.setDirectionAngle(AvatarSetType.HEAD, _local_7);
                    }
                }
                _objectUpdateID = k.getUpdateID();
                this.FLOOR_COLOR = _arg_2.updateId;
                return _local_5;
            }
            return false;
        }

        private function _Str_23519(k:Number):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:IRoomObjectSprite = getSprite(ADDITION_ID_TYPING_BUBBLE);
            this._shadowAsset = null;
            var _local_3:Boolean = (((this._posture == "mv") || (this._posture == "std")) || ((this._posture == "sit") && (this._effectJustApplied)));
            if (this._geometryOffset == SPRITE_INDEX_SHADOW)
            {
                _local_3 = false;
            }
            if (_local_3)
            {
                _local_2.visible = true;
                if (((this._shadowAsset == null) || (!(k == _currentScale))))
                {
                    _local_4 = 0;
                    _local_5 = 0;
                    if (k < 48)
                    {
                        _local_2._Str_3582 = "sh_std_sd_1_0_0";
                        this._shadowAsset = this._activeAvatarImage.getAsset(_local_2._Str_3582);
                        _local_4 = -8;
                        _local_5 = ((this._effectJustApplied) ? 6 : -3);
                    }
                    else
                    {
                        _local_2._Str_3582 = "h_std_sd_1_0_0";
                        this._shadowAsset = this._activeAvatarImage.getAsset(_local_2._Str_3582);
                        _local_4 = -17;
                        _local_5 = ((this._effectJustApplied) ? 10 : -7);
                    }
                    if (this._shadowAsset != null)
                    {
                        _local_2.asset = (this._shadowAsset.content as BitmapData);
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
                this._shadowAsset = null;
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
            if (this._visualizationData == null)
            {
                return;
            }
            if (_arg_2 < (this._geometryUpdateId + this._Str_9654))
            {
                return;
            }
            this._geometryUpdateId = (this._geometryUpdateId + this._Str_9654);
            if ((this._geometryUpdateId + this._Str_9654) < _arg_2)
            {
                this._geometryUpdateId = (_arg_2 - this._Str_9654);
            }
            var _local_6:IRoomObjectModel = _local_5.getModel();
            var _local_7:Number = k.scale;
            var _local_8:Boolean;
            var _local_9:Boolean;
            var _local_10:Boolean;
            var _local_11:int = this._geometryOffset;
            var _local_12:Boolean;
            var _local_13:Boolean = this.updateModel(_local_6, _local_7, _arg_3);
            if ((((_local_13) || (!(_local_7 == _currentScale))) || (this._activeAvatarImage == null)))
            {
                if (_local_7 != _currentScale)
                {
                    _local_9 = true;
                    this.validateActions(_local_7);
                }
                if (_local_11 != this._geometryOffset)
                {
                    _local_12 = true;
                }
                if ((((_local_9) || (this._activeAvatarImage == null)) || (_local_12)))
                {
                    this._activeAvatarImage = this._Str_23124(_local_7, this._geometryOffset);
                    if (this._activeAvatarImage == null)
                    {
                        return;
                    }
                    _local_8 = true;
                    _local_17 = getSprite(ADDITION_ID_IDLE_BUBBLE);
                    if ((((_local_17) && (this._activeAvatarImage)) && (this._activeAvatarImage.isPlaceholder())))
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
                if (this._activeAvatarImage == null)
                {
                    return;
                }
                if (((_local_12) && (this._activeAvatarImage._Str_677)))
                {
                    this._activeAvatarImage._Str_833();
                }
                this._Str_23519(_local_7);
                _local_10 = this.updateObject(_local_5, k, _arg_3, true);
                this._Str_1620(this._activeAvatarImage);
                if (this._additions)
                {
                    _local_14 = this._gesture;
                    for each (_local_18 in this._additions)
                    {
                        _local_18.update(getSprite(_local_14++), _local_7);
                    }
                }
                _currentScale = _local_7;
            }
            else
            {
                _local_10 = this.updateObject(_local_5, k, _arg_3);
            }
            if (this._additions)
            {
                _local_14 = this._gesture;
                for each (_local_18 in this._additions)
                {
                    if (_local_18.animate(getSprite(_local_14++)))
                    {
                        increaseUpdateId();
                    }
                }
            }
            var _local_15:Boolean = (((_local_10) || (_local_13)) || (_local_9));
            var _local_16:Boolean = (((this._gpuMode) || (this._currentAngleDeg > 0)) && (_arg_3));
            if (_local_15)
            {
                this._currentAngleDeg = SPRITE_INDEX_AVATAR;
            }
            if (((_local_15) || (_local_16)))
            {
                increaseUpdateId();
                this._currentAngleDeg--;
                this._headAngle--;
                if (((((this._headAngle <= 0) || (_local_9)) || (_local_13)) || (_local_8)))
                {
                    this._activeAvatarImage._Str_953(1);
                    this._headAngle = SPRITE_INDEX_AVATAR;
                }
                else
                {
                    return;
                }
                _local_20 = this._activeAvatarImage._Str_781();
                if (((_local_20 == null) || (_local_20.length < 3)))
                {
                    _local_20 = _usedTextureNames;
                }
                _local_19 = getSprite(ADDITION_ID_IDLE_BUBBLE);
                if (_local_19 != null)
                {
                    _local_24 = ((_local_6.getNumber(RoomObjectVariableEnum.FIGURE_HIGHLIGHT_ENABLE) == 1) && (_local_6.getNumber(RoomObjectVariableEnum.FIGURE_HIGHLIGHT) == 1));
                    _local_25 = this._activeAvatarImage.getImage(AvatarSetType.FULL, _local_24);
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
                        _local_19.offsetY = (((-(_local_19.asset.height) + (_local_7 / 4)) + _local_20[1]) + this.ANIMATION_UPDATE_INTERVAL_MS);
                    }
                    if (this._isSittingManual)
                    {
                        if (this._isLaying)
                        {
                            _local_19.relativeDepth = -0.5;
                        }
                        else
                        {
                            _local_19.relativeDepth = (AVATAR_SPRITE_LAYING_DEPTH + _local_20[2]);
                        }
                    }
                    else
                    {
                        _local_19.relativeDepth = (AVATAR_SPRITE_DEFAULT_DEPTH + _local_20[2]);
                    }
                    if (this._layInside)
                    {
                        _local_19.relativeDepth = (_local_19.relativeDepth - AVATAR_OWN_DEPTH_ADJUST);
                        _local_19._Str_4918 = RoomObjectSpriteType.AVATAR_OWN;
                    }
                    else
                    {
                        _local_19._Str_4918 = RoomObjectSpriteType.AVATAR;
                    }
                }
                _local_18 = (this._Str_6142(ADDITION_ID_GAME_CLICK_TARGET) as TypingBubble);
                if (_local_18)
                {
                    if (!this._isSittingManual)
                    {
                        TypingBubble(_local_18).relativeDepth = ((AVATAR_SPRITE_DEFAULT_DEPTH - 0.01) + _local_20[2]);
                    }
                    else
                    {
                        TypingBubble(_local_18).relativeDepth = ((AVATAR_SPRITE_LAYING_DEPTH - 0.01) + _local_20[2]);
                    }
                }
                this._gpuMode = this._activeAvatarImage._Str_899();
                _local_21 = ADDITION_ID_EXPRESSION;
                _local_22 = this._activeAvatarImage.getDirection();
                for each (_local_23 in this._activeAvatarImage._Str_754())
                {
                    if (_local_23.id == AVATAR)
                    {
                        _local_19 = getSprite(ADDITION_ID_IDLE_BUBBLE);
                        _local_27 = this._activeAvatarImage.getLayerData(_local_23);
                        _local_28 = _local_23.getDirectionOffsetX(_local_22);
                        _local_29 = _local_23.getDirectionOffsetY(_local_22);
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
                        if (!this._effectJustApplied)
                        {
                            _local_19.offsetX = (_local_19.offsetX + _local_28);
                            _local_19.offsetY = (_local_19.offsetY + _local_29);
                        }
                    }
                    else
                    {
                        _local_19 = getSprite(_local_21);
                        if (_local_19 != null)
                        {
                            _local_19._Str_4023 = AlphaTolerance.MATCH_NOTHING;
                            _local_19.visible = true;
                            _local_30 = this._activeAvatarImage.getLayerData(_local_23);
                            _local_31 = 0;
                            _local_32 = _local_23.getDirectionOffsetX(_local_22);
                            _local_33 = _local_23.getDirectionOffsetY(_local_22);
                            _local_34 = _local_23.getDirectionOffsetZ(_local_22);
                            _local_35 = 0;
                            if (_local_23.hasDirections)
                            {
                                _local_35 = _local_22;
                            }
                            if (_local_30 != null)
                            {
                                _local_31 = _local_30.animationFrame;
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
                            _local_36 = ((((((this._activeAvatarImage._Str_797() + "_") + _local_23.member) + "_") + _local_35) + "_") + _local_31);
                            _local_37 = this._activeAvatarImage.getAsset(_local_36);
                            if (_local_37 == null) continue;
                            _local_19.asset = (_local_37.content as BitmapData);
                            _local_19.offsetX = ((-(_local_37.offset.x) - (_local_7 / 2)) + _local_32);
                            _local_19.offsetY = (-(_local_37.offset.y) + _local_33);
                            if (_local_23.hasStaticY)
                            {
                                _local_19.offsetY = (_local_19.offsetY + ((this.SNOWBOARDING_EFFECT * _local_7) / (2 * MAX_AVATARS_WITH_EFFECT)));
                            }
                            else
                            {
                                _local_19.offsetY = (_local_19.offsetY + this.ANIMATION_UPDATE_INTERVAL_MS);
                            }
                            if (this._isSittingManual)
                            {
                                _local_19.relativeDepth = (AVATAR_SPRITE_LAYING_DEPTH - ((0.001 * spriteCount) * _local_34));
                            }
                            else
                            {
                                _local_19.relativeDepth = (AVATAR_SPRITE_DEFAULT_DEPTH - ((0.001 * spriteCount) * _local_34));
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
            if (this._signType > 0)
            {
                k.appendAction(AvatarAction.GESTURE, AvatarAction.getGesture(this._signType));
            }
            if (this._effectType > 0)
            {
                k.appendAction(AvatarAction.DANCE, this._effectType);
            }
            if (this._useObjectType > -1)
            {
                k.appendAction(AvatarAction.SIGN, this._useObjectType);
            }
            if (this._baseY > 0)
            {
                k.appendAction(AvatarAction.CARRY_OBJECT, this._baseY);
            }
            if (this.BASE_Y_SCALE > 0)
            {
                k.appendAction(AvatarAction.USE_OBJECT, this.BASE_Y_SCALE);
            }
            if (this._isTalking)
            {
                k.appendAction(AvatarAction.TALK);
            }
            if (((this._isSleeping) || (this._isBlinking)))
            {
                k.appendAction(AvatarAction.SLEEP);
            }
            if (this._mouseHighlight > 0)
            {
                _local_4 = AvatarAction.getExpression(this._mouseHighlight);
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
            if (this._geometryOffset > 0)
            {
                k.appendAction(AvatarAction.EFFECT, this._geometryOffset);
            }
            k._Str_962();
            this._gpuMode = k._Str_899();
            var _local_2:int = ADDITION_ID_EXPRESSION;
            for each (_local_3 in this._activeAvatarImage._Str_754())
            {
                if (_local_3.id != AVATAR)
                {
                    _local_2++;
                }
            }
            if (_local_2 != spriteCount)
            {
                createSprites(_local_2);
            }
            this._gesture = _local_2;
            if (this._additions)
            {
                for each (_local_5 in this._additions)
                {
                    _local_6 = addSprite();
                }
            }
        }

        public function _Str_840(k:String):void
        {
            this._Str_15248();
        }

        public function updateAnimationByFrames(k:int):void
        {
            this._Str_15248();
        }

        protected function get _Str_26131():int
        {
            return (this._additions) ? this._additions.length : 0;
        }

        public function _Str_8211(k:IAvatarAddition):IAvatarAddition
        {
            if (!this._additions)
            {
                this._additions = new Map();
            }
            if (this._additions.hasKey(k.id))
            {
                throw (new Error((("Avatar addition with index " + k.id) + "already exists!")));
            }
            this._additions.add(k.id, k);
            return k;
        }

        public function _Str_6142(k:int):IAvatarAddition
        {
            return (this._additions) ? this._additions[k] : null;
        }

        public function _Str_5801(k:int):void
        {
            var _local_2:IAvatarAddition = this._Str_6142(k);
            if (!_local_2)
            {
                return;
            }
            this._additions.remove(k);
            _local_2.dispose();
        }
    }
}
