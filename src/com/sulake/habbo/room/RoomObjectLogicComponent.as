package com.sulake.habbo.room
{
    import com.sulake.core.runtime.Component;
    import com.sulake.room.IRoomObjectFactory;
    import com.sulake.core.utils.Map;
    import com.sulake.core.runtime.IContext;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureLogic;
    import com.sulake.habbo.room.object.RoomObjectLogicEnum;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureMultistateLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureMultiheightLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePlaceholderLogic;
    import com.sulake.habbo.room.object.logic.AvatarLogic;
    import com.sulake.habbo.room.object.logic.PetLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureRandomstateLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureCreditLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureStickieLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureExternalImageLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePresentLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureTrophyLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureEcotronBoxLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureDiceLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureHockeyScoreLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureHabbowheelLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureOneWayDoorLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePlanetSystemLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureWindowLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureRoomDimmerLogic;
    import com.sulake.habbo.room.object.logic.room.TileCursorLogic;
    import com.sulake.habbo.room.object.logic.room.SelectionArrowLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureSoundMachineLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureJukeboxLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureCrackableLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureSongDiskLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePushableLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureClothingChangeLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureCounterClockLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureScoreLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureIceStormLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureFireworksLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureRoomBillboardLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureRoomBackgroundLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureWelcomeGiftLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureFloorHoleLogic;
    import com.sulake.habbo.room.object.logic.room.RoomLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureMannequinLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureGuildCustomizedLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureGroupForumTerminalLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePetCustomizationLogic;
    import com.sulake.habbo.room.object.logic.game.GameSnowballLogic;
    import com.sulake.habbo.room.object.logic.game.GameSnowsplashLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureCuckooClockLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureVoteCounterLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureVoteMajorityLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureSoundBlockLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureRandomTeleportLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureMonsterplantSeedLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePurchasableClothingLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureRoomBackgroundColorLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureMysterboxLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureEffectboxLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureMysterytrophyLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureAchievementResolutionLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureLovelockLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureWildwestWantedLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureHweenLovelockLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureBadgeDisplayLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureHighScoreLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureInternalLinkLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureEditableInternalLinkLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureEditableRoomLinkLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureCustomStackHeightLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureYoutubeLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureRentableSpaceLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureChangeStateWhenStepOnLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureVimeoLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureCraftingGizmoLogic;
    import com.sulake.room.RoomObjectManager;
    import com.sulake.room.IRoomObjectManager;

    public class RoomObjectLogicComponent extends Component implements IRoomObjectFactory 
    {
        private var cachedEvents:Map;
        private var registeredEvents:Map;
        private var functions:Array;

        public function RoomObjectLogicComponent(k:IContext, _arg_2:uint=0)
        {
            this.cachedEvents = new Map();
            this.registeredEvents = new Map();
            this.functions = [];
            super(k, _arg_2);
        }

        public function addObjectEventListener(k:Function):void
        {
            var _local_2:String;
            if (this.functions.indexOf(k) < 0)
            {
                this.functions.push(k);
                if (k != null)
                {
                    for each (_local_2 in this.registeredEvents.getKeys())
                    {
                        events.addEventListener(_local_2, k);
                    }
                }
            }
        }

        public function removeObjectEventListener(k:Function):void
        {
            var _local_2:String;
            var _local_3:int = this.functions.indexOf(k);
            if (_local_3 >= 0)
            {
                this.functions.splice(_local_3, 1);
                if (k != null)
                {
                    for each (_local_2 in this.registeredEvents.getKeys())
                    {
                        events.removeEventListener(_local_2, k);
                    }
                }
            }
        }

        private function registerEventType(eventType:String):void
        {
            if (this.registeredEvents.getValue(eventType) == null)
            {
                this.registeredEvents.add(eventType, true);
                for each (var func:Function in this.functions)
                {
                    if (func != null)
                    {
                        events.addEventListener(eventType, func);
                    }
                }
            }
        }

        public function createRoomObjectLogic(logicKey:String):IRoomObjectEventHandler
        {
            var roomObjectLogic:IRoomObjectEventHandler;
            var classDefinition:Class;
            switch (logicKey)
            {
                case RoomObjectLogicEnum.FURNITURE_BASIC:
                    classDefinition = FurnitureLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_MULTISTATE:
                    classDefinition = FurnitureMultistateLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_MULTIHEIGHT:
                    classDefinition = FurnitureMultiheightLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_PLACEHOLDER:
                    classDefinition = FurniturePlaceholderLogic;
                    break;
                case RoomObjectLogicEnum.USER:
                case RoomObjectLogicEnum.BOT:
                case RoomObjectLogicEnum.RENTABLE_BOT:
                    classDefinition = AvatarLogic;
                    break;
                case RoomObjectLogicEnum.PET:
                    classDefinition = PetLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_RANDOMSTATE:
                    classDefinition = FurnitureRandomstateLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_CREDIT:
                    classDefinition = FurnitureCreditLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_STICKIE:
                    classDefinition = FurnitureStickieLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_EXTERNAL_IMAGE_WALLITEM:
                    classDefinition = FurnitureExternalImageLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_PRESENT:
                    classDefinition = FurniturePresentLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_TROPHY:
                    classDefinition = FurnitureTrophyLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_ECOTRON_BOX:
                    classDefinition = FurnitureEcotronBoxLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_DICE:
                    classDefinition = FurnitureDiceLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_HOCKEY_SCORE:
                    classDefinition = FurnitureHockeyScoreLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_HABBOWHEEL:
                    classDefinition = FurnitureHabbowheelLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_ONE_WAY_DOOR:
                    classDefinition = FurnitureOneWayDoorLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_PLANET_SYSTEM:
                    classDefinition = FurniturePlanetSystemLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_WINDOW:
                    classDefinition = FurnitureWindowLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_ROOMDIMMER:
                    classDefinition = FurnitureRoomDimmerLogic;
                    break;
                case RoomObjectLogicEnum.TILE_CURSOR:
                    classDefinition = TileCursorLogic;
                    break;
                case RoomObjectLogicEnum.SELECTION_ARROW:
                    classDefinition = SelectionArrowLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_SOUND_MACHINE:
                    classDefinition = FurnitureSoundMachineLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_JUKEBOX:
                    classDefinition = FurnitureJukeboxLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_CRACKABLE:
                    classDefinition = FurnitureCrackableLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_SONG_DISK:
                    classDefinition = FurnitureSongDiskLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_PUSHABLE:
                    classDefinition = FurniturePushableLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_CLOTHING_CHANGE:
                    classDefinition = FurnitureClothingChangeLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_COUNTER_CLOCK:
                    classDefinition = FurnitureCounterClockLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_SCORE:
                    classDefinition = FurnitureScoreLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_ES:
                    classDefinition = FurnitureIceStormLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_FIREWORKS:
                    classDefinition = FurnitureFireworksLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_BB:
                    classDefinition = FurnitureRoomBillboardLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_BG:
                    classDefinition = FurnitureRoomBackgroundLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_WELCOME_GIFT:
                    classDefinition = FurnitureWelcomeGiftLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_FLOOR_HOLE:
                    classDefinition = FurnitureFloorHoleLogic;
                    break;
                case RoomObjectLogicEnum.ROOM:
                    classDefinition = RoomLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_MANNEQUIN:
                    classDefinition = FurnitureMannequinLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_GUILD_CUSTOMIZED:
                    classDefinition = FurnitureGuildCustomizedLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_GROUP_FORUM_TERMINAL:
                    classDefinition = FurnitureGroupForumTerminalLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_PET_CUSTOMIZATION:
                    classDefinition = FurniturePetCustomizationLogic;
                    break;
                case RoomObjectLogicEnum.GAME_SNOWBALL:
                    classDefinition = GameSnowballLogic;
                    break;
                case RoomObjectLogicEnum.GAME_SNOWSPLASH:
                    classDefinition = GameSnowsplashLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_CUCKOO_CLOCK:
                    classDefinition = FurnitureCuckooClockLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_VOTE_COUNTER:
                    classDefinition = FurnitureVoteCounterLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_VOTE_MAJORITY:
                    classDefinition = FurnitureVoteMajorityLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_SOUNDBLOCK:
                    classDefinition = FurnitureSoundBlockLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_RANDOM_TELEPORT:
                    classDefinition = FurnitureRandomTeleportLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_MONSTERPLANT_SEED:
                    classDefinition = FurnitureMonsterplantSeedLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_PURCHASABLE_CLOTHING:
                    classDefinition = FurniturePurchasableClothingLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_BACKGROUND_COLOR:
                    classDefinition = FurnitureRoomBackgroundColorLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_MYSTERYBOX:
                    classDefinition = FurnitureMysterboxLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_EFFECTBOX:
                    classDefinition = FurnitureEffectboxLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_MYSTERYTROPHY:
                    classDefinition = FurnitureMysterytrophyLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_ACHIEVEMENT_RESOLUTION:
                    classDefinition = FurnitureAchievementResolutionLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_LOVELOCK:
                    classDefinition = FurnitureLovelockLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_WILDWEST_WANTED:
                    classDefinition = FurnitureWildwestWantedLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_HWEEN_LOVELOCK:
                    classDefinition = FurnitureHweenLovelockLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_BADGE_DISPLAY:
                    classDefinition = FurnitureBadgeDisplayLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_HIGH_SCORE:
                    classDefinition = FurnitureHighScoreLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_INTERNAL_LINK:
                    classDefinition = FurnitureInternalLinkLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_EDITABLE_INTERNAL_LINK:
                    classDefinition = FurnitureEditableInternalLinkLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_EDITABLE_ROOM_LINK:
                    classDefinition = FurnitureEditableRoomLinkLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_CUSTOM_STACK_HEIGHT:
                    classDefinition = FurnitureCustomStackHeightLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_YOUTUBE:
                    classDefinition = FurnitureYoutubeLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_RENTABLE_SPACE:
                    classDefinition = FurnitureRentableSpaceLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_CHANGE_STATE_WHEN_STEP_ON:
                    classDefinition = FurnitureChangeStateWhenStepOnLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_VIMEO:
                    classDefinition = FurnitureVimeoLogic;
                    break;
                case RoomObjectLogicEnum.FURNITURE_CRAFTING_GIZMO:
                    classDefinition = FurnitureCraftingGizmoLogic;
                    break;
            }
            if (classDefinition == null)
            {
                return null;
            }
            var logicInstance:Object = new (classDefinition)();
            if ((logicInstance is IRoomObjectEventHandler))
            {
                roomObjectLogic = (logicInstance as IRoomObjectEventHandler);
                roomObjectLogic.eventDispatcher = this.events;
                if (this.cachedEvents.getValue(logicKey) == null)
                {
                    this.cachedEvents.add(logicKey, true);
                    for each (var eventType:String in roomObjectLogic.getEventTypes())
                    {
                        this.registerEventType(eventType);
                    }
                }
                return roomObjectLogic;
            }
            return null;
        }

        public function createRoomObjectManager():IRoomObjectManager
        {
            return new RoomObjectManager();
        }
    }
}
