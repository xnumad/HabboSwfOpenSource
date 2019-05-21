package snowwar._Str_39
{
    import snowwar.Tile;
    import snowwar._Str_254.Location;
    import snowwar._Str_254.Direction8;
    import snowwar.SnowWarEngine;
    import com.sulake.core.utils.Map;
    import snowwar.SnowWarGameStage;
    import snowwar._Str_62.HumanGameObjectData;
    import snowwar._Str_62.SnowWarGameObjectData;
    import com.sulake.core.runtime.exceptions.Exception;
    import snowwar._Str_254.CollisionDetection;
    import snowwar._Str_254.Direction360;
    import snowwar._Str_231.SynchronizedGameStage;
    import snowwar._Str_254._SafeStr_4667;
    import com.sulake.habbo.sound.HabboSoundConstants;
    import snowwar._SafeStr_4034;
    import snowwar._Str_231.SynchronizedGameArena;
	import com.sulake.habbo.avatar.enum.AvatarAction;
	import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class HumanGameObject extends SnowWarGameObject 
    {
        public static const _SafeStr_18811:int = 534;
        public static const _SafeStr_18812:int = 5;
        public static const _SafeStr_18813:int = 5;
        public static const _SafeStr_18814:int = 5;
        public static const _SafeStr_18815:int = 20;
        public static const _SafeStr_18816:int = 100;
        public static const _SafeStr_18817:int = 60;
        public static const _SafeStr_18818:int = 0;
        public static const _SafeStr_18819:int = 1;
        public static const _SafeStr_18820:int = 2;
        public static const _SafeStr_18821:int = 3;
        public static const _SafeStr_18822:int = 5;
        public static const _SafeStr_18823:Array = [1600];
        public static const _SafeStr_18824:int = 5000;
        private static const _SafeStr_18825:int = 5;
        private static const _SafeStr_18826:int = 1;

        private var _currentTile:Tile;
        private var _nextTile:Tile;
        private var _SafeStr_18827:Boolean;
        private var _currentLocation:Location;
        private var _moveTarget:Location;
        private var _stoppedDir:Direction8;
        private var _SafeStr_18829:int;
        private var _SafeStr_18830:int;
        protected var _SafeStr_18831:int;
        private var _SafeStr_18832:int;
        private var _SafeStr_18833:int;
        private var _score:int;
        private var _team:int;
        private var _SafeStr_18835:int;
        private var _name:String;
        private var _mission:String;
        private var _figure:String;
        private var _sex:String;
        private var _userId:int;
        private var _SafeStr_18836:int = 0;
        private var _SafeStr_18579:SnowWarEngine;
        private var _SafeStr_18837:Map;

        public function HumanGameObject(k:SnowWarGameStage, _arg_2:HumanGameObjectData, _arg_3:Boolean, _arg_4:SnowWarEngine)
        {
            this._currentLocation = new Location(0, 0, 0);
            this._moveTarget = new Location(0, 0, 0);
            this._stoppedDir = Direction8.SE;
            super(_arg_2.id, _arg_3);
            this._sex = _arg_2.sex;
            this._name = _arg_2.name;
            this._mission = _arg_2.mission;
            this._figure = _arg_2.figure;
            this._team = _arg_2.team;
            this._userId = _arg_2.userId;
            this._SafeStr_18833 = _arg_2._SafeStr_12588;
            this._SafeStr_18832 = _arg_2._SafeStr_12587;
            this._currentLocation.setPosition(_arg_2.x, _arg_2.y);
            this._stoppedDir = Direction8.fromIndex(_arg_2._SafeStr_12583);
            this._SafeStr_18829 = _arg_2._SafeStr_12584;
            this._moveTarget.setPosition(_arg_2._SafeStr_12591, _arg_2._SafeStr_12592);
            this._SafeStr_18830 = _arg_2._SafeStr_12585;
            this._score = _arg_2.score;
			trace("Human Game Object: " + _arg_2._SafeStr_12581 + " | " + _arg_2._SafeStr_12582);
			trace(k.tileMap);
            this._currentTile = k.getTileAt(_arg_2._SafeStr_12581, _arg_2._SafeStr_12582);
			if (this._currentTile == null)
			{
				throw Error("Human Game Object: " + _arg_2._SafeStr_12581 + " | " + _arg_2._SafeStr_12582 + " > " + k.tileMap == null + " /" + k.tileMap.length);
			}
            this._currentTile.addActiveGameObject(this);
            var _local_5:Tile = k.getTileAt(_arg_2._SafeStr_12589, _arg_2._SafeStr_12590);
            if (_local_5 != this._currentTile)
            {
                this._nextTile = _local_5;
                this._nextTile.addActiveGameObject(this);
                this._currentTile.removeHumanGameObject();
                this._SafeStr_18827 = true;
            }
            this._SafeStr_18579 = _arg_4;
            this._SafeStr_18837 = new Map();
        }

        public function get _SafeStr_18745():int
        {
            return this._SafeStr_18836;
        }

        public function set _SafeStr_18745(k:int):void
        {
            this._SafeStr_18836 = k;
        }

        public function get _SafeStr_18748():Boolean
        {
            return this._SafeStr_18833 == _SafeStr_18821;
        }

        override public function dispose():void
        {
            super.dispose();
            this._sex = "";
            this._name = "";
            this._mission = "";
            this._figure = "";
            this._team = 0;
            this._userId = 0;
            this._currentLocation = null;
            this._stoppedDir = null;
            this._moveTarget = null;
            this._SafeStr_18830 = 0;
            this._score = 0;
            this._SafeStr_18827 = false;
            this._SafeStr_18579 = null;
            this._SafeStr_18837 = null;
        }

        override public function get numberOfVariables():int
        {
            return HumanGameObjectData.NUM_OF_VARIABLES;
        }

        override public function getVariable(k:int):int
        {
            switch (k)
            {
                case 0:
                    return SnowWarGameObjectData.OBJECT_TYPE_HUMAN;
                case 1:
                    return _id;
                case 2:
                    return this._currentLocation.x;
                case 3:
                    return this._currentLocation.y;
                case 4:
                    return this._currentTile._SafeStr_18688[0];
                case 5:
                    return this._currentTile._SafeStr_18688[1];
                case 6:
                    return this._stoppedDir.index();
                case 7:
                    return this._SafeStr_18829;
                case 8:
                    return this._SafeStr_18830;
                case 9:
                    return this._SafeStr_18831;
                case 10:
                    return this._SafeStr_18832;
                case 11:
                    return this._SafeStr_18833;
                case 12:
                    return (this._nextTile != null) ? this._nextTile._SafeStr_18688[0] : this._currentTile._SafeStr_18688[0];
                case 13:
                    return (this._nextTile != null) ? this._nextTile._SafeStr_18688[1] : this._currentTile._SafeStr_18688[1];
                case 14:
                    return this._moveTarget.x;
                case 15:
                    return this._moveTarget.y;
                case 16:
                    return this._score;
                case 17:
                    return this._team;
                case 18:
                    return this._userId;
            }
            throw (new Exception(("No such variable:" + k)));
        }

        public function _SafeStr_13261(k:HumanGameObject):void
        {
            this._currentLocation.setPosition(k._currentLocation.x, k._currentLocation.y);
            this._currentTile = k._currentTile;
            this._stoppedDir = k._stoppedDir;
            this._SafeStr_18829 = k._SafeStr_18829;
            this._SafeStr_18830 = k._SafeStr_18830;
            this._SafeStr_18831 = k._SafeStr_18831;
            this._SafeStr_18832 = k._SafeStr_18832;
            this._SafeStr_18833 = k._SafeStr_18833;
            this._nextTile = k._nextTile;
            this._moveTarget.setPosition(k._moveTarget.x, k._moveTarget.y);
            this._score = k._score;
            this._team = k._team;
            this._userId = k._userId;
        }

        public function _SafeStr_13259(k:int, _arg_2:Location):Boolean
        {
            var _local_3:Location = this._SafeStr_18837[k];
            if (_local_3)
            {
                return _local_3._SafeStr_18791(_arg_2, Tile.STEP_DIAG_COST);
            }
            return false;
        }

        public function _SafeStr_13262(k:int):void
        {
            var _local_2:Location = new Location(0, 0, 0);
            _local_2.setPosition(this._currentLocation.x, this._currentLocation.y);
            this._SafeStr_18837[k] = _local_2;
        }

        public function _SafeStr_13260(k:int):void
        {
            this._SafeStr_18837.remove(k);
        }

        public function _SafeStr_18838(k:Direction8):void
        {
            this._stoppedDir = k;
        }

        override public function get boundingType():int
        {
            return CollisionDetection._SafeStr_18853;
        }

        override public function get boundingData():Array
        {
            return _SafeStr_18823;
        }

        override public function get location3D():Location
        {
            return this._currentLocation;
        }

        override public function get direction360():Direction360
        {
            return null;
        }

        override public function onRemove():void
        {
            if (((this._currentTile) && (this._currentTile.humanGameObject == this)))
            {
                this._currentTile.removeHumanGameObject();
            }
            if (((this._nextTile) && (this._nextTile.humanGameObject == this)))
            {
                this._nextTile.removeHumanGameObject();
            }
            this._SafeStr_18827 = false;
        }

        public function _SafeStr_18839():void
        {
            if (this._SafeStr_18833 == _SafeStr_18820)
            {
                this._SafeStr_18829 = _SafeStr_18814;
                this._SafeStr_18833 = _SafeStr_18821;
                this._SafeStr_18832 = _SafeStr_18817;
                return;
            }
            if (this._SafeStr_18833 == _SafeStr_18819)
            {
                this._SafeStr_18830++;
            }
            this._SafeStr_18833 = _SafeStr_18818;
            this._SafeStr_18579._SafeStr_13225(_SafeStr_13236);
        }

        override public function subturn(k:SynchronizedGameStage):void
        {
            var _local_3:int;
            var _local_4:Direction8;
            var _local_2:SnowWarGameStage = (k as SnowWarGameStage);
            if (this._SafeStr_18832 > 0)
            {
                if (this._SafeStr_18832 == 1)
                {
                    this._SafeStr_18839();
                }
                this._SafeStr_18832--;
            }
            if (this._SafeStr_18835 > 0)
            {
                this._SafeStr_18835--;
            }
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((_SafeStr_13236 + " currentTile:") + this._currentTile) + " nextTile:") + this._nextTile));
            }
            if (((this._SafeStr_18848()) && (!(this._currentTile == null))))
            {
                if (this._nextTile != null)
                {
                    if (HabboGamesCom.logEnabled)
                    {
                        HabboGamesCom.log(((((_SafeStr_13236 + " Moving towards next tile:") + this._nextTile) + " _currentLocation:") + this._currentLocation));
                    }
                    this._SafeStr_18840();
                }
                else
                {
                    if (!this._currentTile._SafeStr_18689(this._moveTarget))
                    {
                        _local_3 = Direction360._SafeStr_18792((this._moveTarget.x - this._currentTile.location.x), (this._moveTarget.y - this._currentTile.location.y));
                        _local_4 = Direction360.direction360ValueToDirection8(_local_3);
                        this._nextTile = this._currentTile.adjacentTile(_local_4);
                        if (((this._nextTile == null) || (!(this._nextTile.walkable(this)))))
                        {
                            if (((!(this._nextTile == null)) && (!(this._nextTile.walkable(this)))))
                            {
                                if (this._moveTarget.equalLocation(this._nextTile.location))
                                {
                                    this._nextTile = null;
                                    this._SafeStr_13252();
                                    return;
                                }
                            }
                            _local_4 = _local_4._SafeStr_18854(-1);
                            this._nextTile = this._currentTile.adjacentTile(_local_4);
                            if (((this._nextTile == null) || (!(this._nextTile.walkable(this)))))
                            {
                                _local_4 = _local_4._SafeStr_18854(2);
                                this._nextTile = this._currentTile.adjacentTile(_local_4);
                                if (((!(this._nextTile == null)) && (!(this._nextTile.walkable(this)))))
                                {
                                    this._nextTile = null;
                                }
                            }
                        }
                        if (this._nextTile != null)
                        {
                            if (!_SafeStr_18700)
                            {
                                this._currentTile.removeHumanGameObject();
                                this._nextTile.addActiveGameObject(this);
                            }
                            this._SafeStr_18838(_local_4);
                            this._SafeStr_18840();
                        }
                        else
                        {
                            this._SafeStr_18827 = false;
                        }
                        if (HabboGamesCom.logEnabled)
                        {
                            HabboGamesCom.log(((((((((_SafeStr_13236 + " Starting to move to next tile in direction360:") + _local_3) + ", nextTile is now ") + this._nextTile) + "_currentLocationn:") + this._currentLocation) + ", moveTarget:") + this._moveTarget));
                        }
                    }
                    else
                    {
                        this._SafeStr_18827 = false;
                    }
                }
            }
            else
            {
                this._SafeStr_18827 = false;
            }
        }

        private function _SafeStr_18840():void
        {
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((_SafeStr_13236 + " [MoveTowardsNextTile], currentX: ") + this._currentLocation.x) + " currentY: ") + this._currentLocation.y));
            }
            var k:int = this._nextTile.location.x;
            var _local_2:int = this._currentLocation.x;
            var _local_3:int = (_local_2 - k);
            if (_local_3 != 0)
            {
                if (_local_3 < 0)
                {
                    if (_local_3 > -(_SafeStr_18811))
                    {
                        _local_2 = k;
                    }
                    else
                    {
                        _local_2 = (_local_2 + _SafeStr_18811);
                    }
                }
                else
                {
                    if (_local_3 < _SafeStr_18811)
                    {
                        _local_2 = k;
                    }
                    else
                    {
                        _local_2 = (_local_2 - _SafeStr_18811);
                    }
                }
            }
            var _local_4:int = this._nextTile.location.y;
            var _local_5:int = this._currentLocation.y;
            var _local_6:int = (_local_5 - _local_4);
            if (_local_6 != 0)
            {
                if (_local_6 < 0)
                {
                    if (_local_6 > -(_SafeStr_18811))
                    {
                        _local_5 = _local_4;
                    }
                    else
                    {
                        _local_5 = (_local_5 + _SafeStr_18811);
                    }
                }
                else
                {
                    if (_local_6 < _SafeStr_18811)
                    {
                        _local_5 = _local_4;
                    }
                    else
                    {
                        _local_5 = (_local_5 - _SafeStr_18811);
                    }
                }
            }
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((_SafeStr_13236 + " [MoveTowardsNextTile], nextX: ") + _local_2) + " nextY: ") + _local_5));
            }
            this._currentLocation.setPosition(_local_2, _local_5);
            if (this._currentLocation.distanceTo(this._nextTile.location) < _SafeStr_4667._SafeStr_18698((_SafeStr_18811 / 2)))
            {
                this._currentTile = this._nextTile;
                this._nextTile = null;
            }
            this._SafeStr_18827 = true;
        }

        public function _SafeStr_18603(k:int, _arg_2:int):void
        {
            if (this._SafeStr_18833 == _SafeStr_18819)
            {
                this._SafeStr_18833 = _SafeStr_18818;
                this._SafeStr_18832 = 0;
                this._SafeStr_18579._SafeStr_13225(_SafeStr_13236);
            }
            if (((this._SafeStr_18833 == _SafeStr_18818) || (this._SafeStr_18833 == _SafeStr_18821)))
            {
                this._moveTarget.setPosition(k, _arg_2);
            }
        }

        public function get currentLocation():Location
        {
            return this._currentLocation;
        }

        public function _SafeStr_18841(k:SnowWarGameStage, _arg_2:HumanGameObject, _arg_3:int):void
        {
            if (_SafeStr_18805)
            {
                return;
            }
            if (this._team == _arg_2.team)
            {
                return;
            }
            if (this._SafeStr_18829 > 0)
            {
                if (this._SafeStr_18829 == 1)
                {
                    this._SafeStr_18845(_arg_3);
                    _arg_2._SafeStr_18843(k, this);
                    SnowWarEngine._Str_4375(HabboSoundConstants.GAMES_SW_HIT3);
                }
                this._SafeStr_18829--;
                this._SafeStr_18579._SafeStr_13228(this, _arg_2);
            }
        }

        public function _SafeStr_18842(k:SnowWarGameStage, _arg_2:HumanGameObject):void
        {
            if (((!(_arg_2._SafeStr_18700)) && ((!(this.team == _arg_2.team)) || (_SafeStr_4034(k.synchronizedGameArena.getExtension())._SafeStr_18784()))))
            {
                this._SafeStr_18844(k.synchronizedGameArena, _SafeStr_18826);
            }
        }

        public function _SafeStr_18843(k:SnowWarGameStage, _arg_2:HumanGameObject):void
        {
            if (((!(_arg_2._SafeStr_18700)) && ((!(this.team == _arg_2.team)) || (_SafeStr_4034(k.synchronizedGameArena.getExtension())._SafeStr_18784()))))
            {
                this._SafeStr_18844(k.synchronizedGameArena, _SafeStr_18825);
            }
        }

        public function _SafeStr_18844(k:SynchronizedGameArena, _arg_2:int):void
        {
            this._score = (this._score + _arg_2);
            k._SafeStr_18855(this.team, _arg_2);
        }

        public function _SafeStr_18845(k:int):void
        {
            this._SafeStr_18833 = _SafeStr_18820;
            this._SafeStr_18832 = _SafeStr_18816;
            this._SafeStr_18838(Direction360.direction360ValueToDirection8(k).rotateDirection180Degrees());
            this._SafeStr_13252();
            this._SafeStr_18579._SafeStr_13225(_SafeStr_13236);
        }

        public function _SafeStr_13252():void
        {
            if (this._nextTile == null)
            {
                this._moveTarget.fromLocation(this._currentTile.location);
                this._currentLocation.fromLocation(this._currentTile.location);
            }
            else
            {
                this._currentTile = this._nextTile;
                this._currentLocation.fromLocation(this._nextTile.location);
                this._moveTarget.fromLocation(this._nextTile.location);
                this._nextTile = null;
            }
            this._SafeStr_18827 = false;
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((((((("Stopped. dir:" + this._stoppedDir) + "_currentTilee:") + this._currentTile) + "_nextTilee:") + this._nextTile) + "_currentLocationn:") + this._currentLocation) + "_moveTargett:") + this._moveTarget));
            }
        }

        public function _SafeStr_18743():int
        {
            return this._stoppedDir.index();
        }

        public function _SafeStr_13242():Boolean
        {
            return ((this._SafeStr_18830 > 0) && (this._SafeStr_18835 < 1)) && ((this._SafeStr_18833 == _SafeStr_18818) || (this._SafeStr_18833 == _SafeStr_18821));
        }

        public function _SafeStr_18846():void
        {
            this._SafeStr_18835 = _SafeStr_18822;
        }

        public function _SafeStr_18847(k:int, _arg_2:int):Boolean
        {
            if (this._SafeStr_18830 < 1)
            {
                return false;
            }
            this._SafeStr_13252();
            var _local_3:int = Direction360._SafeStr_18792((k - this._currentLocation.x), (_arg_2 - this._currentLocation.y));
            var _local_4:int = Direction360.direction360ValueToDirection8(_local_3).index();
            this._SafeStr_18838(Direction8.fromIndex(_local_4));
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((((((((("Turning to:" + _local_4) + " 360 value:") + _local_3) + " target:") + k) + ",") + _arg_2) + " location:") + this._currentLocation.x) + ",") + this._currentLocation.y));
            }
            this._SafeStr_18830--;
            return true;
        }

        public function _SafeStr_18848():Boolean
        {
            return (this._SafeStr_18833 == _SafeStr_18818) || (this._SafeStr_18833 == _SafeStr_18821);
        }

        public function _SafeStr_13250():Boolean
        {
            return ((this._SafeStr_18833 == _SafeStr_18818) || (this._SafeStr_18833 == _SafeStr_18821)) && ((this._SafeStr_18830 < _SafeStr_18813) || (_SafeStr_18700));
        }

        public function _SafeStr_18849():void
        {
            if (this._SafeStr_13250())
            {
                this._SafeStr_18833 = _SafeStr_18819;
                this._SafeStr_18832 = _SafeStr_18815;
                this._SafeStr_13252();
            }
        }

        public function _SafeStr_18850():int
        {
            return _SafeStr_18813 - this._SafeStr_18830;
        }

        public function _SafeStr_18851(k:int):void
        {
            this._SafeStr_18830 = (this._SafeStr_18830 + k);
        }

        public function _SafeStr_18749():Boolean
        {
            return this._SafeStr_18833 == _SafeStr_18820;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get mission():String
        {
            return this._mission;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get sex():String
        {
            return this._sex;
        }

        public function get score():int
        {
            return this._score;
        }

        public function get team():int
        {
            return this._team;
        }

        public function get _SafeStr_18742():int
        {
            return this._SafeStr_18830;
        }

        public function get _SafeStr_12584():int
        {
            return this._SafeStr_18829;
        }

        public function get posture():String
        {
            if (this._SafeStr_18835 > 0)
            {
                return AvatarAction.SNOWWAR_THROW;
            }
            switch (this._SafeStr_18833)
            {
                case _SafeStr_18820:
                    return AvatarAction.SNOWWAR_DIE_BACK;
                case _SafeStr_18819:
                    return AvatarAction.SNOWWAR_PICK;
            }
            if (this._SafeStr_18827)
            {
                return AvatarAction.SNOWWAR_RUN;
            }
            return AvatarAction.POSTURE_STAND;
        }

        public function get action():String
        {
            switch (this._SafeStr_18833)
            {
                case _SafeStr_18821:
                    return RoomObjectVariableEnum.FIGURE_DANCE;
            }
            return RoomObjectVariableEnum.FIGURE_DANCE;
        }

        public function get parameter():int
        {
            if (this._SafeStr_18835 > 1)
            {
                return 1;
            }
            if (this._SafeStr_18835 == 1)
            {
                return 0;
            }
            switch (this._SafeStr_18833)
            {
                case _SafeStr_18821:
                    return 1;
            }
            return 0;
        }

        override public function testSnowBallCollision(k:_SafeStr_4035):Boolean
        {
            if ((((((!(_SafeStr_18805)) && (!(this._SafeStr_18833 == _SafeStr_18820))) && (!(this._SafeStr_18833 == _SafeStr_18821))) && (!(k._SafeStr_18040 == this))) && (super.testSnowBallCollision(k))))
            {
                return true;
            }
            return false;
        }

        override public function onSnowBallHit(k:SnowWarGameStage, _arg_2:_SafeStr_4035):void
        {
            var _local_3:HumanGameObject = _arg_2._SafeStr_18040;
            this._SafeStr_18841(k, _local_3, _arg_2.direction360.index());
            _local_3._SafeStr_18842(k, this);
            SnowWarEngine._Str_4375(HabboSoundConstants.GAMES_SW_HIT1);
        }

        override public function get collisionHeight():int
        {
            return _SafeStr_18824;
        }

        public function toString():String
        {
            return ((" ref:" + _id) + "_name:") + this._name;
        }
    }
}
