package com.sulake.habbo.room.object
{
    import com.sulake.core.runtime.Component;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.core.utils.Map;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDAvatarRenderManager;
    import __AS3__.vec.Vector;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.room.object.visualization.room.RoomVisualization;
    import com.sulake.habbo.room.object.visualization.room.TileCursorVisualization;
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import com.sulake.habbo.room.object.visualization.pet.AnimatedPetVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureAnimatedVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureResettingAnimatedVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurniturePosterVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureHabbowheelVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureValRandomizerVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureBottleVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurniturePlanetSystemVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureQueueTileVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurniturePartyBeamerVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureCuboidVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureGiftWrappedVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureCounterClockVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureWaterAreaVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureScoreBoardVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureFireworksVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FUrnitureGiftWrappedFireworksVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureBBVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureRoomBackgroundVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureStickieVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureMannequinVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureGuildCustomizedVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureGuildIsometricBadgeVisualization;
    import com.sulake.habbo.room.object.visualization.game.GameSnowballVisualization;
    import com.sulake.habbo.room.object.visualization.game.GameSnowSplashVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureVoteCounterVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureVoteMajorityVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureSoundblockVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureBadgeDisplayVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureYoutubeVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureExternalImageVisualization;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureBuilderPlaceholderVisualization;
    import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualizationData;
    import com.sulake.habbo.room.object.visualization.pet.AnimatedPetVisualizationData;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureMannequinVisualizationData;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData;
    import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualizationData;
    import com.sulake.habbo.room.object.visualization.room.RoomVisualizationData;
    import com.sulake.habbo.room.object.visualization.furniture.GameObjectVisualization;
    import com.sulake.room.object.visualization.utils.GraphicAssetCollection;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;

    public class RoomObjectVisualizationFactory extends Component implements IRoomObjectVisualizationFactory 
    {
        private var _habboAvatar:IAvatarRenderManager = null;
        private var _visualizationDatas:Map;
        private var _enableCaching:Boolean = true;

        public function RoomObjectVisualizationFactory(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._enableCaching = (_arg_2 == 0);
            this._visualizationDatas = new Map();
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _habboAvatar = k;
            }, false)]));
        }

        override public function dispose():void
        {
            var k:IRoomObjectVisualizationData;
            var _local_2:int;
            if (disposed)
            {
                return;
            }
            if (this._visualizationDatas != null)
            {
                k = null;
                _local_2 = 0;
                while (_local_2 < this._visualizationDatas.length)
                {
                    k = (this._visualizationDatas.getWithIndex(_local_2) as IRoomObjectVisualizationData);
                    if (k != null)
                    {
                        k.dispose();
                    }
                    _local_2++;
                }
                this._visualizationDatas.dispose();
                this._visualizationDatas = null;
            }
            super.dispose();
        }

        public function createRoomObjectVisualization(k:String):IRoomObjectGraphicVisualization
        {
            var _local_2:Class;
            switch (k)
            {
                case RoomObjectVisualizationType.ROOM:
                    _local_2 = RoomVisualization;
                    break;
                case RoomObjectVisualizationType.TILE_CURSOR:
                    _local_2 = TileCursorVisualization;
                    break;
                case RoomObjectVisualizationType.USER:
                    _local_2 = AvatarVisualization;
                    break;
                case RoomObjectVisualizationType.BOT:
                case RoomObjectVisualizationType.RENTABLE_BOT:
                    _local_2 = AvatarVisualization;
                    break;
                case RoomObjectVisualizationType.PET_ANIMATED:
                    _local_2 = AnimatedPetVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_STATIC:
                    _local_2 = FurnitureVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_ANIMATED:
                    _local_2 = FurnitureAnimatedVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_RESETTING_ANIMATED:
                    _local_2 = FurnitureResettingAnimatedVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_POSTER:
                    _local_2 = FurniturePosterVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_HABBOWHEEL:
                    _local_2 = FurnitureHabbowheelVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_VAL_RANDOMIZER:
                    _local_2 = FurnitureValRandomizerVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_BOTTLE:
                    _local_2 = FurnitureBottleVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_PLANET_SYSTEM:
                    _local_2 = FurniturePlanetSystemVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_QUEUE_TILE:
                    _local_2 = FurnitureQueueTileVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_PARTY_BEAMER:
                    _local_2 = FurniturePartyBeamerVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_CUBOID:
                    _local_2 = FurnitureCuboidVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_GIFT_WRAPPED:
                    _local_2 = FurnitureGiftWrappedVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_COUNTER_CLOCK:
                    _local_2 = FurnitureCounterClockVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_WATER_AREA:
                    _local_2 = FurnitureWaterAreaVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_SCORE_BOARD:
                    _local_2 = FurnitureScoreBoardVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_FIREWORKS:
                    _local_2 = FurnitureFireworksVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_GIFT_WRAPPED_FIREWORKS:
                    _local_2 = FUrnitureGiftWrappedFireworksVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_BB:
                    _local_2 = FurnitureBBVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_BG:
                    _local_2 = FurnitureRoomBackgroundVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_STICKIE:
                    _local_2 = FurnitureStickieVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_MANNEQUIN:
                    _local_2 = FurnitureMannequinVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_GUILD_CUSTOMIZED:
                    _local_2 = FurnitureGuildCustomizedVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_GUILD_ISOMETRIC_BADGE:
                    _local_2 = FurnitureGuildIsometricBadgeVisualization;
                    break;
                case RoomObjectVisualizationType.GAME_SNOWBALL:
                    _local_2 = GameSnowballVisualization;
                    break;
                case RoomObjectVisualizationType.GAME_SNOWSPLASH:
                    _local_2 = GameSnowSplashVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_VOTE_COUNTER:
                    _local_2 = FurnitureVoteCounterVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_VOTE_MAJORITY:
                    _local_2 = FurnitureVoteMajorityVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_SOUNDBLOCK:
                    _local_2 = FurnitureSoundblockVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_BADGE_DISPLAY:
                    _local_2 = FurnitureBadgeDisplayVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_YOUTUBE:
                    _local_2 = FurnitureYoutubeVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_EXTERNAL_IMAGE:
                    _local_2 = FurnitureExternalImageVisualization;
                    break;
                case RoomObjectVisualizationType.FURNITURE_BUILDER_PLACEHOLDER:
                    _local_2 = FurnitureBuilderPlaceholderVisualization;
                    break;
            }
            if (_local_2 == null)
            {
                return null;
            }
            var _local_3:Object = new (_local_2)();
            if ((_local_3 is IRoomObjectGraphicVisualization))
            {
                return _local_3 as IRoomObjectGraphicVisualization;
            }
            return null;
        }

        public function getRoomObjectVisualizationData(k:String, _arg_2:String, _arg_3:XML):IRoomObjectVisualizationData
        {
            var _local_6:IRoomObjectVisualizationData;
            var _local_7:AvatarVisualizationData;
            var _local_8:AnimatedPetVisualizationData;
            var _local_9:FurnitureMannequinVisualizationData;
            var _local_4:IRoomObjectVisualizationData;
            _local_4 = (this._visualizationDatas.getValue(k) as IRoomObjectVisualizationData);
            if (_local_4 != null)
            {
                return _local_4;
            }
            var _local_5:Class;
            switch (_arg_2)
            {
                case RoomObjectVisualizationType.FURNITURE_STATIC:
                case RoomObjectVisualizationType.FURNITURE_GIFT_WRAPPED:
                case RoomObjectVisualizationType.FURNITURE_BB:
                case RoomObjectVisualizationType.FURNITURE_BG:
                case RoomObjectVisualizationType.FURNITURE_STICKIE:
                case RoomObjectVisualizationType.FURNITURE_BUILDER_PLACEHOLDER:
                    _local_5 = FurnitureVisualizationData;
                    break;
                case RoomObjectVisualizationType.FURNITURE_ANIMATED:
                case RoomObjectVisualizationType.FURNITURE_RESETTING_ANIMATED:
                case RoomObjectVisualizationType.FURNITURE_POSTER:
                case RoomObjectVisualizationType.FURNITURE_HABBOWHEEL:
                case RoomObjectVisualizationType.FURNITURE_VAL_RANDOMIZER:
                case RoomObjectVisualizationType.FURNITURE_BOTTLE:
                case RoomObjectVisualizationType.FURNITURE_PLANET_SYSTEM:
                case RoomObjectVisualizationType.FURNITURE_QUEUE_TILE:
                case RoomObjectVisualizationType.FURNITURE_PARTY_BEAMER:
                case RoomObjectVisualizationType.FURNITURE_COUNTER_CLOCK:
                case RoomObjectVisualizationType.FURNITURE_WATER_AREA:
                case RoomObjectVisualizationType.FURNITURE_SCORE_BOARD:
                case RoomObjectVisualizationType.FURNITURE_FIREWORKS:
                case RoomObjectVisualizationType.FURNITURE_GIFT_WRAPPED_FIREWORKS:
                case RoomObjectVisualizationType.FURNITURE_GUILD_CUSTOMIZED:
                case RoomObjectVisualizationType.FURNITURE_GUILD_ISOMETRIC_BADGE:
                case RoomObjectVisualizationType.FURNITURE_VOTE_COUNTER:
                case RoomObjectVisualizationType.FURNITURE_VOTE_MAJORITY:
                case RoomObjectVisualizationType.FURNITURE_SOUNDBLOCK:
                case RoomObjectVisualizationType.FURNITURE_BADGE_DISPLAY:
                case RoomObjectVisualizationType.FURNITURE_EXTERNAL_IMAGE:
                case RoomObjectVisualizationType.FURNITURE_YOUTUBE:
                case RoomObjectVisualizationType.TILE_CURSOR:
                    _local_5 = AnimatedFurnitureVisualizationData;
                    break;
                case RoomObjectVisualizationType.FURNITURE_MANNEQUIN:
                    _local_5 = FurnitureMannequinVisualizationData;
                    break;
                case RoomObjectVisualizationType.ROOM:
                    _local_5 = RoomVisualizationData;
                    break;
                case RoomObjectVisualizationType.USER:
                case RoomObjectVisualizationType.BOT:
                case RoomObjectVisualizationType.RENTABLE_BOT:
                    _local_5 = AvatarVisualizationData;
                    break;
                case RoomObjectVisualizationType.PET_ANIMATED:
                    _local_5 = AnimatedPetVisualizationData;
                    break;
                case RoomObjectVisualizationType.GAME_SNOWBALL:
                case RoomObjectVisualizationType.GAME_SNOWSPLASH:
                    _local_5 = GameObjectVisualization;
                    break;
            }
            if (_local_5 == null)
            {
                return null;
            }
            _local_4 = new (_local_5)();
            if (_local_4 != null)
            {
                _local_6 = null;
                _local_6 = (_local_4 as IRoomObjectVisualizationData);
                if (!_local_6.initialize(_arg_3))
                {
                    _local_6.dispose();
                    return null;
                }
                if ((_local_6 is AvatarVisualizationData))
                {
                    _local_7 = (_local_4 as AvatarVisualizationData);
                    _local_7._Str_1458 = this._habboAvatar;
                }
                else
                {
                    if ((_local_6 is AnimatedPetVisualizationData))
                    {
                        _local_8 = (_local_4 as AnimatedPetVisualizationData);
                        _local_8._Str_14822 = assets;
                    }
                    else
                    {
                        if ((_local_6 is FurnitureMannequinVisualizationData))
                        {
                            _local_9 = (_local_4 as FurnitureMannequinVisualizationData);
                            _local_9._Str_1458 = this._habboAvatar;
                        }
                        else
                        {
                            if ((_local_6 is GameObjectVisualization))
                            {
                                GameObjectVisualization(_local_6).assets = assets;
                            }
                        }
                    }
                }
                if (this._enableCaching)
                {
                    this._visualizationDatas.add(k, _local_6);
                }
                return _local_6;
            }
            return null;
        }

        public function createGraphicAssetCollection():IGraphicAssetCollection
        {
            return new GraphicAssetCollection();
        }
    }
}
