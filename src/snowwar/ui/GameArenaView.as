package snowwar.ui
{
	import com.sulake.core.runtime.IDisposable;
	import com.sulake.room.object.visualization.IRoomObjectSprite;
	import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
	import com.sulake.room.object.visualization.IRoomObjectVisualization;
	import com.sulake.habbo.sound.HabboSoundConstants;
	import com.sulake.habbo.avatar.enum.AvatarAction;
	import com.sulake.habbo.avatar.IAvatarFigureContainer;
	import com.sulake.habbo.room.object.RoomObjectVariableEnum;
	import com.sulake.habbo.room.object.RoomPlaneParser;
	import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
	import com.sulake.room.utils.IVector3d;
	import com.sulake.room.utils.Vector3d;
	import com.sulake.room.object.IRoomObject;
	import com.sulake.room.object.IRoomObjectController;
	import com.sulake.habbo.room.RoomEngine;
	import com.sulake.habbo.room.IStuffData;
	import com.sulake.habbo.room.IRoomEngineServices;
	import com.sulake.habbo.room.IRoomCreator;
	import com.sulake.habbo.catalog.enum._SafeStr_2308;
	import flash.display.BlendMode;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	import snowwar.KeyboardListener;
	import snowwar.SnowWarEngine;
	import snowwar.SnowWarGameStage;
	import snowwar.Tile;
	import snowwar._SafeStr_4034;
	import snowwar._Str_231._SafeStr_4028;
	import snowwar._Str_231.ISnowWarGameObject;
	import snowwar._Str_254.Direction360;
	import snowwar._Str_254.Direction8;
	import snowwar._Str_39.HumanGameObject;
	import snowwar._Str_39.SnowWarGameObject;
	import snowwar._Str_39.TreeGameObject;
	import snowwar._Str_39._SafeStr_4035;
	import snowwar._Str_39._SafeStr_4671;
	import snowwar._Str_39._SafeStr_4672;
	import snowwar._Str_496.SnowWarFurnitureObject;
	import snowwar._Str_496.SnowWarGameStageMessageParser;

    public class GameArenaView implements IDisposable 
    {
        private static const _SafeStr_18716:int = 1;
        private static const TILE_CURSOR_STATE_TEAM_1:int = 3;
        private static const TILE_CURSOR_STATE_TEAM_2:int = 2;
        private static const TILE_CURSOR_STATE_TEAM_3:int = 4;
        private static const TILE_CURSOR_STATE_TEAM_4:int = 5;
        private static const _SafeStr_18717:int = 95;
        private static const _SafeStr_18718:int = 96;
        private static const _SafeStr_18719:int = 98;
        private static const _SafeStr_18720:int = 500;

        private var _snowWarEngine:SnowWarEngine;
        private var _SafeStr_18721:Array;
        private var _SafeStr_18722:Array;
        private var _SafeStr_18723:Array;
        private var _keyboardListener:KeyboardListener;
        private var _disposed:Boolean = false;
        private var _snowWarUI:SnowWarUI;
        private var _SafeStr_18726:Boolean;
        private var _stage:Stage;
        private var _specialButtonHeld:Boolean;

        public function GameArenaView(k:SnowWarEngine)
        {
            this._SafeStr_18721 = [];
            this._SafeStr_18722 = [];
            this._SafeStr_18723 = [];
            super();
            this._snowWarEngine = k;
            this._snowWarEngine.roomEngine.addObjectUpdateCategory(RoomObjectCategoryEnum.CONST_202);
        }

        public function dispose():void
        {
            this._snowWarEngine.roomEngine.disposeRoom(_SafeStr_18716);
            this._snowWarEngine.roomEngine.removeObjectUpdateCategory(RoomObjectCategoryEnum.CONST_202);
            if (this._keyboardListener)
            {
                this._keyboardListener.dispose();
                this._keyboardListener = null;
            }
            if (this._stage != null)
            {
                this._stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.onMouseMoveHandler);
                this._stage = null;
            }
            this._snowWarEngine = null;
            this._SafeStr_18721 = null;
            this._SafeStr_18722 = null;
            if (this._snowWarUI)
            {
                this._snowWarUI.dispose();
                this._snowWarUI = null;
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function init():void
        {
			HabboGamesCom.log("GameArenaView::Init()!");
            var _local_6:SnowWarFurnitureObject;
            var _local_7:int;
            var _local_8:Number;
            var _local_9:Vector3d;
            var _local_10:Vector3d;
            var _local_11:int;
            var _local_12:IStuffData;
            var _local_13:int;
            var _local_14:Number;
            this._snowWarEngine.roomEngine.setIsSelectedObjectInValidPosition = true;
            var k:SnowWarGameStage = (this._snowWarEngine.synchronizedGameArena.synchronizedGameStage() as SnowWarGameStage);
            var _local_2:SnowWarGameStageMessageParser = k._SafeStr_18703;
            var _local_3:Array = k.tileMap();
            var _local_4:RoomPlaneParser = new RoomPlaneParser();
            _local_4.initializeTileMap(_local_2.width, _local_2.height);
            var _local_5:int;
            while (_local_5 < _local_2.height)
            {
                _local_7 = 0;
                while (_local_7 < _local_2.width)
                {
                    _local_4._Str_3982(_local_7, _local_5, ((_local_3[_local_5][_local_7] == null) ? RoomPlaneParser.TILE_HOLE : 0));
                    _local_7++;
                }
                _local_5++;
            }
            _local_4.initializeFromTileData();
            this._snowWarEngine.roomEngine.initializeRoom(_SafeStr_18716, _local_4._Str_5598());
            (this._snowWarEngine.roomEngine as IRoomCreator).updateObjectRoomVisibilities(_SafeStr_18716, false);
            _local_4.dispose();
            for each (_local_6 in k._SafeStr_18703.fuseObjects)
            {
                _local_8 = (_local_6.altitude / Tile.STEP_COST);
                _local_9 = new Vector3d(_local_6.x, _local_6.y, _local_8);
                _local_10 = new Vector3d((_local_6.direction * 45));
                _local_11 = this._snowWarEngine.roomEngine.getFurnitureTypeId(_local_6.name);
                _local_12 = _local_6.extradata;
                _local_13 = 0;
                _local_14 = parseInt(_local_12.getLegacyString());
                if (!isNaN(_local_14))
                {
                    _local_13 = int(_local_14);
                }
                this._snowWarEngine.roomEngine.addObjectFurniture(_SafeStr_18716, _local_6.id, _local_11, _local_9, _local_10, _local_13, _local_12);
            }
            this._snowWarEngine.roomUI.visible = false;
            this._stage = this._snowWarEngine.context.displayObjectContainer.stage;
            this._stage.addEventListener(MouseEvent.MOUSE_MOVE, this.onMouseMoveHandler);
        }

        private function onMouseMoveHandler(k:MouseEvent):void
        {
            this._specialButtonHeld = ((k.altKey) || (k.shiftKey));
        }

        public function _SafeStr_13264(k:int):void
        {
            this._snowWarUI = new SnowWarUI(this._snowWarEngine);
            this._snowWarUI.init();
            this._SafeStr_18736();
        }

        public function disposeUI():void
        {
            if (this._snowWarUI)
            {
                this._snowWarUI.dispose();
                this._snowWarUI = null;
            }
        }

        public function update(k:uint, _arg_2:Boolean=false):void
        {
            var _local_4:_SafeStr_4028;
            var _local_5:int;
            var _local_8:SnowWarGameObject;
            var _local_10:Direction8;
            var _local_11:HumanGameObject;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            var _local_17:IRoomObject;
            var _local_18:IVector3d;
            var _local_19:*;
            var _local_20:HumanGameObject;
            var _local_21:_SafeStr_4035;
            var _local_22:_SafeStr_4672;
            var _local_23:_SafeStr_4671;
            var _local_24:TreeGameObject;
            var _local_25:Boolean;
            var _local_26:int;
            if (((_arg_2) && (this._keyboardListener)))
            {
                _local_10 = this._keyboardListener.direction;
                if (_local_10)
                {
                    _local_11 = (this._snowWarEngine.synchronizedGameArena.synchronizedGameStage().getGameObject(this._snowWarEngine.gamePlayerId) as HumanGameObject);
                    _local_12 = (_local_11.currentLocation.x / Number(Tile.COST));
                    _local_13 = (_local_11.currentLocation.y / Number(Tile.COST));
                    _local_12 = (_local_12 + (_local_10.offsetX() * 2));
                    _local_13 = (_local_13 + (_local_10.offsetY() * 2));
                    this._snowWarEngine._SafeStr_13189(_local_12, _local_13);
                }
            }
            var _local_3:int = getTimer();
            for each (_local_4 in this._snowWarEngine.synchronizedGameArena.synchronizedGameStage().resetRemovedGameObjects())
            {
                _local_14 = _local_4._SafeStr_13236;
                _local_15 = this._SafeStr_18721.indexOf(_local_14);
                if (_local_15 > -1)
                {
                    this._snowWarEngine.roomEngine.disposeObjectUser(_SafeStr_18716, _local_14);
                    this._SafeStr_18721.splice(_local_15, 1);
                }
                _local_16 = this._SafeStr_18722.indexOf(_local_14);
                if (_local_16 > -1)
                {
                    _local_17 = this._snowWarEngine.roomEngine.getRoomObject(_SafeStr_18716, _local_14, RoomObjectCategoryEnum.CONST_201);
                    _local_18 = _local_17.getLocation();
                    this._snowWarEngine.roomEngine.updateObjectUserGesture(_SafeStr_18716, _local_14, RoomObjectCategoryEnum.CONST_201);
                    this._SafeStr_18722.splice(_local_16, 1);
                    if (!SnowWarGameObject(_local_4).isActive)
                    {
                        this._snowWarEngine.roomEngine._SafeStr_7811(_SafeStr_18716, _local_14, _local_18, RoomObjectCategoryEnum.CONST_202);
                        this._SafeStr_18723.push({
                            "id":_local_14,
                            "time":_local_3,
                            "category":RoomObjectCategoryEnum.CONST_202
                        });
                    }
                }
            }
            _local_5 = (this._SafeStr_18723.length - 1);
            while (_local_5 > -1)
            {
                _local_19 = this._SafeStr_18723[_local_5];
                if ((_local_3 - _local_19.time) >= _SafeStr_18720)
                {
                    this._snowWarEngine.roomEngine.updateObjectUserGesture(_SafeStr_18716, _local_19.id, _local_19.category);
                    this._SafeStr_18723.splice(_local_5, 1);
                }
                _local_5--;
            }
            var _local_6:Array = this._snowWarEngine.synchronizedGameArena.synchronizedGameStage()._SafeStr_18711();
            var _local_7:Boolean;
            for each (_local_8 in _local_6)
            {
                _local_20 = (_local_8 as HumanGameObject);
                if (_local_20)
                {
                    _local_25 = (_local_20.posture == AvatarAction.SNOWWAR_RUN);
                    _local_7 = ((_local_7) || (_local_25));
                    this._SafeStr_18728(_local_20);
                    if (_local_20._SafeStr_13236 == this._snowWarEngine.gamePlayerId)
                    {
                        _local_26 = (this._snowWarEngine.synchronizedGameArena.getExtension() as _SafeStr_4034)._SafeStr_13253();
                        this._snowWarUI._SafeStr_18740 = (this._snowWarEngine.gameDuration - ((this._snowWarEngine.currentSubTurn * _local_26) / 1000));
                        this._snowWarUI._SafeStr_18741 = _local_20.score;
                        this._snowWarUI._SafeStr_18742 = _local_20._SafeStr_18742;
                        this._snowWarUI._SafeStr_12584 = _local_20._SafeStr_12584;
                    }
                }
                _local_21 = (_local_8 as _SafeStr_4035);
                if (_local_21)
                {
                    this._SafeStr_18729(_local_21);
                }
                _local_22 = (_local_8 as _SafeStr_4672);
                if (_local_22)
                {
                    this._SafeStr_18730(_local_22);
                }
                _local_23 = (_local_8 as _SafeStr_4671);
                if (_local_23)
                {
                    this._SafeStr_18731(_local_23);
                }
                _local_24 = (_local_8 as TreeGameObject);
                if (_local_24)
                {
                    this._SafeStr_18732(_local_24);
                }
            }
            if (this._snowWarUI)
            {
                this._snowWarUI.update(k);
            }
            if (((_local_7) && (!(this._SafeStr_18726))))
            {
                this._SafeStr_18726 = true;
                SnowWarEngine._Str_4375(HabboSoundConstants.GAMES_SW_WALK, int.MAX_VALUE);
            }
            else
            {
                if (((!(_local_7)) && (this._SafeStr_18726)))
                {
                    this._SafeStr_18726 = false;
                    SnowWarEngine._Str_25775(HabboSoundConstants.GAMES_SW_WALK);
                }
            }
            var _local_9:HumanGameObject = this._snowWarEngine._SafeStr_13187();
            this._snowWarEngine.roomEngine.updateObjectUserEffect(_SafeStr_18716, _local_9._SafeStr_13236, ((_local_9.team == 1) ? _SafeStr_18718 : _SafeStr_18717));
        }

        private function _SafeStr_18728(k:HumanGameObject):void
        {
            var _local_9:IAvatarFigureContainer;
            var _local_10:Boolean;
            var _local_11:IRoomObjectSpriteVisualization;
            var _local_12:Boolean;
            var _local_2:Number = (k.currentLocation.x / Number(Tile.COST));
            var _local_3:Number = (k.currentLocation.y / Number(Tile.COST));
            var _local_4:int = k._SafeStr_13236;
            var _local_5:int = k._SafeStr_18743();
            var _local_6:int = Direction360.direction8ToDirection360Value(Direction8.fromIndex(_local_5));
            var _local_7:IVector3d = new Vector3d(_local_6, 0, 0);
            if (this._SafeStr_18721.indexOf(_local_4) == -1)
            {
                _local_9 = this._snowWarEngine.avatarRenderManager._Str_718(k.figure);
                switch (k.team)
                {
                    case 1:
                        _local_9._Str_830("ch", 20000, [1]);
                        break;
                    case 2:
                        _local_9._Str_830("ch", 20001, [1]);
                        break;
                    default:
                        _local_9._Str_830("ch", 20000, [1]);
                }
                this._snowWarEngine.roomEngine.addObjectUser(_SafeStr_18716, _local_4, new Vector3d(_local_2, _local_3, 0), _local_7, _local_6, 1, _local_9.getFigureString());
                this._snowWarEngine.roomEngine.updateObjectUserPosture(_SafeStr_18716, _local_4, "std");
                this._snowWarEngine.roomEngine.updateObjectUserAction(_SafeStr_18716, _local_4, RoomObjectVariableEnum.FIGURE_IS_PLAYING_GAME, 1);
                this._SafeStr_18721.push(_local_4);
                switch (k._SafeStr_18745)
                {
                    case _SafeStr_2308._SafeStr_10198:
                        this._SafeStr_18734(this._SafeStr_18733(_local_4));
                        break;
                    case _SafeStr_2308._SafeStr_7300:
                        this._SafeStr_18735(this._SafeStr_18733(_local_4));
                        break;
                }
            }
            else
            {
                this._snowWarEngine.roomEngine.updateObjectUser(_SafeStr_18716, _local_4, new Vector3d(_local_2, _local_3, 0), new Vector3d(_local_2, _local_3, 0), false, 0, _local_7, _local_6);
                this._snowWarEngine.roomEngine.updateObjectUserPosture(_SafeStr_18716, _local_4, k.posture);
                _local_10 = ((!(k.posture == AvatarAction.SNOWWAR_DIE_BACK)) && (!(k.posture == AvatarAction.SNOWWAR_DIE_FRONT)));
                this._snowWarEngine.roomEngine.updateObjectUserAction(_SafeStr_18716, _local_4, RoomObjectVariableEnum.FIGURE_IS_PLAYING_GAME, int(_local_10));
            }
            var _local_8:IRoomObject = this._SafeStr_18733(_local_4);
            if (_local_8 != null)
            {
                _local_11 = (_local_8.getVisualization() as IRoomObjectSpriteVisualization);
                _local_11.getSprite(0).alpha = ((k._SafeStr_18748) ? 100 : 0xFF);
                _local_12 = (!(k.team == this._snowWarEngine._SafeStr_13187().team));
                if (_local_12)
                {
                    if (((((this._snowWarEngine.roomEngine as IRoomEngineServices).playerUnderCursor == _local_4) && (!(k._SafeStr_18748))) && (!(k._SafeStr_18749()))))
                    {
                        this._snowWarEngine.roomEngine.updateObjectUserEffect(_SafeStr_18716, _local_4, _SafeStr_18719);
                    }
                    else
                    {
                        this._snowWarEngine.roomEngine.updateObjectUserEffect(_SafeStr_18716, _local_4, 0);
                    }
                }
            }
        }

        private function _SafeStr_18729(k:_SafeStr_4035):void
        {
            var _local_2:Number = (k.location3D.x / Number(Tile.COST));
            var _local_3:Number = (k.location3D.y / Number(Tile.COST));
            var _local_4:Number = (k.location3D.z / Number(Tile.STEP_COST));
            var _local_5:Vector3d = new Vector3d(_local_2, _local_3, _local_4);
            var _local_6:int = k._SafeStr_13236;
            if (this._SafeStr_18722.indexOf(_local_6) == -1)
            {
				//Figure this out. game_snowball //DONE
                this._snowWarEngine.roomEngine._SafeStr_7811(_SafeStr_18716, _local_6, _local_5, RoomObjectCategoryEnum.CONST_201);
                this._SafeStr_18722.push(_local_6);
            }
            else
            {
				//Figure this out. RoomEngine. Names have changed /removed. Possibly need to be re-added? //DONE
                this._snowWarEngine.roomEngine._SafeStr_7817(_SafeStr_18716, _local_6, _local_5, RoomObjectCategoryEnum.CONST_201);
            }
        }

        private function _SafeStr_18730(k:_SafeStr_4672):void
        {
            var _local_2:RoomEngine = (this._snowWarEngine.roomEngine as RoomEngine);
            var _local_3:IRoomObjectController = (_local_2.getRoomObject(_SafeStr_18716, k._SafeStr_18032, RoomObjectCategoryEnum.CONST_10) as IRoomObjectController);
            if (_local_3.getState(0) != k._SafeStr_18035)
            {
                _local_2.updateObjectFurniture(_SafeStr_18716, k._SafeStr_18032, null, null, k._SafeStr_18035, null);
                _local_3.setState(k._SafeStr_18035, 0);
            }
        }

        private function _SafeStr_18731(k:_SafeStr_4671):void
        {
            var _local_2:RoomEngine = (this._snowWarEngine.roomEngine as RoomEngine);
            var _local_3:IRoomObjectController = (_local_2.getRoomObject(_SafeStr_18716, k._SafeStr_18032, RoomObjectCategoryEnum.CONST_10) as IRoomObjectController);
            var _local_4:int = (k._SafeStr_18034 - k._SafeStr_18035);
            if (((_local_3) && (!(_local_3.getState(0) == _local_4))))
            {
                _local_2.updateObjectFurniture(_SafeStr_18716, k._SafeStr_18032, null, null, _local_4, null);
                _local_3.setState(_local_4, 0);
            }
        }

        private function _SafeStr_18732(k:TreeGameObject):void
        {
            var _local_2:RoomEngine = (this._snowWarEngine.roomEngine as RoomEngine);
            var _local_3:IRoomObjectController = (_local_2.getRoomObject(_SafeStr_18716, k._SafeStr_18032, RoomObjectCategoryEnum.CONST_10) as IRoomObjectController);
            if (((_local_3) && (!(_local_3.getState(0) == k.hits))))
            {
                _local_2.updateObjectFurniture(_SafeStr_18716, k._SafeStr_18032, null, null, k.hits, null);
                _local_3.setState(k.hits, 0);
            }
        }

        private function _SafeStr_18733(k:int):IRoomObject
        {
            return this._snowWarEngine.roomEngine.getRoomObject(_SafeStr_18716, k, RoomObjectCategoryEnum.CONST_100);
        }

        private function _SafeStr_18734(k:IRoomObject):void
        {
            var _local_2:IRoomObjectSpriteVisualization;
            var _local_3:int;
            var _local_4:IRoomObjectSprite;
            if (k)
            {
                _local_2 = (k.getVisualization() as IRoomObjectSpriteVisualization);
                _local_3 = 0;
                while (_local_3 < _local_2.spriteCount)
                {
                    _local_4 = _local_2.getSprite(_local_3);
                    _local_4.blendMode = BlendMode.HARDLIGHT;
                    _local_3++;
                }
            }
        }

        private function _SafeStr_18735(k:IRoomObject):void
        {
            var _local_2:IRoomObjectSpriteVisualization;
            var _local_3:int;
            var _local_4:IRoomObjectSprite;
            if (k)
            {
                _local_2 = (k.getVisualization() as IRoomObjectSpriteVisualization);
                _local_3 = 0;
                while (_local_3 < _local_2.spriteCount)
                {
                    _local_4 = _local_2.getSprite(_local_3);
                    _local_4.visible = false;
                    _local_3++;
                }
            }
        }

        public function setChecksumIndicatorColor(k:uint):void
        {
            this._snowWarUI.setChecksumIndicatorColor(k);
        }

        private function _SafeStr_18736():void
        {
            this._snowWarUI._SafeStr_18750();
            this._snowWarUI.update(1000);
        }

        public function _SafeStr_13238(k:int):void
        {
            var _local_2:int;
            switch (k)
            {
                case 1:
                    _local_2 = TILE_CURSOR_STATE_TEAM_1;
                    break;
                case 2:
                    _local_2 = TILE_CURSOR_STATE_TEAM_2;
                    break;
                case 3:
                    _local_2 = TILE_CURSOR_STATE_TEAM_3;
                    break;
                case 4:
                    _local_2 = TILE_CURSOR_STATE_TEAM_4;
                    break;
                default:
                    _local_2 = 0;
            }
            this._snowWarEngine.roomEngine.setTileCursorState(_SafeStr_18716, _local_2);
        }

        public function _SafeStr_13225():void
        {
            if (this._snowWarUI)
            {
                this._snowWarUI._SafeStr_13225();
            }
        }

        public function _SafeStr_13237():void
        {
            if (this._snowWarUI)
            {
                this._snowWarUI._SafeStr_13237();
            }
        }

        public function _SafeStr_13280(k:Boolean):void
        {
            if (this._snowWarUI)
            {
                this._snowWarUI._SafeStr_13280(k);
            }
        }
    }
}
