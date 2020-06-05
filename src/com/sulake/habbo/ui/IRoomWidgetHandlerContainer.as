package com.sulake.habbo.ui
{
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.ISessionDataManager;
	import com.sulake.habbo.ui.IRoomWidgetFactory;
	import com.sulake.habbo.ui.IRoomWidgetHandler;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.groups.IHabboGroupsManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.avatar.IHabboAvatarEditor;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.habbo.messenger.IHabboMessenger;
    import com.sulake.habbo.moderation.IHabboModeration;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.habbo.quest.IHabboQuestEngine;
    import com.sulake.habbo.freeflowchat.IHabboFreeFlowChat;
    import flash.geom.Rectangle;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.session.RoomUserData;
	import com.sulake.habbo.ui.DesktopLayoutManager;

    public interface IRoomWidgetHandlerContainer 
    {
        function get habboTracking():IHabboTracking;
        function get roomSession():IRoomSession;
        function get sessionDataManager():ISessionDataManager;
        function get events():IEventDispatcher;
        function get roomEngine():IRoomEngine;
        function get friendList():IHabboFriendsList;
        function get avatarRenderManager():IAvatarRenderManager;
        function get inventory():IHabboInventory;
        function get toolbar():IHabboToolbar;
        function get navigator():IHabboNavigator;
        function get habboGroupsManager():IHabboGroupsManager;
        function get roomWidgetFactory():IRoomWidgetFactory;
        function get roomSessionManager():IRoomSessionManager;
        function get avatarEditor():IHabboAvatarEditor;
        function get catalog():IHabboCatalog;
        function get localization():IHabboLocalizationManager;
        function get habboHelp():IHabboHelp;
        function get config():IHabboConfigurationManager;
        function get _Str_2476():IHabboSoundManager;
        function get messenger():IHabboMessenger;
        function get moderation():IHabboModeration;
        function get windowManager():IHabboWindowManager;
        function get userDefinedRoomEvents():IHabboUserDefinedRoomEvents;
        function get connection():IConnection;
        function get gameManager():IHabboGameManager;
        function get questEngine():IHabboQuestEngine;
        function get freeFlowChat():IHabboFreeFlowChat;
        function get layoutManager():DesktopLayoutManager;
        function setRoomViewColor(_arg_1:uint, _arg_2:int):void;
        function getFirstCanvasId():int;
        function getRoomViewRect():Rectangle;
        function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent;
        function addUpdateListener(_arg_1:IRoomWidgetHandler):void;
        function removeUpdateListener(_arg_1:IRoomWidgetHandler):void;
        function isOwnerOfFurniture(_arg_1:IRoomObject):Boolean;
        function getFurnitureOwnerId(_arg_1:IRoomObject):int;
        function isOwnerOfPet(_arg_1:RoomUserData):Boolean;
        function setRoomBackgroundColor(_arg_1:int, _arg_2:int, _arg_3:int):void;
    }
}
